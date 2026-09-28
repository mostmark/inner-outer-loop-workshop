#!/bin/bash
#
# Builds the lab guide image for linux/amd64 and linux/arm64 and pushes it as one multi-arch
# image (manifest list) to quay.io/$QUAY_USER/inner-outer-loop-lab:latest.

set -euo pipefail

# Fail if QUAY_USER is not set or empty
if [[ -z "${QUAY_USER:-}" ]]; then
  echo "Error: QUAY_USER is not set."
  echo "Please export QUAY_USER before running this script, e.g.:"
  echo "  export QUAY_USER=your-quay-username"
  exit 1
fi

IMAGE="quay.io/$QUAY_USER/inner-outer-loop-lab:latest"

# Build the site variants (whole workshop, Part 1 only, Part 2 only) that the image contains
./build-site.sh

# The manifest list needs the image name for itself. Free it if a previous build left a manifest
# list, or if the image was pulled or run locally (that stores a single-arch image under the same
# name, and "podman manifest create" then fails with "that name is already in use").
if podman manifest exists "$IMAGE"; then
  podman manifest rm "$IMAGE" >/dev/null
elif podman image exists "$IMAGE"; then
  echo "Removing the local tag $IMAGE (a single-arch image, e.g. from podman pull/run)"
  podman untag "$IMAGE" "$IMAGE"
fi

podman manifest create "$IMAGE" >/dev/null
podman build --platform linux/amd64,linux/arm64 --manifest "$IMAGE" .
podman manifest push --all "$IMAGE"

# The manifest list keeps the name; running the image locally afterwards pulls it under the same
# name again, which the next run of this script handles.
echo ""
echo "=============================================="
echo "✅ Build and push successful!"
echo "Image pushed to: $IMAGE"
echo ""
echo "You can run the container using:"
echo "  podman run --rm -p 8080:8080 $IMAGE"
echo "=============================================="
