package lib

import application "argoproj.io/application/v1alpha1"

#App: {
	@app( )

	resources: {...}

	argoCDAppOverrides: application.#Application
}

#HelmInstallation: {
	repoURL: string
	chart:   string
	version: string

	releaseName: string
	namespace:   string

	values: {...}
}
