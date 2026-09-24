#!/bin/bash
#
# Builds the lab guide site in three variants, all from the committed content (Antora reads the
# Git repository, so commit your changes first):
#
#   www/        the whole workshop (Part 1 Inner Loop and Part 2 Outer Loop)
#   www-inner/  Part 1 only
#   www-outer/  Part 2 only
#
# The container image contains all three; the WORKSHOP_PART environment variable of the container
# (set by the lab-guide chart) selects the one that is served.

set -euo pipefail

if command -v antora >/dev/null 2>&1; then
  ANTORA=(antora)
else
  ANTORA=(npx --yes -p @antora/cli@3.1 -p @antora/site-generator@3.1 antora)
fi

rm -rf www www-inner www-outer
for part in all inner outer; do
  dir=www
  [[ "$part" != "all" ]] && dir="www-$part"
  echo "Building WORKSHOP_PART=$part into $dir/"
  WORKSHOP_PART="$part" "${ANTORA[@]}" generate site.yml --to-dir "$dir" --log-failure-level=warn
done
