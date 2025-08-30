package production

import argocdLib "{{ .CueModName }}/lib/argocd"

{
	argoCD: argocdLib.#ArgoCD & {
		helmInstallation: values: {
			// Enable auto-scaling for the server component.
			server: autoscaling: enabled: true
		}
	} @app()
}
