package certmanager

import "github.com/archisman-mridha/kue/e2e/manifests/lib"

#CertManager: {
  namespace: string | *"cert-manager"

  helmInstallation: lib.#HelmInstallation & {
    repoURL: "https://charts.jetstack.io"
    chart: "cert-manager"
    version: "1.16.2"

    releaseName: "cert-manager"
    namespace: #CertManager.namespace

    values: {
      // CRDs should be installed as part of the Helm installation.
      // TODO : Install CRDs separately.
      crds: enabled: true

      // Enable monitoring.
      prometheus: servicemonitor: enabled: true
    }
  }
}
