# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

### [0.0.3](https://github.com/Archisman-Mridha/kue/compare/v0.0.2...v0.0.3) (2025-08-18)


### ♻️ Chores

* **initialization-templates:** providing root and argocd ArgoCD Applications for the development environment, when initializing a Kue project ([dfa6146](https://github.com/Archisman-Mridha/kue/commit/dfa6146e2923fa814a120b0aa3a1863dc0470632))


### 🐛 Bug Fixes

* resolving non-concrete values, before renderring an application ([1641efe](https://github.com/Archisman-Mridha/kue/commit/1641efe4414bce232c317d4678ed636d5923a09f))
* **versioning:** specifying version.txt in both packageFiles and bumpFiles sections of the standard-version config ([fcc0085](https://github.com/Archisman-Mridha/kue/commit/fcc0085fa5aa818719a2b2d4b24f34508a6b9063))


### 💫 Features

* **init:** making the cue-mod-name CLI flag optional ([3d9c038](https://github.com/Archisman-Mridha/kue/commit/3d9c038e35369d08e840a3a844c6bec2f3955d8f))
* **renderer:** adding support for rendering Kustomization + some small bug fixes + reverting release v0.0.3 ([5de2ca7](https://github.com/Archisman-Mridha/kue/commit/5de2ca7b4f4535b4c9600ed3f1c09b26e425978d))

### [0.0.2](https://github.com/Archisman-Mridha/kue/compare/v0.0.1...v0.0.2) (2025-08-12)


### ♻️ Chores

* moving files from cmd to cmd/kue ([0a33b28](https://github.com/Archisman-Mridha/kue/commit/0a33b28fd0cb479a768cf3f718ead93c598a362a))


### 📚 Documentation

* getting started ([48382bc](https://github.com/Archisman-Mridha/kue/commit/48382bc64f8b47fffd1ebb0db0f3227779405cf0))

### 0.0.1 (2025-08-11)


### 💫 Features

* implementing the `init` command ([ab92737](https://github.com/Archisman-Mridha/kue/commit/ab92737a7169bddf924c85a17ba3c835b4d284ca))
* implementing the `render` and `vendor crds` commands ([5fa09de](https://github.com/Archisman-Mridha/kue/commit/5fa09de9161e9a3bc5e1852ddbe67f9f19901bc3))


### 🐛 Bug Fixes

* **linting:** golangci-lint configuration file name and lint errors ([29c041d](https://github.com/Archisman-Mridha/kue/commit/29c041d732e76f47d9a3919055505780d3018614))


### ♻️ Chores

* ignoring errors returned from cobra.Command methods used to instruct shell completion implementations ([009fb75](https://github.com/Archisman-Mridha/kue/commit/009fb75bbabb27856ca46c9f35182688b5f19864))
* **workflow:** adding a pre-commit hook to lint commit message using commitlint ([98c8b12](https://github.com/Archisman-Mridha/kue/commit/98c8b127b320d53600894076014233fa2ebb55c3))
* **workflow:** using goreleaser to publish binaries for each git tag ([44a5e4d](https://github.com/Archisman-Mridha/kue/commit/44a5e4dbb9204bfb7c4f03394b0ba06e73541353))
* **workflow:** using standard-release to trigger releases and automatically generate changelogs | removing custom parser options for commitlint ([cd07a6b](https://github.com/Archisman-Mridha/kue/commit/cd07a6bb83a1fd21b2883617d230761818665733))
