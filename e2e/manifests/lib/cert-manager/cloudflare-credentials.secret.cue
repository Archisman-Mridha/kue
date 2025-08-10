@extern(embed)

package certmanager

#CertManager: {
  cloudflareCredentials: _ @embed(file="cloudflare-credentials.sealed-secret.yaml")
}
