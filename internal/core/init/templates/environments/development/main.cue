package production

import argocdLib "{{ .CueModName }}/lib/argocd"

{
	argoCD: argocdLib.#ArgoCD @app()
}
