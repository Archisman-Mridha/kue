package production

import (
	lib "github.com/archisman-mridha/kue/e2e/manifests/lib"

	argocdLib "github.com/archisman-mridha/kue/e2e/manifests/lib/argocd"
	certManagerLib "github.com/archisman-mridha/kue/e2e/manifests/lib/cert-manager:certmanager"
)

{
  externalSnapshotter: lib.#App & {
    resources: lib.#ExternalSnapshotter
  }

	argocd: lib.#App & {
    resources: argocdLib.#ArgoCD & {
      helmInstallation: values: {
        // Enable auto-scaling for the server component.
        server: autoscaling: enabled: true
      }
    }
  }

	certManager: lib.#App & {
    resources: certManagerLib.#CertManager
  }
}
