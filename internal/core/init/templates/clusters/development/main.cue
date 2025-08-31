package development

import (
  lib "{{ .CueModName }}/lib"

  argocdLib "{{ .CueModName }}/lib/argocd"
)

{
	argocd: lib.#App & {
    resources: argocdLib.#ArgoCD
  }
}
