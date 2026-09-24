# Screenshots to recapture

The lab guide keeps every original image. This list names each image that no longer matches
OpenShift 4.22 (grey console theme, the column-based layouts introduced in 4.21, unified
navigation without perspectives), Dev Spaces 3.30, OpenShift Pipelines 1.24, Argo CD 3.4
(OpenShift login), Service Mesh 3.4 with Kiali 2.27, Gitea 1.27, or the new per-user names
(`user1`, `my-project-user1`, `cn-project-user1`, `devspaces-user1`, `inventory-user1`). It also
lists places where the text changed but the image still shows the old flow.

How to recapture: provision a cluster with `bootstrap.sh`, open the guide with
`print-user-urls.sh` as `user1`, walk through the steps and save each capture under the **same
file name** in `content/modules/ROOT/assets/images/`, so no page needs to change. Where a priority is given, images marked
P1 contradict the text; do them first.

## Part 1: Inner Loop
Scope: the images used by `content/modules/ROOT/pages/inner-loop-0*.adoc` and `index.adoc`. Target: OpenShift 4.22
(grey console theme, column-based layouts from 4.21 on, unified navigation without perspectives) and Dev Spaces 3.30
(Che-Code). Recapture as participant `user1`: namespaces `my-project-user1`, `devspaces-user1`, `cn-project-user1`.
Keep the file names so the pages don't need changes.

Not listed because they stay valid: diagrams and logos (`coolstore-arch*.png`, `springboot-catalog-arch.png`,
`inner-loop.png`, `outer-loop.png`, `quarkus-logo.png`, `spring-boot-logo.png`, `240px-NET_Core_Logo.png`,
`nodejs-logo.png`), the button graphics (`developer-workspace-button.png`, `developer-console-button.png`), the
application UIs (`coolstore-web.png`, `inventory-quarkus.png`, `catalog-service.png`, `gateway-service.png`) and
the terminal output crops (`che-inventory-traffic.png`, `che-inventory-traffic-ko.png`).

