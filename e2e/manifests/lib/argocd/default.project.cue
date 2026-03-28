package argocd

import appProject "argoproj.io/appproject/v1alpha1"

#ArgoCD: {
	defaultProject: appProject.#AppProject & {
		metadata: {
			name:      "default"
			namespace: #ArgoCD.namespace
		}

		spec: {
			sourceRepos: ["*"]
			destinations: [{namespace: "*", server: "*"}]
			clusterResourceWhitelist: [{group: "*", kind: "*"}]

			// Orphaned Kubernetes resource is a top-level namespaced resource which does not belong to
			// any Argo CD Application. The Orphaned Resources Monitoring feature allows detecting
			// orphaned resources, inspect/remove resources using Argo CD UI and generate a warning.
			orphanedResources: {
				warn: true
			}
		}
	}
}
