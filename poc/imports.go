package main

import (
	// ArgoCD.
	// TODO : Resolve conflict betwen ArgoCD and helmclient.
	// _ "github.com/argoproj/argo-cd/v2/pkg/apis/application/v1alpha1"

	// Cert Manager.
	_ "github.com/cert-manager/cert-manager/pkg/apis/acme/v1"
	_ "github.com/cert-manager/cert-manager/pkg/apis/certmanager/v1"
)