| Image file | Page and section | What it shows | Why outdated | What the new capture must show |
|---|---|---|---|---|
| `login-with-openshift.png` | 02 Developer Workspace, "Getting your Developer Workspace" | Dev Spaces "Log in with OpenShift" page | Older OpenShift login page style | The OpenShift OAuth page reached from `devspaces.<apps domain>`, with the "Log in with OpenShift" button |
| `che-login.png` | 02, same section | OpenShift login form | Old login page; the test cluster uses a Keycloak (`rhbk`) identity provider, so there may be an IdP choice and a Keycloak form first | The login flow participants actually see (IdP choice, if any, and the username/password form), with `user1` typed in |
| `vscode-trust.png` | 02, same section | Che-Code "Do you trust the authors" dialog | Che-Code version of an older Dev Spaces | The trust dialog in Dev Spaces 3.30 for the `workshop` project |
| `vscode-settings.png` | 02, same section | VS Code welcome walkthrough with "Mark Done" | The walkthrough differs between Che-Code versions | The Dev Spaces 3.30 welcome/walkthrough and where to dismiss it. If 3.30 no longer shows it, drop the step and the image |
| `che-workspace.png` | 02, same section | Workspace IDE with the project tree | Older Che-Code UI; the project tree comes from the old repository | IDE of `wksp-end-to-end-dev` with `/projects/workshop` (code repo `inner-outer-loop-workshop-code`) expanded to `labs/` |
| `che-runtask.png` | 02 (x2), 03 (x3), 04 (x3), 05, 07 (x2), 08 | Terminal > Run Task... menu and the devfile task list | The list shows tasks that are gone (`Catalog - Add PodAffinity`, `Catalog - Create Component`, `Gateway - Push` ...) and an older Che-Code menu | Hamburger menu > Terminal > Run Task... with the new devfile's task list (`devfile: OpenShift - Login`, `OpenShift - Create Development Project`, `Inventory - ...`, `Catalog - ...`) |
| `openshift-empty-project.png` | 02, "Log in to the OpenShift Console" | Empty Topology of the development project | Pre-4.21 console layout (Developer perspective style), old project name | 4.22 Workloads > Topology of an empty `my-project-user1` with the project selector visible |
| `inventory-quarkus-project.png` | 03, "Quarkus Maven Project" | Explorer tree of `inventory-quarkus` | Older Che-Code UI (minor) | Explorer tree of `labs/inventory-quarkus` in Dev Spaces 3.30 |
| `che-open-8080-link.png` | 03, "Enable the Development Mode" | Pop-up offering to open port 8080 | Older Che-Code notification | The Dev Spaces 3.30 notification for endpoint `8080-port` with "Open in New Tab" |
| `vscode-external-website.png` | 03, same section | "Do you want to open the external website?" dialog | Older Che-Code dialog | Same dialog in Dev Spaces 3.30, showing the endpoint URL |
| `che-quarkus-preview.png` | 03, same section | The page served by the dev mode app | Shows the Quarkus 0.25 generated start page, not what the current `index.html` of the project shows | The landing page served by `mvn quarkus:dev` of the current `inventory-quarkus` project (Quarkus 3.27) |
| `inventory-quarkus-url-unavailable.png`, `inventory-quarkus-edit-url.png`, `inventory-quarkus-edited-url.png` | 03, "Fix up the Browser URL" | Browser error page and URL bar edit (https -> http) | Old endpoint host names. Dev Spaces 3.30 serves endpoints through its HTTPS gateway, so the problem may not happen anymore | Check on the cluster first. If the https upgrade problem still happens, capture it with the new endpoint URL. If it doesn't, remove the subsection and the three images (content decision) |
| `openshift-inventory-topology.png` | 03, "Test your Service" | Topology with the inventory Deployment and its Open URL icon | Pre-4.21 console look | 4.22 Topology of `my-project-user1` with `inventory-coolstore` (D) and the Open URL decorator highlighted |
| `springboot-catalog-project.png` | 04, "Spring Boot Maven Project" | Explorer tree of `catalog-spring-boot` | Older Che-Code UI (minor) | Explorer tree of `labs/catalog-spring-boot` in Dev Spaces 3.30 |
| `che-open-9000-link.png` | 04, "Create a RESTful Service" (run step) | Pop-up offering to open port **9000** | The text (kept from the old guide) says port 8080 and the app listens on 8080 | The notification for endpoint `8080-port` when `Catalog - Run` starts |
| `che-preview-na.png` | 04, NOTE after "Your browser will be directed..." | Old Che "preview not available" page | Old Che UI. The old NOTE had no text; a one-line explanation was added | What Dev Spaces 3.30 shows when the endpoint isn't ready yet, or remove the NOTE if no such page appears |
| `openshift-catalog-topology.png` | 04, "Test your Service" | Topology with catalog | Pre-4.21 console look | 4.22 Topology with `catalog-coolstore` (D) and its Open URL decorator |
| `dotnet-gateway-project.png` | 05, ".NET Gateway Project" | Explorer tree of `gateway-dotnet` | Older Che-Code UI (minor) | Explorer tree of `labs/gateway-dotnet` in Dev Spaces 3.30 |
| `openshift-gateway-topology.png` | 05, "Test your Service" | Topology with gateway | Pre-4.21 console look | 4.22 Topology with `gateway-coolstore` (D) and its Open URL decorator |
| `openshift-gateway-pod.png` | 05, "Service discovery" | Side panel of the gateway, pod link | Pre-4.21 side panel | 4.22 Topology side panel of `gateway-coolstore`, Resources tab, pod link |
| `openshift-gateway-pod-terminal.png` | 05, "Service discovery" | Pod details Terminal tab | Pre-4.21 pod details layout | 4.22 pod details of the gateway pod, Terminal tab, with the `curl` to `inventory-coolstore:8080` run |
| `openshift-add-from-git.png` | 06, "Deploy on OpenShift" | Developer "+Add" page with the Import from Git tile | The Developer perspective and its +Add page layout are gone in 4.22; the text now says "(+) Quick create button in the masthead > Import from Git" | The 4.22 masthead Quick create (+) menu opened, with "Import from Git" highlighted |
| `openshift-add-http-route.png` | 06, same section | Import from Git form, advanced Routing options, Secure Route | Pre-4.21 form layout; old repository URL | The 4.22 Import from Git form with Git Repo URL `https://github.com/mostmark/inner-outer-loop-workshop-code`, Git reference `main`, context dir `/labs/web-nodejs`, and the Secure Route checkbox cleared |
| `openshift-web-topology.png` | 06 and 08, "Test your Service" | Topology with the whole coolstore application | Pre-4.21 console look; in 08 the databases appear as DC | 4.22 Topology with web, gateway, catalog, inventory (and in 08 the two database Deployments) and the Open URL icon of `web-coolstore` |
| `openshift-inventory-pod.png` | 07, "Understanding Liveness Probes" | Side panel Resources tab with the pod link | Pre-4.21 side panel | 4.22 side panel of `inventory-coolstore`, Resources tab, pod `inventory-coolstore-xxxxxxxxxx-xxxxx` |
| `openshift-inventory-delete-pod.png` | 07, same section | Pod Actions > Delete Pod | Pre-4.21 Actions menu | 4.22 pod details page, Actions menu open, "Delete Pod" highlighted |
| `openshift-scale-out-inventory.png` | 07, "Understanding Readiness Probes" | Details tab with the pod ring and up/down arrows | Pre-4.21 layout; the text now says "pod ring" instead of "blue circle" | 4.22 side panel Details tab of `inventory-coolstore` with 2 pods and the scale arrows |
| `openshift-inventory-edit-health.png` | 07, "Configuring Liveness Probes" | Edit Health Checks page | Pre-4.21 form | 4.22 "Edit health checks" page of `inventory-coolstore` with the three probes set by `quarkus-smallrye-health` |
| `openshift-inventory-view-health.png` | 07, same section | Liveness probe form | Pre-4.21 form | 4.22 liveness probe form expanded (path `/q/health/live`, port 8080) |
| `openshift-catalog-edit-health.png` | 07, "Catalog Services Probes" | Edit Health Checks of catalog | Pre-4.21 form | 4.22 "Edit health checks" page of `catalog-coolstore` |
| `openshift-pod-details.png` | 07, "Monitoring Applications Metrics" | Pod Metrics tab graphs | Pre-4.21 layout; the old text also mentioned the Details tab of earlier consoles (removed) | 4.22 pod details, Metrics tab, with memory/CPU/network graphs |
| `openshift-add-database.png` | 08, "Create Databases for Inventory and Catalog" | Developer Catalog filtered on Databases | Catalog renamed and moved (Software Catalog); shows the old `MariaDB (Ephemeral)`/`PostgreSQL (Ephemeral)` samples, which create DeploymentConfigs | 4.22 Software Catalog, Databases category, with the tiles "Coolstore MariaDB (Ephemeral)" and "Coolstore PostgreSQL (Ephemeral)" visible |
| `openshift-inventory-mariadb-topology.png` | 08, same section | Topology with `DC invent...ariadb` and side panel `DC inventory-mariadb`, pod `inventory-mariadb-1-t9n5n` | Shows a **DeploymentConfig**; the new template creates a Deployment | 4.22 Topology with `inventory-mariadb` as **D** (Deployment), Resources tab with pod and Service (port 3306) |
| `openshift-catalog-postgresql-topology.png` | 08, same section | Topology with the PostgreSQL DC | DeploymentConfig and old template | 4.22 Topology with `catalog-postgresql` as **D**, Resources tab with pod and Service (port 5432) |
| `openshift-create-configmap.png` | 08, Inventory and Catalog configuration (x2) | Workloads > ConfigMaps list with the Create button | Pre-4.21 list layout, old project name | 4.22 Workloads > ConfigMaps of `my-project-user1` with "Create ConfigMap" highlighted |
| `config-psql-secret.png` | 08, "Explore Sensitive Configuration Data" | DC Environment tab with secret refs | Shows a DeploymentConfig ("DC catalog-postgresql") | 4.22 Deployment details of `catalog-postgresql`, Environment tab, variables from Secret `catalog-postgresql` |

