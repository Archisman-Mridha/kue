#!/bin/sh

# Install the helm-schema CLI tool.
go install github.com/dadav/helm-schema/cmd/helm-schema@latest
PATH="$PATH:$HOME/go/bin"

#------------------------------------------ Cert Manager ------------------------------------------

# Generate CueLang types corresponding to the CertManager CRDs.
cue get go github.com/cert-manager/cert-manager/pkg/apis/acme/v1
cue get go github.com/cert-manager/cert-manager/pkg/apis/certmanager/v1

# Generate CueLang types corresponding to CertManager Helm chart values schema.

	mkdir -p .kue/
	cd ./.kue || exit 1

	# Pull the Helm repo locally.
	helm pull cert-manager --untar --repo https://charts.jetstack.io

	# Generate the values.schema.json (JSON schema) file.
	cd cert-manager || exit 1
	helm-schema

	cd ../../

	# Generate CueLang types using that values.schema.json file.
	cue import jsonschema ./.kue/cert-manager/values.schema.json -f \
		--package helm -l "#CertManagerValues:" \
		--outfile ./lib/schemas/helm/cert-manager.values.cue

	# Initially, all the fields are marked as required. However, we want to make those fields
	# optional, which correspond to the values specified in the default values.yaml.
	#
	# For now (as a hack), I am marking all the fields optional.
	sed -i '' 's/!:/?:/g' ./lib/schemas/helm/cert-manager.values.cue

#--------------------------------------------- Argo CD ---------------------------------------------

# Generate CueLang types corresponding to the ArgoCD CRDs.
cue get go github.com/argoproj/argo-cd/v2/pkg/apis/application/v1alpha1

# Generate CueLang types corresponding to ArgoCD Helm chart values schema.

	mkdir -p .kue/
	cd ./.kue || exit 1

	# Pull the Helm repo locally.
	helm pull oci://ghcr.io/argoproj/argo-helm/argo-cd --untar

	# Generate the values.schema.json (JSON schema) file.
	cd argo-cd || exit 1
	helm-schema

	cd ../../

	# Generate CueLang types using that values.schema.json file.
	cue import jsonschema ./.kue/argo-cd/values.schema.json -f \
		--package helm -l "#ArgoCDValues:" \
		--outfile ./lib/schemas/helm/argo-cd.values.cue

	# Initially, all the fields are marked as required. However, we want to make those fields
	# optional, which correspond to the values specified in the default values.yaml.
	#
	# For now (as a hack), I am marking all the fields optional.
	sed -i '' 's/!:/?:/g' ./lib/schemas/helm/argo-cd.values.cue
