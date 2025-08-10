package production

import (
	argocdLib "github.com/archisman-mridha/kue/e2e/manifests/lib/argocd"
	certManagerLib "github.com/archisman-mridha/kue/e2e/manifests/lib/cert-manager:certmanager"
)

{
	argoCD: argocdLib.#ArgoCD & {
		helmInstallation: values: {
			// Enable auto-scaling for the server component.
			server: autoscaling: enabled: true
		}
	} @app()

	certManager: certManagerLib.#CertManager @app()
}
