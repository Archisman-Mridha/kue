# Kue

**Kue helps you manage your Kubernetes cluster configuration using CueLang**.

## 📜 Prerequisites

- [timoni](https://timoni.sh/install/) installed in your system.
  > Hopefully, this'll not be a requirement anymore in Kue `v2`.

- A Git repository.

- A Kubernetes cluster.

## 🚦 Getting started

- Run `kue init` in the `manifests` directory of your Git repository, to initialize a Kue project.

- The project's folder structure will look like so :
  ```tree
  ├── manifests/
  │   ├── environments/
  │   │   ├── production/
  │   │   │   └── main.cue
  │   ├── lib/
  │   │   ├── argocd/
  │   │   │   └── *.cue
  │   │   ├── kue.cue
  │   ├── renderred/
  │   │   ├── production/
  │   │   │   └── applications/*.yaml
  ```

- Run `kue render` to render the Kubernetes manifests.

- Push the changes to remote origin.

- `kubectl apply` the `root` ArgoCD Application.

- Open ArgoCD UI and sync the `root` and `argocd` ArgoCD Applications.

> You can writeup a CI workflow, to automate renderring of the Kubernetes manifests, everytime you push changes in your Kue project.

## 👀 Examples

- [Helm interoperatability](https://github.com/Archisman-Mridha/kue/blob/main/e2e/manifests/lib/argocd/helm-installation.cue)

- [Kustomize interoperatability](https://github.com/Archisman-Mridha/kue/blob/main/e2e/manifests/lib/external-snapshotter.cue)
  > Currently, you can only refer to resources in remote Git repositories.
  > Support for specifying relative path to refer YAML document containing Kubernetes resources will be added soon.

- [Sealed Secrets interoperatability](https://github.com/Archisman-Mridha/kue/blob/main/e2e/manifests/lib/cert-manager/cloudflare-credentials.secret.cue)

## 🌐 REFERENCEs

- [The 2-Clause BSD License](https://opensource.org/license/bsd-2-clause)

- [gitmoji : An emoji guide for your commit messages](https://gitmoji.dev)

- [Go Your Own Way: Customizing Go with Environment Variables](https://medium.com/@souravchoudhary0306/go-your-own-way-customizing-go-with-environment-variables-3e47c880fe34)

- [Nixpkgs language frameworks : Go](https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/go.section.md)

- [Version and Automate ⚡️ Releases like a Pro - Walkthrough and Demo](https://www.youtube.com/watch?v=q3qE2nJRuYM)

- [Add Commitlint, Commitizen, Standard Version, and Husky to SvelteKit Project](https://dev.to/davipon/add-commitint-commitizen-standard-version-and-husky-to-sveltekit-project-14pc)

- [The Rendered Manifests Pattern (Enhancing GitOps Visibility and Control)](https://akuity.io/blog/the-rendered-manifests-pattern)
