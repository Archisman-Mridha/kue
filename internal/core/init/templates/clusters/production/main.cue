package production

import (
  lib "{{ .CueModName }}/lib"

  argocdLib "{{ .CueModName }}/lib/argocd"
)

{
	argocd: lib.#App & {
    resources: argocdLib.#ArgoCD & {
      helmInstallation: values: {
        // Enable auto-scaling for the server component.
        server: autoscaling: enabled: true
      }
    }
  }
}
