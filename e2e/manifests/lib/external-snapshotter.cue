package lib

import kustomizeAPITypes "sigs.k8s.io/kustomize/api/types"

#ExternalSnapshotter: kustomization: kustomizeAPITypes.#Kustomization & {
  namespace: "external-snapshotter"

  resources: [
    "https://github.com/kubernetes-csi/external-snapshotter/client/config/crd",
    "https://github.com/kubernetes-csi/external-snapshotter/deploy/kubernetes/snapshot-controller"
  ]
}
