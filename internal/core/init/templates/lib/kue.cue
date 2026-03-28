package lib

import applicationV1Alpha1 "argoproj.io/application/v1alpha1"

#App: {
  @app( )

  resources: {...}

  overrides?: applicationV1Alpha1.#Application
}

#HelmInstallation: {
	repoURL: string
	chart: string
	version: string

  releaseName: string
	namespace: string

	values: {...}
}
