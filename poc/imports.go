package main

import (
	// ArgoCD.
	_ "github.com/argoproj/argo-cd/v2/pkg/apis/application/v1alpha1"

	// Cert Manager.
	_ "github.com/cert-manager/cert-manager/pkg/apis/acme/v1"
	_ "github.com/cert-manager/cert-manager/pkg/apis/certmanager/v1"
)
