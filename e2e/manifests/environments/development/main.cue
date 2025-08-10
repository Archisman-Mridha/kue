package production

import (
	argocdLib "github.com/archisman-mridha/kue/e2e/manifests/lib/argocd"
	certManagerLib "github.com/archisman-mridha/kue/e2e/manifests/lib/cert-manager:certmanager"
)

{
	argoCD: argocdLib.#ArgoCD @app()

	certManager: certManagerLib.#CertManager @app()
}
