package lib

import (
	"github.com/archisman-mridha/kue/poc/lib/schemas/kue:kue"
	"github.com/archisman-mridha/kue/poc/lib/schemas/helm:helm"
	argoCDV1Alpha1 "github.com/argoproj/argo-cd/v2/pkg/apis/application/v1alpha1"
)

#ArgoCD: {
	helmInstallation: kue.#HelmInstallation & {
		repoURL: "https://argoproj.github.io/argo-helm"
		chartPath: "argo-cd"
		version: "7.7.11"

		namespace: "cert-manager"

		values: helm.#ArgoCDValues & {
      // Enable monitoring for all the components.
			server: serviceMonitorEnabled
      controller: serviceMonitorEnabled
      dex: serviceMonitorEnabled
      redis: serviceMonitorEnabled
      repoServer: serviceMonitorEnabled
      notifications: serviceMonitorEnabled
		}
	}

	defaultProject: argoCDV1Alpha1.#AppProject & {
		metadata: name: "default"

		spec: {
			sourceRepos: ["*"]
			destinations: [{ namespace: "*", server: "*" }]
			clusterResourceWhitelist: [{ group: "*", kind: "*" }]

			// Orphaned Kubernetes resource is a top-level namespaced resource which does not belong to
			// any Argo CD Application. The Orphaned Resources Monitoring feature allows detecting
			// orphaned resources, inspect/remove resources using Argo CD UI and generate a warning.
			orphanedResources: {
				warn: true
			}
		}
	}
}

serviceMonitorEnabled: metrics: serviceMonitor: enabled: true