### Text changed, image still shows the old flow

| Image file | Page and section | Text change | Image problem |
|---|---|---|---|
| `che-runtask.png` | 02, "Connect Your Workspace..." (second tabs block) | `OpenShift - Create Development Project` now switches to the pre-created `my-project-<user>` | Task list is from the old devfile (see above) |
| `openshift-add-from-git.png` | 06 | "(+) Quick create > Import from Git" instead of the +Add page | Shows the +Add page |
| `openshift-add-database.png`, `openshift-*-topology.png` (08) | 08 | Templates "Coolstore MariaDB/PostgreSQL (Ephemeral)", versions `10.5-el9` / `15-el9`, Deployments | Show the old samples, `10.3-el8`/`10-el8` defaults and DC badges |
| `config-psql-secret.png` | 08 | "click on the (D) catalog-postgresql Deployment ... Environment" | Shows "DC catalog-postgresql" |
| `che-open-9000-link.png` | 04 | Text says port 8080 (unchanged, already correct) | Shows port 9000 |

## Part 2: Outer Loop
Scope: every image referenced by `content/modules/ROOT/pages/outer-loop-0*.adoc`. Target: OCP 4.22
console (grey theme, current column layouts), Dev Spaces 3.30 / che-code, Pipelines 1.24 Pipeline
builder, Argo CD 3.x (OpenShift GitOps 1.21) with "LOG IN VIA OPENSHIFT", Kiali 2.27, Gitea 1.27.
Capture with a workshop user (for example `user1`), so names read `my-project-user1`,
`cn-project-user1`, `devspaces-user1`, `inventory-user1`. Old captures show `user1`, `cn-project1`,
`my-project1`, `inventory1`.

