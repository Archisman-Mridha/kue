package lib

import (
	certManagerV1 "github.com/cert-manager/cert-manager/pkg/apis/certmanager/v1"
	acmeV1 "github.com/cert-manager/cert-manager/pkg/apis/acme/v1"
	"github.com/archisman-mridha/kue/poc/lib/schemas/kue:kue"
	"github.com/archisman-mridha/kue/poc/lib/schemas/helm:helm"
)

#CertManager: {
	helmInstallation: kue.#HelmInstallation & {
		repoURL: "https://charts.jetstack.io"
		chartPath: "cert-manager"
		version: "1.16.2"

    releaseName: "cert-manager"
		namespace: "cert-manager"

		values: helm.#CertManagerValues & {
			// CRDs should be installed as part of the Helm installation.
			// TODO : Install CRDs separately.
			crds: enabled: true

			// Enable monitoring.
			prometheus: servicemonitor: enabled: true
		}
	}

	// ClusterIssuer represents a certificate authority (CA) able to sign certificates in response to
	// Certificate Signing Requests (CSRs).
	// The ClusterIssuer resource is cluster scoped. This means that when referencing a secret via the
	// secretName field, secrets will be looked for in the Cluster Resource Namespace. By default, this
	// namespace is CertManager.
	clusterIssuer: certManagerV1.#ClusterIssuer & {
		// TODO : The CueLang code generated from the CRD, should have the apiVersion and kind field
		//				values already defined.
    apiVersion: "cert-manager.io/v1"
    kind: "ClusterIssuer"

		metadata: {
			name: "letsencrypt"

			// TODO : We can attach a CueLang attribute to the top level object of this file as such :
			//				`@namespace("cert-manager")`.
			//				So, all the Kubernetes resources and Helm installations defined in this file, will
			//				be scoped to that namespace by default (if the user hasn't explicitly specified
			//				some other namespace).
			namespace: "cert-manager"
		}

		spec: {
			// The ACME Issuer type represents a single account registered with the Automated Certificate
			// Management Environment (ACME) Certificate Authority server.
			// Certificates issued by public ACME servers are typically trusted by client's computers by
			// default.
			acme: acmeV1.#ACMEIssuer & {
				server: "https://acme-v02.api.letsencrypt.org/directory"

				// Let's Encrypt will use this to contact you about expiring certificates, and issues related
				// to your account.
				email: "archismanmridha12345@gmail.com"

				// When you create a new ACME Issuer, CertManager will generate a private key which is used to
				// identify you with the ACME server.
				privateKeySecretRef: {
					// Name of the Kubernetes Secret that will be used to store the private key.
					name: "letsencrypt-private-key"
				}

				// In order for the ACME CA server to verify that a client owns the domain, or domains, a
				// certificate is being requested for, the client must complete challenges.
				solvers: [{
					// DNS challenge solver will be used to create and manage DNS records. When a certificate
					// is requested, CertManager will create a DNS TXT record called '_acme-challenge' under
					// the domain you want a certificate for. The ACME CA (e.g. Let's Encrypt) will check for
					// the existence of that TXT record to verify that you control the domain. Once verified,
					// the CA will issue the TLS certificate. CertManager will then clean up the DNS records
					// it created.
					dns01: {
						cloudflare: {
							email: "archismanmridha12345@gmail.com"
							apiKeySecretRef: {
								name: "cloudflare-credentials"
								key: "api-key"
							}
						}
					}
				}]
			}
		}
	}
}
