package lib

#App: {
  @app( )

  resources: {...}
}

#HelmInstallation: {
	repoURL: string
	chart: string
	version: string

  releaseName: string
	namespace: string

	values: {...}
}
