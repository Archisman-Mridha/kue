package production

import (
	"github.com/archisman-mridha/kue/poc/lib:lib"
)

{
	argoCD: lib.#ArgoCD & {
		helmInstallation: values: {
			// Enable auto-scaling for the server component.
			//
			// NOTE : I noticed that the helm-schema tool generates a closed empty struct : `closed({})`
			//				for the resources field. It should at least be an open struct, so that we can
			//				modify the default CPU and memory requests and limits.
			//				We can write our own Helm values.schema.json generator, so that we have finer
			//				control, handling special conditions as above! Or we can be lazy and just open an
			//				issue at https://github.com/dadav/helm-schema.
			server: {
				autoscaling: enabled: true
			}
		}
	}

	certManager: lib.#CertManager
}
