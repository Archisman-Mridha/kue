package development

import argocdLib "{{ .CueModName }}/lib/argocd"

{
	argoCD: argocdLib.#ArgoCD @app()
}
