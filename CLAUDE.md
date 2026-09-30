# Inner & Outer Loop Workshop: lab guide

Antora lab guide of a two-part OpenShift developer workshop: Part 1 Inner Loop (Dev Spaces,
Quarkus, Spring Boot, .NET, Node.js, probes, configuration) and Part 2 Outer Loop (Gitea,
OpenShift Pipelines, Argo CD, Service Mesh, Kiali). It is published as the container image
`quay.io/mostmark/inner-outer-loop-lab:latest`.

Related repositories (all use only the `main` branch):

- `github.com/mostmark/inner-outer-loop-workshop-gitops`: installs the workshop on a cluster
  (operators, platform, per-user resources, this lab guide). Owns the names and services below.
- `github.com/mostmark/inner-outer-loop-workshop-code`: example code, devfile, devfile task scripts,
  pipelines and the tooling image the exercises use.

## Layout

| Path | What |
|---|---|
| `content/modules/ROOT/pages/` | the pages: `index.adoc`, `inner-loop-*.adoc` (Part 1), `outer-loop-*.adoc` (Part 2) |
| `content/modules/ROOT/nav.adoc` | navigation, one section per part (`.Part 1: ...`, `.Part 2: ...`) |
| `content/modules/ROOT/partials/_attributes.adoc` | shared derived attributes (project names, service URLs); every page includes it after its title |
| `content/modules/ROOT/assets/images/` | all images |
| `content/antora.yml` | component, version attributes, the per-user URL tokens |
| `content/lib/` | Antora extensions: tabs (`tab-block.js`), part selection (`workshop-part-extension.js`) and others |
| `content/supplemental-ui/` | additions to the Antora UI bundle; `partials/head-scripts.hbs` derives `OPENSHIFT_APPS_DOMAIN` |
| `site.yml` | Antora playbook (content source `.`, UI bundle, extensions) |
| `build-site.sh` | builds `www/` (whole workshop), `www-inner/` and `www-outer/` |
| `Containerfile`, `build-push-container.sh` | the httpd image with all three variants, pushed multi-arch to quay.io |

## Build and check

- `./build-site.sh` must finish **without warnings** (it runs Antora with `--log-failure-level=warn`,
  so broken xrefs, missing images and unresolved attributes fail the build). Antora reads the working
  copy of the checked-out branch, so uncommitted changes are included.
- `grep -rE '%[A-Z_]+%' content/modules/ROOT/pages` must find nothing.
- Publishing: `QUAY_USER=<user> ./build-push-container.sh` (needs podman). Clusters pull the image
  anew; on a running workshop restart it with `oc rollout restart deployment/lab-guide -n lab-guide`.

## Per-user values

- Participants open the guide with URL parameters `OPENSHIFT_USERNAME`, `OPENSHIFT_PASSWORD`,
  `OPENSHIFT_CONSOLE_URL` (host name, no scheme) and `OPENSHIFT_API_URL` (host:port). JavaScript in
  the Antora UI bundle replaces lowercase `%name%` tokens (mapped in `antora.yml`) in the browser.
- Pages use only AsciiDoc attributes: `{OPENSHIFT_USERNAME}`, `{OPENSHIFT_PASSWORD}`,
  `{OPENSHIFT_CONSOLE_URL}`, `{OPENSHIFT_API_URL}`, `{OPENSHIFT_APPS_DOMAIN}`, and the derived ones from
  `_attributes.adoc` (`{DEV_PROJECT}`, `{STAGING_PROJECT}`, `{CONSOLE_URL}`, ...). Never write raw
  `%NAME%` placeholders in pages.
- In source/listing blocks that contain attributes add `subs="attributes+"` (keep other subs).
- Console links: `https://{OPENSHIFT_CONSOLE_URL}/...`; application routes:
  `http://<route>-<namespace>.{OPENSHIFT_APPS_DOMAIN}`.

## Two parts, one guide

`WORKSHOP_PART` (`all`, `inner`, `outer`) selects what is built; the cluster setting is `guidePart`
in the gitops repo. A link or mention from one part to the other must be wrapped so that the
single-part builds still work:

```asciidoc
ifeval::["{workshop-part}" == "all"]
See xref:inner-loop-02-developer-workspace.adoc[...].
endif::[]
```

## Content conventions

- Keep the exercise flow, order and learning objectives.
- Command steps offer two tabs, `CLI` first (the default) and `IDE Task` second:
  `[tabs, subs="attributes+,+macros"]` with `CLI::` and `IDE Task::` items.
- Screenshots show the current OpenShift and operator UIs. Replace an outdated one under the **same
  file name**, so that no page needs to change. Take them as participant `user1`.
- Blank line before and after every list.
- Don't link to the repositories of the earlier version of this workshop; attribution is kept in the
  gitops repo's `migration/MIGRATION.md`.

## Contracts with the other repositories

Changing any of these here needs the matching change in the gitops or code repository.

- Per-user names: `my-project-<user>` (Part 1), `cn-project-<user>` (Part 2, also the participant's
  Argo CD AppProject), `devspaces-<user>`, workspace `wksp-end-to-end-dev`.
- Services: Gitea `http://gitea-server.gitea.svc:3000` (route `gitea-server-gitea.<apps domain>`),
  participant Argo CD (namespace `argocd`, route `argocd-server-argocd.<apps domain>`, "LOG IN VIA
  OPENSHIFT"), Kiali `kiali-istio-system.<apps domain>`, Dev Spaces `devspaces.<apps domain>`.
- Devfile command labels (for example "OpenShift - Login", "Inner Loop - Deploy Coolstore") are
  quoted by the guide; they are defined in the code repo's `devfile.yaml`.
- Databases: the templates "Coolstore MariaDB (Ephemeral)" and "Coolstore PostgreSQL (Ephemeral)"
  (Deployments, MariaDB 10.5, PostgreSQL 15). The inventory service uses `db-version=10.5`; open a
  database shell with `oc rsh svc/<database>`.
- Argo CD Applications are `<service>-<user>` (`inventory-<user>`, `catalog-<user>`, ...) in the
  AppProject `cn-project-<user>`.

## Git

- Only `main`; no version branches or tags, no versions in links.
- Commit messages without AI or Claude attribution.