Priority: **P1** = shows a flow or object that no longer exists or contradicts the text;
**P2** = old names or old UI layout; **P3** = cosmetic or check only. Images not listed (logos
`outer-loop.png`, `tekton-logo.png`, `argocd-logo.png`, `kiali-logo.png` and the button images
`developer-*-button.png`) need no recapture.

| Image file | Page and section | What it shows | Why outdated | What the new capture must show |
|---|---|---|---|---|
| `servicemesh-architecture.png` | outer-loop-06, sidebar "OpenShift Service Mesh 3" | Istio 1.x architecture: Proxy, Pilot, Mixer, Citadel | **P1** Mixer/Pilot/Citadel no longer exist; the text now describes `istiod` | Replace with a current Istio sidecar-mode diagram: two services with Envoy sidecars, `istiod` as the single control plane (config, discovery, certificates), metrics to Prometheus/Kiali. Must be a diagram we are allowed to reuse (e.g. redrawn) |
| `che-workspace.png` | outer-loop-02, Open your Developer Workspace | Dev Spaces IDE with the imported project | **P2** check against Dev Spaces 3.30 che-code look | IDE of `wksp-end-to-end-dev` with the `workshop` project tree |
| `che-runtask.png` | outer-loop-02 (x2), -03, -04 (x3), -05, -06 | VS Code menu Terminal -> Run Task... | **P3** newer VS Code menus; used 8 times | Terminal -> Run Task... menu in che-code 3.30, ideally with the `devfile:` task list |
| `openshift-inner-loop-coolstore.png` | outer-loop-02, Log in to the OpenShift Console | Topology of the dev project, route icon on web-coolstore circled | **P1** databases shown as **DC** (DeploymentConfig) | Topology of `my-project-<user>` with all Deployments (`D`) incl. `catalog-postgresql` / `inventory-mariadb`, route icon on web-coolstore highlighted |
| `inventory-quarkus-url-unavailable.png`, `inventory-quarkus-edit-url.png`, `inventory-quarkus-edited-url.png` | outer-loop-02, Fix up the Browser URL | "Application is not available" over https, URL bar edit | **P3** shared with Part 1; check host names (old `my-project1`) | Same flow with `-<user>` route host names |
| `gitea-signin.png` | outer-loop-03, Create a Git Repository | Gitea home with Register / Sign In | **P2** old Gitea UI; shows "Register" (self-registration is disabled now) | Gitea 1.27 home page with "Sign In" highlighted, no Register link |
| `gitea-create-repository.png` | outer-loop-03, Create a Git Repository | `+` -> New Repository and form | **P2** old Gitea UI, owner `user1` | Gitea 1.27 "+" menu -> New Repository, owner `<user>`, name `inventory-quarkus`, default branch `main` |
| `cd-gitea-inventory-repo.png` | outer-loop-03, Push Inventory Code | inventory-quarkus repo file list | **P2** branch `master`, old UI | Repo `<user>/inventory-quarkus` on branch `main` |
| `tekton-architecture.png` | outer-loop-03, What is OpenShift Pipelines? | Tekton concepts diagram | **P3** check whether it shows PipelineResources (removed); text now mentions Params/Workspaces | If PipelineResources appear: Task/Pipeline/TaskRun/PipelineRun with Workspaces and Params |
| `openshift-staging-project.png` | outer-loop-03, Switch to the Staging Environment | Topology project drop-down | **P2** `cn-project1` | Workloads -> Topology with project drop-down showing `cn-project-<user>` |
| `openshift-create-pipeline.png` | outer-loop-03, Create a Pipeline | Pipelines page, Create -> Pipeline | **P2** old names; check 4.22 menu (Pipelines -> Pipelines -> Create -> Pipeline) | Pipelines list in `cn-project-<user>` with the Create menu open |
| `openshift-add-pipeline-name.png`, `openshift-add-pipeline-workspace.png`, `openshift-add-pipeline-task.png`, `openshift-add-task.png` | outer-loop-03, Create a Pipeline | Pipeline builder: name, Workspaces, Add task, blue "+" | **P2** check Pipelines 1.24 builder layout | Same steps in the Pipelines 1.24 console plugin |
| `openshift-add-git-clone-task.png` | outer-loop-03, Create a Pipeline | Task quick search: `git-clone` Red Hat 0.4.1 vs Community vs `git-clone-1-20-0` | **P2** versions from Pipelines 1.20 | Quick search in 1.24 with the Red Hat `git-clone` selected |
| `openshift-ci-pipeline.png` | outer-loop-03, Create a Pipeline | Pipeline `git-clone -> s2i-java` | **P2** names | `inventory-pipeline` details in `cn-project-<user>` |
| `openshift-start-inventory-pipeline.png`, `openshift-inventory-pipeline-parameters.png`, `openshift-inventory-pipeline-run.png` | outer-loop-03, Run the Pipeline | Actions -> Start, VolumeClaimTemplate, run | **P2** names; s2i-java parameters may show `openjdk-21-ubi8` | Start dialog with `shared-workspace` = VolumeClaimTemplate; successful run |
| `che-gitops-export-result.png` | outer-loop-04, Export OpenShift Resources | `labs/gitops/*` file tree | **P1** contains `deploymentconfig.yaml` | Tree of `labs/gitops/<svc>-coolstore/` with `configmap.yaml` (inventory/catalog), `deployment.yaml`, `route.yaml`, `secret.yaml`, `service.yaml` only |
| `gitea-inventory-gitops-repo.png` | outer-loop-04, Push the Configuration of Inventory | inventory-gitops repo | **P1** lists `deploymentconfig.yaml`, branch `master` | `<user>/inventory-gitops` on `main` with 5 files |
| `argocd-login-page.png` | outer-loop-04, Log in to Argo CD (newly referenced, was unused) | Argo CD login with "LOGIN VIA OPENSHIFT" and a red arrow | **P2** Argo CD 2.x login page | Argo CD 3.x login page with "LOG IN VIA OPENSHIFT" highlighted |
| _(no image yet)_ | outer-loop-04, Log in to Argo CD | - | text describes the OpenShift "Authorize Access" page | Optional: OpenShift OAuth authorize page for Argo CD with "Allow selected permissions" |
| `argocd-home.png` | outer-loop-04, Log in to Argo CD | Argo CD home | **P1** Argo CD 1.8/2.0 UI, local-account login | Argo CD 3.x Applications page (empty) after SSO login as `<user>` |
| `argocd-configure-repositories.png` | outer-loop-04, Add your GitOps Repository | Settings tiles, Repositories | **P1** old Settings page | Argo CD 3.x Settings -> Repositories with "+ Connect Repo" |
| `argocd-inventory-repository.png` | outer-loop-04, Add your GitOps Repository | Connected repo | **P1** old UI, no project, `user1` URL | Connect Repo dialog (VIA HTTPS, Type git, **Project `cn-project-<user>`**, URL `http://gitea-server.gitea.svc:3000/<user>/inventory-gitops.git`) and/or the repository list with status Successful |
| `argocd-configure-application.png` | outer-loop-04, Create a GitOps Application | New App form | **P1** old UI, `inventory1`, `cn-project1` | 3.x New App panel: name `inventory-<user>`, project `cn-project-<user>`, Manual sync, repo URL, HEAD, `.`, `https://kubernetes.default.svc`, namespace `cn-project-<user>` |
| `argocd-outofsync-inventory-application.png`, `argocd-outofsync-inventory-details.png` | outer-loop-04, Create a GitOps Application | App tile / tree OutOfSync | **P1** old UI; tree may contain a DeploymentConfig node | 3.x tile and resource tree of `inventory-<user>` (Deployment, ConfigMap, Route, Secret, Service) OutOfSync |
| `argocd-cm-inventory-sync.png` | outer-loop-04, Deploy a Resource on OpenShift | Resource kebab menu -> Sync (menu on the left) | **P1** old UI | 3.x resource node three-dot menu -> Sync on the `inventory` ConfigMap, then the Synchronize panel |
| `openshift-cm-inventory-deployed.png` | outer-loop-04, Deploy a Resource on OpenShift | ConfigMaps list | **P2** names, old column layout | Workloads -> ConfigMaps in `cn-project-<user>` showing `inventory` |
| `openshift-cm-inventory-drift.png` | outer-loop-04, Recover from a Configuration Drift | ConfigMap YAML with added line | **P2** names | YAML editor of `inventory` with `simple.adhoc.change=...` inside `application.properties` |
| `argocd-cm-inventory-diff.png` | outer-loop-04, Recover from a Configuration Drift | Diff tab with Compact diff | **P1** old UI | 3.x resource panel, Diff tab, "Compact diff" checked |
| `gitea-gitops-repo.png` | outer-loop-04, Push the Coolstore Configuration | Repo list with `*-gitops` repos | **P2** old Gitea, `user1` | Gitea 1.27 `<user>` profile: `inventory-quarkus`, `inventory-gitops`, `catalog-gitops`, `gateway-gitops`, `web-gitops` |
| `argocd-outofsync-coolstore.png` | outer-loop-04, Push the Coolstore Configuration | 4 apps OutOfSync | **P1** old UI, names `inventory1` etc. | 3.x Applications page: `inventory-<user>`, `catalog-<user>`, `gateway-<user>`, `web-<user>` OutOfSync |
| `openshift-import-from-yaml.png` | outer-loop-05, Create a custom Task | Masthead (+) -> Import YAML | **P3** check 4.22 masthead | (+) menu with Import YAML highlighted |
| `openshift-argocd-task.png` | outer-loop-05, Create a custom Task | Task details | **P1** `v1beta1`, argocd `v2.2.2`, old script | Task `argocd-task-sync-and-wait` (`tekton.dev/v1`, params `application-name`/`revision`/`flags`, image `quay.io/argoproj/argocd:v3.4.7`) in `cn-project-<user>` |
| `openshift-create-configmap.png` | outer-loop-05, Create a custom Task | ConfigMaps -> Create ConfigMap | **P2** names, shared with Part 1 | Create ConfigMap in YAML view with `argocd-env-configmap` |
| `openshift-create-keyvalue-secret-menu.png` | outer-loop-05, Create a custom Task | Secrets -> Create -> Key/value secret menu | **P1** text now **inspects** the pre-created secret, no create step | Workloads -> Secrets list in `cn-project-<user>` with `argocd-env-secret` highlighted |
| `openshift-create-keyvalue-secret.png` | outer-loop-05, Create a custom Task | Key/Value form with `ARGOCD_USERNAME`/`ARGOCD_PASSWORD` | **P1** password secret no longer exists; shows the old flow | Secret details of `argocd-env-secret`, Data section with key `ARGOCD_AUTH_TOKEN` (value hidden, never reveal a real token) |
| `openshift-full-inventory-pipeline.png` | outer-loop-05, Expand your Pipeline | Builder with 4 tasks | **P2** names; argocd task params | Builder: git-clone -> s2i-java -> argocd-task-sync-and-wait (`application-name` = `inventory-<user>`) -> openshift-client |
| `openshift-run-full-inventory-pipeline.png` | outer-loop-05, Run the Full Pipeline | PipelineRun with 4 tasks | **P2** names | Successful PipelineRun of `inventory-pipeline` |
| `openshift-tekton-inventory-deployed.png` | outer-loop-05, Run the Full Pipeline | Topology of staging with inventory | **P2** names | Topology `cn-project-<user>` with `inventory-coolstore` (D) running |
| `argocd-sync-inventory-application.png`, `argocd-synced-inventory-details.png` | outer-loop-05, Run the Full Pipeline | Synced inventory app | **P1** old UI, `inventory1` | 3.x tile and tree of `inventory-<user>` Synced/Healthy |
| `openshift-coolstore-java-pipeline-run.png`, `openshift-coolstore-dotnet-pipeline-run.png`, `openshift-coolstore-nodejs-pipeline-run.png` | outer-loop-05, Deploy the whole application | PipelineRuns tab per pipeline | **P2** names, check tab label "PipelineRuns" | PipelineRuns tab of each `coolstore-*-pipeline` in `cn-project-<user>` |
| `openshift-tekton-coolstore-deployed.png` | outer-loop-05, Deploy the whole application | Topology of staging | **P2** names | Topology `cn-project-<user>` with 4 Deployments |
| `argocd-synced-coolstore.png` | outer-loop-05, Deploy the whole application | 4 apps Synced | **P1** old UI, old names | 3.x Applications page, 4 apps `<svc>-<user>` Synced/Healthy |
| `kiali-login.png` | outer-loop-06, Observability with Kiali | "Log In With OpenShift" | **P3** check Kiali 2.27 | Kiali 2.27 login page |
| `kiali-workloads.png` | outer-loop-06, Enabling Service Mesh | Workloads list, Type sort, Missing Sidecar | **P2** `user1`, `cn-project1`, leftover label `maistra.io/expose-route=true`, side menu "Graph" | Kiali 2.27 Workloads for `cn-project-<user>` sorted by Type, Missing Sidecar highlighted |
| `kiali-workload-enable-inject.png` | outer-loop-06, Enabling Service Mesh | Actions -> Enable Auto Injection | **P2** names | Kiali 2.27 workload `catalog-coolstore`, Actions menu with "Enable Auto Injection" |
| `openshift-dc-inventory-topology.png` | outer-loop-06, Checking Sidecar Configuration | Topology side panel of inventory | **P2** names (file name says "dc", content is a Deployment) | Topology of `cn-project-<user>`, side panel of `inventory-coolstore` |
| `openshift-enable-istio-inventory.png` | outer-loop-06, Checking Sidecar Configuration | Deployment YAML with inject label | **P2** names | YAML tab with `sidecar.istio.io/inject: "true"` in the Pod template labels |
| `openshift-istio-inventory.png`, `openshift-istio-inventory-details.png` | outer-loop-06, Checking Sidecar Configuration | Pods tab 2/2, containers | **P2** names | Pods tab 2/2 Ready; Pod details with application and `istio-proxy` containers |
| `openshift-add-web-envvars.png` | outer-loop-06, Updating the WebUI | Environment tab | **P2** gateway URL `istio-ingressgateway-cn-project1...` | `COOLSTORE_GW_ENDPOINT=http://istio-ingressgateway-cn-project-<user>.<apps domain>` |
| `kiali-graph.png` | outer-loop-06, Using Kiali to View the Network Topology Graph | Versioned app graph | **P2** names; Kiali 2.x calls the menu "Traffic Graph" | Traffic Graph of `cn-project-<user>`, Versioned app graph, Traffic Animation, hide expression |
| `openshift-add-from-git-catalog-go.png` | outer-loop-06, Deploy the new Catalog Service | Masthead (+) -> Import from Git | **P3** check 4.22 | (+) menu with Import from Git highlighted, project `cn-project-<user>` |
| `openshift-add-http-route.png` | outer-loop-06, Deploy the new Catalog Service | Advanced routing, Secure Route unchecked | **P3** shared with Part 1 | Same on 4.22 |
| `openshift-add-from-docker.png` | outer-loop-06, Deploy the new Catalog Service | Import from Git form, Dockerfile detected | **P2** Git URL of the old repo/branch | Form with `https://github.com/mostmark/inner-outer-loop-workshop-code.git`, ref `main`, context `/labs/catalog-go`, Dockerfile strategy, Resource type Deployment |
| `openshift-catalogv2-topology.png` | outer-loop-06, Deploy the new Catalog Service | Topology with catalog v2 | **P2** names | Topology `cn-project-<user>` with `catalog-coolstore-v2` |
| `che-gateway-traffic.png`, `che-run-gateway-90-10.png`, `che-run-gateway-100-0.png` | outer-loop-06, Generate HTTP traffic / Validate | Task list and terminal output | **P3** VS Code look | che-code 3.30 task picker and terminal output |
| `kiali-abtesting-90-10.png`, `kiali-abtesting-100-0.png` | outer-loop-06, Generate HTTP traffic / Validate | Graph with traffic distribution | **P2** names | Traffic Graph of `cn-project-<user>` with Traffic Distribution 90/10 and 0/100 |
| `kiali-edit-catalog-coolstore-vs.png` | outer-loop-06, Validate the result | Istio Config -> VirtualService YAML | **P2** names; old YAML may show `v1beta1`/`gateways: ~` | Kiali 2.27 Istio Config, `catalog-coolstore` VirtualService (`networking.istio.io/v1`) in the YAML editor with Save |
