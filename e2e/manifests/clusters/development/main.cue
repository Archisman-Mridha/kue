package development

import (
	lib "github.com/archisman-mridha/kue/e2e/manifests/lib"
	argocdLib "github.com/archisman-mridha/kue/e2e/manifests/lib/argocd"
	certManagerLib "github.com/archisman-mridha/kue/e2e/manifests/lib/cert-manager:certmanager"
)

{
  externalSnapshotter: lib.#ExternalSnapshotter @app( )

	argoCD: argocdLib.#ArgoCD @app( )
                            @generateArgoCDApp(argocdLib.#GenerateArgoCDAppArgs)

	certManager: certManagerLib.#CertManager @app( )
}
