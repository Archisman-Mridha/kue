package helm

#CertManagerValues: {
	@jsonschema(schema="http://json-schema.org/draft-07/schema#")
	close({
		// acmesolver
		//
		// +docs:section=ACME Solver
		acmesolver?: close({
			// image
			image?: close({
				// pullPolicy
				//
				// Kubernetes imagePullPolicy on Deployment.
				pullPolicy?: string | *"IfNotPresent"

				// repository
				//
				// The container image for the cert-manager acmesolver.
				// +docs:property
				repository?: string | *"quay.io/jetstack/cert-manager-acmesolver"
			})
		})

		// affinity
		//
		// A Kubernetes Affinity, if required. For more information, see
		// [Affinity v1
		// core](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.27/#affinity-v1-core).
		//
		// For example:
		// affinity:
		// nodeAffinity:
		// requiredDuringSchedulingIgnoredDuringExecution:
		// nodeSelectorTerms:
		// - matchExpressions:
		// - key: foo.bar.com/role
		// operator: In
		// values:
		// - master
		affinity?: close({})

		// approveSignerNames
		//
		// List of signer names that cert-manager will approve by default.
		// CertificateRequests
		// referencing these signer names will be auto-approved by
		// cert-manager. Defaults to just
		// approving the cert-manager.io Issuer and ClusterIssuer issuers.
		// When set to an empty
		// array, ALL issuers will be auto-approved by cert-manager. To
		// disable the auto-approval,
		// because eg. you are using approver-policy, you can enable
		// 'disableAutoApproval'.
		// ref:
		// https://cert-manager.io/docs/concepts/certificaterequest/#approval
		// +docs:property
		approveSignerNames?: [...matchN(>=1, [string, string])]

		// cainjector
		//
		// +docs:section=CA Injector
		cainjector?: close({
			// affinity
			//
			// A Kubernetes Affinity, if required. For more information, see
			// [Affinity v1
			// core](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.27/#affinity-v1-core).
			//
			// For example:
			// affinity:
			// nodeAffinity:
			// requiredDuringSchedulingIgnoredDuringExecution:
			// nodeSelectorTerms:
			// - matchExpressions:
			// - key: foo.bar.com/role
			// operator: In
			// values:
			// - master
			affinity?: close({})

			// config
			//
			// This is used to configure options for the cainjector pod.
			// It allows setting options that are usually provided via flags.
			//
			// If `apiVersion` and `kind` are unspecified they default to the
			// current latest
			// version (currently
			// `cainjector.config.cert-manager.io/v1alpha1`). You can pin
			// the version by specifying the `apiVersion` yourself.
			//
			// For example:
			// apiVersion: cainjector.config.cert-manager.io/v1alpha1
			// kind: CAInjectorConfiguration
			// logging:
			// verbosity: 2
			// format: text
			// leaderElectionConfig:
			// namespace: kube-system
			// # Configure the metrics server for TLS
			// # See
			// https://cert-manager.io/docs/devops-tips/prometheus-metrics/#tls
			// metricsTLSConfig:
			// dynamic:
			// secretNamespace: "cert-manager"
			// secretName: "cert-manager-metrics-ca"
			// dnsNames:
			// - cert-manager-metrics
			config?: close({})

			// containerSecurityContext
			//
			// Container Security Context to be set on the cainjector
			// component container
			// For more information, see [Configure a Security Context for a
			// Pod or
			// Container](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/).
			// +docs:property
			containerSecurityContext?: close({
				// allowPrivilegeEscalation
				allowPrivilegeEscalation?: bool | *false

				// capabilities
				capabilities?: close({
					// drop
					drop?: [...string & (null | bool | number | string | [...] | {
						...
					})]
				})

				// readOnlyRootFilesystem
				readOnlyRootFilesystem?: bool | *true
			})

			// enableServiceLinks
			//
			// enableServiceLinks indicates whether information about services
			// should be
			// injected into the pod's environment variables, matching the
			// syntax of Docker
			// links.
			enableServiceLinks?: bool | *false

			// enabled
			//
			// Create the CA Injector deployment
			enabled?: bool | *true

			// extraArgs
			//
			// Additional command line flags to pass to cert-manager
			// cainjector binary.
			// To see all available flags run `docker run
			// quay.io/jetstack/cert-manager-cainjector:<version> --help`.
			extraArgs?: [...null | bool | number | string | [...] | {
				...
			}]

			// extraEnv
			//
			// Additional environment variables to pass to cert-manager
			// cainjector binary.
			// For example:
			// extraEnv:
			// - name: SOME_VAR
			// value: 'some value'
			extraEnv?: [...null | bool | number | string | [...] | {
				...
			}]

			// featureGates
			//
			// Comma separated list of feature gates that should be enabled on
			// the
			// cainjector pod.
			featureGates?: string | *""

			// image
			image?: close({
				// pullPolicy
				//
				// Kubernetes imagePullPolicy on Deployment.
				pullPolicy?: string | *"IfNotPresent"

				// repository
				//
				// The container image for the cert-manager cainjector
				// +docs:property
				repository?: string | *"quay.io/jetstack/cert-manager-cainjector"
			})

			// nodeSelector
			//
			// The nodeSelector on Pods tells Kubernetes to schedule Pods on
			// the nodes with
			// matching labels.
			// For more information, see [Assigning Pods to
			// Nodes](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/).
			//
			// This default ensures that Pods are only scheduled to Linux
			// nodes.
			// It prevents Pods being scheduled to Windows nodes in a mixed OS
			// cluster.
			// +docs:property
			nodeSelector?: close({
				// kubernetes.io/os
				"kubernetes.io/os"?: string | *"linux"
			})

			// podDisruptionBudget
			podDisruptionBudget?: close({
				// enabled
				//
				// Enable or disable the PodDisruptionBudget resource.
				//
				// This prevents downtime during voluntary disruptions such as
				// during a Node upgrade.
				// For example, the PodDisruptionBudget will block `kubectl drain`
				// if it is used on the Node where the only remaining cert-manager
				// Pod is currently running.
				enabled?: bool | *false
			})

			// podLabels
			//
			// Optional additional labels to add to the CA Injector Pods.
			podLabels?: close({})

			// replicaCount
			//
			// The number of replicas of the cert-manager cainjector to run.
			//
			// The default is 1, but in production set this to 2 or 3 to
			// provide high
			// availability.
			//
			// If `replicas > 1`, consider setting
			// `cainjector.podDisruptionBudget.enabled=true`.
			//
			// Note that cert-manager uses leader election to ensure that
			// there can
			// only be a single instance active at a time.
			replicaCount?: int | *1

			// resources
			//
			// Resources to provide to the cert-manager cainjector pod.
			//
			// For example:
			// requests:
			// cpu: 10m
			// memory: 32Mi
			//
			// For more information, see [Resource Management for Pods and
			// Containers](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/).
			resources?: close({})

			// securityContext
			//
			// Pod Security Context to be set on the cainjector component Pod
			// For more information, see [Configure a Security Context for a
			// Pod or
			// Container](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/).
			// +docs:property
			securityContext?: close({
				// runAsNonRoot
				runAsNonRoot?: bool | *true

				// seccompProfile
				seccompProfile?: close({
					// type
					type?: string | *"RuntimeDefault"
				})
			})

			// serviceAccount
			serviceAccount?: close({
				// automountServiceAccountToken
				//
				// Automount API credentials for a Service Account.
				automountServiceAccountToken?: bool | *true

				// create
				//
				// Specifies whether a service account should be created.
				create?: bool | *true
			})

			// serviceLabels
			//
			// Optional additional labels to add to the CA Injector metrics
			// Service.
			serviceLabels?: close({})

			// strategy
			//
			// Deployment update strategy for the cert-manager cainjector
			// deployment.
			// For more information, see the [Kubernetes
			// documentation](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#strategy).
			//
			// For example:
			// strategy:
			// type: RollingUpdate
			// rollingUpdate:
			// maxSurge: 0
			// maxUnavailable: 1
			strategy?: close({})

			// tolerations
			//
			// A list of Kubernetes Tolerations, if required. For more
			// information, see [Toleration v1
			// core](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.27/#toleration-v1-core).
			//
			// For example:
			// tolerations:
			// - key: foo.bar.com/role
			// operator: Equal
			// value: master
			// effect: NoSchedule
			tolerations?: [...null | bool | number | string | [...] | {
				...
			}]

			// topologySpreadConstraints
			//
			// A list of Kubernetes TopologySpreadConstraints, if required.
			// For more information, see [Topology spread constraint v1
			// core](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.27/#topologyspreadconstraint-v1-core).
			//
			// For example:
			// topologySpreadConstraints:
			// - maxSkew: 2
			// topologyKey: topology.kubernetes.io/zone
			// whenUnsatisfiable: ScheduleAnyway
			// labelSelector:
			// matchLabels:
			// app.kubernetes.io/instance: cert-manager
			// app.kubernetes.io/component: controller
			topologySpreadConstraints?: [...null | bool | number | string | [...] | {
				...
			}]

			// volumeMounts
			//
			// Additional volume mounts to add to the cert-manager controller
			// container.
			volumeMounts?: [...null | bool | number | string | [...] | {
				...
			}]

			// volumes
			//
			// Additional volumes to add to the cert-manager controller pod.
			volumes?: [...null | bool | number | string | [...] | {
				...
			}]
		})

		// clusterResourceNamespace
		//
		// Override the namespace used to store DNS provider credentials
		// etc. for ClusterIssuer
		// resources. By default, the same namespace as cert-manager is
		// deployed within is
		// used. This namespace will not be automatically created by the
		// Helm chart.
		clusterResourceNamespace?: string | *""

		// config
		//
		// This property is used to configure options for the controller
		// pod.
		// This allows setting options that would usually be provided
		// using flags.
		//
		// If `apiVersion` and `kind` are unspecified they default to the
		// current latest
		// version (currently
		// `controller.config.cert-manager.io/v1alpha1`). You can pin
		// the version by specifying the `apiVersion` yourself.
		//
		// For example:
		// config:
		// apiVersion: controller.config.cert-manager.io/v1alpha1
		// kind: ControllerConfiguration
		// logging:
		// verbosity: 2
		// format: text
		// leaderElectionConfig:
		// namespace: kube-system
		// kubernetesAPIQPS: 9000
		// kubernetesAPIBurst: 9000
		// numberOfConcurrentWorkers: 200
		// featureGates:
		// AdditionalCertificateOutputFormats: true
		// DisallowInsecureCSRUsageDefinition: true
		// ExperimentalCertificateSigningRequestControllers: true
		// ExperimentalGatewayAPISupport: true
		// LiteralCertificateSubject: true
		// SecretsFilteredCaching: true
		// ServerSideApply: true
		// StableCertificateRequestName: true
		// UseCertificateRequestBasicConstraints: true
		// ValidateCAA: true
		// # Configure the metrics server for TLS
		// # See
		// https://cert-manager.io/docs/devops-tips/prometheus-metrics/#tls
		// metricsTLSConfig:
		// dynamic:
		// secretNamespace: "cert-manager"
		// secretName: "cert-manager-metrics-ca"
		// dnsNames:
		// - cert-manager-metrics
		config?: close({})

		// containerSecurityContext
		//
		// Container Security Context to be set on the controller
		// component container.
		// For more information, see [Configure a Security Context for a
		// Pod or
		// Container](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/).
		// +docs:property
		containerSecurityContext?: close({
			// allowPrivilegeEscalation
			allowPrivilegeEscalation?: bool | *false

			// capabilities
			capabilities?: close({
				// drop
				drop?: [...string & (null | bool | number | string | [...] | {
					...
				})]
			})

			// readOnlyRootFilesystem
			readOnlyRootFilesystem?: bool | *true
		})

		// crds
		crds?: close({
			// enabled
			//
			// This option decides if the CRDs should be installed
			// as part of the Helm installation.
			enabled?: bool | *false

			// keep
			//
			// This option makes it so that the "helm.sh/resource-policy":
			// keep
			// annotation is added to the CRD. This will prevent Helm from
			// uninstalling
			// the CRD when the Helm release is uninstalled.
			// WARNING: when the CRDs are removed, all cert-manager custom
			// resources
			// (Certificates, Issuers, ...) will be removed too by the garbage
			// collector.
			keep?: bool | *true
		})

		// creator
		//
		// Field used by our release pipeline to produce the static
		// manifests.
		// The field defaults to "helm" but is set to "static" when we
		// render
		// the static YAML manifests.
		// +docs:hidden
		creator?: string | *"helm"

		// disableAutoApproval
		//
		// Option to disable cert-manager's build-in auto-approver. The
		// auto-approver
		// approves all CertificateRequests that reference issuers
		// matching the 'approveSignerNames'
		// option. This 'disableAutoApproval' option is useful when you
		// want to make all approval decisions
		// using a different approver (like approver-policy -
		// https://github.com/cert-manager/approver-policy).
		disableAutoApproval?: bool | *false

		// dns01RecursiveNameservers
		//
		// A comma-separated string with the host and port of the
		// recursive nameservers cert-manager should query.
		dns01RecursiveNameservers?: string | *""

		// dns01RecursiveNameserversOnly
		//
		// Forces cert-manager to use only the recursive nameservers for
		// verification.
		// Enabling this option could cause the DNS01 self check to take
		// longer owing to caching performed by the recursive
		// nameservers.
		dns01RecursiveNameserversOnly?: bool | *false

		// enableCertificateOwnerRef
		//
		// When this flag is enabled, secrets will be automatically
		// removed when the certificate resource is deleted.
		enableCertificateOwnerRef?: bool | *false

		// enableServiceLinks
		//
		// enableServiceLinks indicates whether information about services
		// should be
		// injected into the pod's environment variables, matching the
		// syntax of Docker
		// links.
		enableServiceLinks?: bool | *false

		// enabled
		//
		// Field that can be used as a condition when cert-manager is a
		// dependency.
		// This definition is only here as a placeholder such that it is
		// included in
		// the json schema.
		// See
		// https://helm.sh/docs/chart_best_practices/dependencies/#conditions-and-tags
		// for more info.
		// +docs:hidden
		enabled?: bool | *true

		// extraArgs
		//
		// Additional command line flags to pass to cert-manager
		// controller binary.
		// To see all available flags run `docker run
		// quay.io/jetstack/cert-manager-controller:<version> --help`.
		//
		// Use this flag to enable or disable arbitrary controllers. For
		// example, to disable the CertificateRequests approver.
		//
		// For example:
		// extraArgs:
		// - --controllers=*,-certificaterequests-approver
		extraArgs?: [...null | bool | number | string | [...] | {
			...
		}]

		// extraEnv
		//
		// Additional environment variables to pass to cert-manager
		// controller binary.
		// For example:
		// extraEnv:
		// - name: SOME_VAR
		// value: 'some value'
		extraEnv?: [...null | bool | number | string | [...] | {
			...
		}]

		// extraObjects
		//
		// Create dynamic manifests via values.
		//
		// For example:
		// extraObjects:
		// - |
		// apiVersion: v1
		// kind: ConfigMap
		// metadata:
		// name: '{{ template "cert-manager.fullname" .
		// }}-extra-configmap'
		extraObjects?: [...null | bool | number | string | [...] | {
			...
		}]

		// featureGates
		//
		// A comma-separated list of feature gates that should be enabled
		// on the
		// controller pod.
		featureGates?: string | *""

		// global
		//
		// Default values for cert-manager.
		// This is a YAML-formatted file.
		// Declare variables to be passed into your templates.
		global?: close({
			// commonLabels
			//
			// Labels to apply to all resources.
			// Please note that this does not add labels to the resources
			// created dynamically by the controllers.
			// For these resources, you have to add the labels in the template
			// in the cert-manager custom resource:
			// For example, podTemplate/ ingressTemplate in
			// ACMEChallengeSolverHTTP01Ingress
			// For more information, see the [cert-manager
			// documentation](https://cert-manager.io/docs/reference/api-docs/#acme.cert-manager.io/v1.ACMEChallengeSolverHTTP01Ingress).
			// For example, secretTemplate in CertificateSpec
			// For more information, see the [cert-manager
			// documentation](https://cert-manager.io/docs/reference/api-docs/#cert-manager.io/v1.CertificateSpec).
			commonLabels?: close({})

			// imagePullSecrets
			//
			// Reference to one or more secrets to be used when pulling
			// images.
			// For more information, see [Pull an Image from a Private
			// Registry](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/).
			//
			// For example:
			// imagePullSecrets:
			// - name: "image-pull-secret"
			imagePullSecrets?: [...null | bool | number | string | [...] | {
				...
			}]

			// leaderElection
			leaderElection?: close({
				// namespace
				//
				// Override the namespace used for the leader election lease.
				namespace?: string | *"kube-system"
			})

			// logLevel
			//
			// Set the verbosity of cert-manager. A range of 0 - 6, with 6
			// being the most verbose.
			logLevel?: int | *2

			// podSecurityPolicy
			podSecurityPolicy?: close({
				// enabled
				//
				// Create PodSecurityPolicy for cert-manager.
				//
				// Note that PodSecurityPolicy was deprecated in Kubernetes 1.21
				// and removed in Kubernetes 1.25.
				enabled?: bool | *false

				// useAppArmor
				//
				// Configure the PodSecurityPolicy to use AppArmor.
				useAppArmor?: bool | *true
			})

			// priorityClassName
			//
			// The optional priority class to be used for the cert-manager
			// pods.
			priorityClassName?: string | *""

			// rbac
			rbac?: close({
				// aggregateClusterRoles
				//
				// Aggregate ClusterRoles to Kubernetes default user-facing roles.
				// For more information, see [User-facing
				// roles](https://kubernetes.io/docs/reference/access-authn-authz/rbac/#user-facing-roles)
				aggregateClusterRoles?: bool | *true

				// create
				//
				// Create required ClusterRoles and ClusterRoleBindings for
				// cert-manager.
				create?: bool | *true
			})
		})

		// hostAliases
		//
		// Optional hostAliases for cert-manager-controller pods. May be
		// useful when performing ACME DNS-01 self checks.
		hostAliases?: [...null | bool | number | string | [...] | {
			...
		}]

		// image
		image?: close({
			// pullPolicy
			//
			// Kubernetes imagePullPolicy on Deployment.
			pullPolicy?: string | *"IfNotPresent"

			// repository
			//
			// The container image for the cert-manager controller.
			// +docs:property
			repository?: string | *"quay.io/jetstack/cert-manager-controller"
		})

		// ingressShim
		//
		// +docs:ignore
		ingressShim?: close({})

		// installCRDs
		//
		// This option is equivalent to setting crds.enabled=true and
		// crds.keep=true.
		// Deprecated: use crds.enabled and crds.keep instead.
		installCRDs?: bool | *false

		// livenessProbe
		//
		// LivenessProbe settings for the controller container of the
		// controller Pod.
		//
		// This is enabled by default, in order to enable the clock-skew
		// liveness probe that
		// restarts the controller in case of a skew between the system
		// clock and the monotonic clock.
		// LivenessProbe durations and thresholds are based on those used
		// for the Kubernetes
		// controller-manager. For more information see the following on
		// the
		// [Kubernetes GitHub
		// repository](https://github.com/kubernetes/kubernetes/blob/806b30170c61a38fedd54cc9ede4cd6275a1ad3b/cmd/kubeadm/app/util/staticpod/utils.go#L241-L245)
		// +docs:property
		livenessProbe?: close({
			// enabled
			enabled?: bool | *true

			// failureThreshold
			failureThreshold?: int | *8

			// initialDelaySeconds
			initialDelaySeconds?: int | *10

			// periodSeconds
			periodSeconds?: int | *10

			// successThreshold
			successThreshold?: int | *1

			// timeoutSeconds
			timeoutSeconds?: int | *15
		})

		// maxConcurrentChallenges
		//
		// The maximum number of challenges that can be scheduled as
		// 'processing' at once.
		maxConcurrentChallenges?: int | *60

		// namespace
		//
		// This namespace allows you to define where the services are
		// installed into.
		// If not set then they use the namespace of the release.
		// This is helpful when installing cert manager as a chart
		// dependency (sub chart).
		namespace?: string | *""

		// nodeSelector
		//
		// The nodeSelector on Pods tells Kubernetes to schedule Pods on
		// the nodes with
		// matching labels.
		// For more information, see [Assigning Pods to
		// Nodes](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/).
		//
		// This default ensures that Pods are only scheduled to Linux
		// nodes.
		// It prevents Pods being scheduled to Windows nodes in a mixed OS
		// cluster.
		// +docs:property
		nodeSelector?: close({
			// kubernetes.io/os
			"kubernetes.io/os"?: string | *"linux"
		})

		// podDisruptionBudget
		podDisruptionBudget?: close({
			// enabled
			//
			// Enable or disable the PodDisruptionBudget resource.
			//
			// This prevents downtime during voluntary disruptions such as
			// during a Node upgrade.
			// For example, the PodDisruptionBudget will block `kubectl drain`
			// if it is used on the Node where the only remaining cert-manager
			// Pod is currently running.
			enabled?: bool | *false
		})

		// podLabels
		//
		// Optional additional labels to add to the controller Pods.
		podLabels?: close({})

		// prometheus
		//
		// +docs:section=Prometheus
		prometheus?: close({
			// enabled
			//
			// Enable Prometheus monitoring for the cert-manager controller
			// and webhook.
			// If you use the Prometheus Operator, set
			// prometheus.podmonitor.enabled or
			// prometheus.servicemonitor.enabled, to create a PodMonitor or a
			// ServiceMonitor resource.
			// Otherwise, 'prometheus.io' annotations are added to the
			// cert-manager and
			// cert-manager-webhook Deployments.
			// Note that you can not enable both PodMonitor and ServiceMonitor
			// as they are
			// mutually exclusive. Enabling both will result in an error.
			enabled?: bool | *true

			// podmonitor
			//
			// Note that you can not enable both PodMonitor and ServiceMonitor
			// as they are mutually exclusive. Enabling both will result in
			// an error.
			podmonitor?: close({
				// annotations
				//
				// Additional annotations to add to the PodMonitor.
				annotations?: close({})

				// enabled
				//
				// Create a PodMonitor to add cert-manager to Prometheus.
				enabled?: bool | *false

				// endpointAdditionalProperties
				//
				// EndpointAdditionalProperties allows setting additional
				// properties on the
				// endpoint such as relabelings, metricRelabelings etc.
				//
				// For example:
				// endpointAdditionalProperties:
				// relabelings:
				// - action: replace
				// sourceLabels:
				// - __meta_kubernetes_pod_node_name
				// targetLabel: instance
				// # Configure the PodMonitor for TLS connections
				// # See
				// https://cert-manager.io/docs/devops-tips/prometheus-metrics/#tls
				// scheme: https
				// tlsConfig:
				// serverName: cert-manager-metrics
				// ca:
				// secret:
				// name: cert-manager-metrics-ca
				// key: "tls.crt"
				//
				// +docs:property
				endpointAdditionalProperties?: close({})

				// honorLabels
				//
				// Keep labels from scraped data, overriding server-side labels.
				honorLabels?: bool | *false

				// interval
				//
				// The interval to scrape metrics.
				interval?: string | *"60s"

				// labels
				//
				// Additional labels to add to the PodMonitor.
				labels?: close({})

				// path
				//
				// The path to scrape for metrics.
				path?: string | *"/metrics"

				// prometheusInstance
				//
				// Specifies the `prometheus` label on the created PodMonitor.
				// This is
				// used when different Prometheus instances have label selectors
				// matching
				// different PodMonitors.
				prometheusInstance?: string | *"default"

				// scrapeTimeout
				//
				// The timeout before a metrics scrape fails.
				scrapeTimeout?: string | *"30s"
			})

			// servicemonitor
			servicemonitor?: close({
				// annotations
				//
				// Additional annotations to add to the ServiceMonitor.
				annotations?: close({})

				// enabled
				//
				// Create a ServiceMonitor to add cert-manager to Prometheus.
				enabled?: bool | *false

				// endpointAdditionalProperties
				//
				// EndpointAdditionalProperties allows setting additional
				// properties on the
				// endpoint such as relabelings, metricRelabelings etc.
				//
				// For example:
				// endpointAdditionalProperties:
				// relabelings:
				// - action: replace
				// sourceLabels:
				// - __meta_kubernetes_pod_node_name
				// targetLabel: instance
				//
				// +docs:property
				endpointAdditionalProperties?: close({})

				// honorLabels
				//
				// Keep labels from scraped data, overriding server-side labels.
				honorLabels?: bool | *false

				// interval
				//
				// The interval to scrape metrics.
				interval?: string | *"60s"

				// labels
				//
				// Additional labels to add to the ServiceMonitor.
				labels?: close({})

				// path
				//
				// The path to scrape for metrics.
				path?: string | *"/metrics"

				// prometheusInstance
				//
				// Specifies the `prometheus` label on the created ServiceMonitor.
				// This is
				// used when different Prometheus instances have label selectors
				// matching
				// different ServiceMonitors.
				prometheusInstance?: string | *"default"

				// scrapeTimeout
				//
				// The timeout before a metrics scrape fails.
				scrapeTimeout?: string | *"30s"

				// targetPort
				//
				// The target port to set on the ServiceMonitor. This must match
				// the port that the
				// cert-manager controller is listening on for metrics.
				targetPort?: int | *9402
			})
		})

		// replicaCount
		//
		// The number of replicas of the cert-manager controller to run.
		//
		// The default is 1, but in production set this to 2 or 3 to
		// provide high
		// availability.
		//
		// If `replicas > 1`, consider setting
		// `podDisruptionBudget.enabled=true`.
		//
		// Note that cert-manager uses leader election to ensure that
		// there can
		// only be a single instance active at a time.
		replicaCount?: int | *1

		// resources
		//
		// Resources to provide to the cert-manager controller pod.
		//
		// For example:
		// requests:
		// cpu: 10m
		// memory: 32Mi
		//
		// For more information, see [Resource Management for Pods and
		// Containers](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/).
		resources?: close({})

		// securityContext
		//
		// Pod Security Context.
		// For more information, see [Configure a Security Context for a
		// Pod or
		// Container](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/).
		// +docs:property
		securityContext?: close({
			// runAsNonRoot
			runAsNonRoot?: bool | *true

			// seccompProfile
			seccompProfile?: close({
				// type
				type?: string | *"RuntimeDefault"
			})
		})

		// serviceAccount
		//
		// Override the "cert-manager.name" value, which is used to
		// annotate some of
		// the resources that are created by this Chart (using
		// "app.kubernetes.io/name").
		// NOTE: There are some inconsistencies in the Helm chart when it
		// comes to
		// these annotations (some resources use eg. "cainjector.name"
		// which resolves
		// to the value "cainjector").
		// +docs:property
		// nameOverride: "my-cert-manager"
		serviceAccount?: close({
			// automountServiceAccountToken
			//
			// Automount API credentials for a Service Account.
			automountServiceAccountToken?: bool | *true

			// create
			//
			// Specifies whether a service account should be created.
			create?: bool | *true
		})

		// startupapicheck
		//
		// +docs:section=Startup API Check
		// This startupapicheck is a Helm post-install hook that waits for
		// the webhook
		// endpoints to become available.
		// The check is implemented using a Kubernetes Job - if you are
		// injecting mesh
		// sidecar proxies into cert-manager pods, ensure that they
		// are not injected into this Job's pod. Otherwise, the
		// installation may time out
		// owing to the Job never being completed because the sidecar
		// proxy does not exit.
		// For more information, see [this
		// note](https://github.com/cert-manager/cert-manager/pull/4414).
		startupapicheck?: close({
			// affinity
			//
			// A Kubernetes Affinity, if required. For more information, see
			// [Affinity v1
			// core](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.27/#affinity-v1-core).
			// For example:
			// affinity:
			// nodeAffinity:
			// requiredDuringSchedulingIgnoredDuringExecution:
			// nodeSelectorTerms:
			// - matchExpressions:
			// - key: foo.bar.com/role
			// operator: In
			// values:
			// - master
			affinity?: close({})

			// backoffLimit
			//
			// Job backoffLimit
			backoffLimit?: int | *4

			// containerSecurityContext
			//
			// Container Security Context to be set on the controller
			// component container.
			// For more information, see [Configure a Security Context for a
			// Pod or
			// Container](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/).
			// +docs:property
			containerSecurityContext?: close({
				// allowPrivilegeEscalation
				allowPrivilegeEscalation?: bool | *false

				// capabilities
				capabilities?: close({
					// drop
					drop?: [...string & (null | bool | number | string | [...] | {
						...
					})]
				})

				// readOnlyRootFilesystem
				readOnlyRootFilesystem?: bool | *true
			})

			// enableServiceLinks
			//
			// enableServiceLinks indicates whether information about services
			// should be
			// injected into pod's environment variables, matching the syntax
			// of Docker
			// links.
			enableServiceLinks?: bool | *false

			// enabled
			//
			// Enables the startup api check.
			enabled?: bool | *true

			// extraArgs
			//
			// Additional command line flags to pass to startupapicheck
			// binary.
			// To see all available flags run `docker run
			// quay.io/jetstack/cert-manager-startupapicheck:<version>
			// --help`.
			//
			// Verbose logging is enabled by default so that if
			// startupapicheck fails, you
			// can know what exactly caused the failure. Verbose logs include
			// details of
			// the webhook URL, IP address and TCP connect errors for example.
			// +docs:property
			extraArgs?: [...string & (null | bool | number | string | [...] | {
				...
			})]

			// extraEnv
			//
			// Additional environment variables to pass to cert-manager
			// startupapicheck binary.
			// For example:
			// extraEnv:
			// - name: SOME_VAR
			// value: 'some value'
			extraEnv?: [...null | bool | number | string | [...] | {
				...
			}]

			// image
			image?: close({
				// pullPolicy
				//
				// Kubernetes imagePullPolicy on Deployment.
				pullPolicy?: string | *"IfNotPresent"

				// repository
				//
				// The container image for the cert-manager startupapicheck.
				// +docs:property
				repository?: string | *"quay.io/jetstack/cert-manager-startupapicheck"
			})

			// jobAnnotations
			//
			// Optional additional annotations to add to the startupapicheck
			// Job.
			// +docs:property
			jobAnnotations?: close({
				// helm.sh/hook
				"helm.sh/hook"?: string | *"post-install"

				// helm.sh/hook-delete-policy
				"helm.sh/hook-delete-policy"?: string | *"before-hook-creation,hook-succeeded"

				// helm.sh/hook-weight
				"helm.sh/hook-weight"?: string | *"1"
			})

			// nodeSelector
			//
			// The nodeSelector on Pods tells Kubernetes to schedule Pods on
			// the nodes with
			// matching labels.
			// For more information, see [Assigning Pods to
			// Nodes](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/).
			//
			// This default ensures that Pods are only scheduled to Linux
			// nodes.
			// It prevents Pods being scheduled to Windows nodes in a mixed OS
			// cluster.
			// +docs:property
			nodeSelector?: close({
				// kubernetes.io/os
				"kubernetes.io/os"?: string | *"linux"
			})

			// podLabels
			//
			// Optional additional labels to add to the startupapicheck Pods.
			podLabels?: close({})

			// rbac
			rbac?: close({
				// annotations
				//
				// annotations for the startup API Check job RBAC and PSP
				// resources.
				// +docs:property
				annotations?: close({
					// helm.sh/hook
					"helm.sh/hook"?: string | *"post-install"

					// helm.sh/hook-delete-policy
					"helm.sh/hook-delete-policy"?: string | *"before-hook-creation,hook-succeeded"

					// helm.sh/hook-weight
					"helm.sh/hook-weight"?: string | *"-5"
				})
			})

			// resources
			//
			// Resources to provide to the cert-manager controller pod.
			//
			// For example:
			// requests:
			// cpu: 10m
			// memory: 32Mi
			//
			// For more information, see [Resource Management for Pods and
			// Containers](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/).
			resources?: close({})

			// securityContext
			//
			// Pod Security Context to be set on the startupapicheck component
			// Pod.
			// For more information, see [Configure a Security Context for a
			// Pod or
			// Container](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/).
			// +docs:property
			securityContext?: close({
				// runAsNonRoot
				runAsNonRoot?: bool | *true

				// seccompProfile
				seccompProfile?: close({
					// type
					type?: string | *"RuntimeDefault"
				})
			})

			// serviceAccount
			//
			// Automounting API credentials for a particular pod.
			// +docs:property
			// automountServiceAccountToken: true
			serviceAccount?: close({
				// annotations
				//
				// Optional additional annotations to add to the Job's Service
				// Account.
				// +docs:property
				annotations?: close({
					// helm.sh/hook
					"helm.sh/hook"?: string | *"post-install"

					// helm.sh/hook-delete-policy
					"helm.sh/hook-delete-policy"?: string | *"before-hook-creation,hook-succeeded"

					// helm.sh/hook-weight
					"helm.sh/hook-weight"?: string | *"-5"
				})

				// automountServiceAccountToken
				//
				// Automount API credentials for a Service Account.
				// +docs:property
				automountServiceAccountToken?: bool | *true

				// create
				//
				// Specifies whether a service account should be created.
				create?: bool | *true
			})

			// timeout
			//
			// Timeout for 'kubectl check api' command.
			timeout?: string | *"1m"

			// tolerations
			//
			// A list of Kubernetes Tolerations, if required. For more
			// information, see [Toleration v1
			// core](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.27/#toleration-v1-core).
			//
			// For example:
			// tolerations:
			// - key: foo.bar.com/role
			// operator: Equal
			// value: master
			// effect: NoSchedule
			tolerations?: [...null | bool | number | string | [...] | {
				...
			}]

			// volumeMounts
			//
			// Additional volume mounts to add to the cert-manager controller
			// container.
			volumeMounts?: [...null | bool | number | string | [...] | {
				...
			}]

			// volumes
			//
			// Additional volumes to add to the cert-manager controller pod.
			volumes?: [...null | bool | number | string | [...] | {
				...
			}]
		})

		// strategy
		//
		// Deployment update strategy for the cert-manager controller
		// deployment.
		// For more information, see the [Kubernetes
		// documentation](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#strategy).
		//
		// For example:
		// strategy:
		// type: RollingUpdate
		// rollingUpdate:
		// maxSurge: 0
		// maxUnavailable: 1
		strategy?: close({})

		// tolerations
		//
		// A list of Kubernetes Tolerations, if required. For more
		// information, see [Toleration v1
		// core](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.27/#toleration-v1-core).
		//
		// For example:
		// tolerations:
		// - key: foo.bar.com/role
		// operator: Equal
		// value: master
		// effect: NoSchedule
		tolerations?: [...null | bool | number | string | [...] | {
			...
		}]

		// topologySpreadConstraints
		//
		// A list of Kubernetes TopologySpreadConstraints, if required.
		// For more information, see [Topology spread constraint v1
		// core](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.27/#topologyspreadconstraint-v1-core
		//
		// For example:
		// topologySpreadConstraints:
		// - maxSkew: 2
		// topologyKey: topology.kubernetes.io/zone
		// whenUnsatisfiable: ScheduleAnyway
		// labelSelector:
		// matchLabels:
		// app.kubernetes.io/instance: cert-manager
		// app.kubernetes.io/component: controller
		topologySpreadConstraints?: [...null | bool | number | string | [...] | {
			...
		}]

		// volumeMounts
		//
		// Additional volume mounts to add to the cert-manager controller
		// container.
		volumeMounts?: [...null | bool | number | string | [...] | {
			...
		}]

		// volumes
		//
		// Additional volumes to add to the cert-manager controller pod.
		volumes?: [...null | bool | number | string | [...] | {
			...
		}]

		// webhook
		//
		// +docs:section=Webhook
		webhook?: close({
			// affinity
			//
			// A Kubernetes Affinity, if required. For more information, see
			// [Affinity v1
			// core](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.27/#affinity-v1-core).
			//
			// For example:
			// affinity:
			// nodeAffinity:
			// requiredDuringSchedulingIgnoredDuringExecution:
			// nodeSelectorTerms:
			// - matchExpressions:
			// - key: foo.bar.com/role
			// operator: In
			// values:
			// - master
			affinity?: close({})

			// config
			//
			// This is used to configure options for the webhook pod.
			// This allows setting options that would usually be provided
			// using flags.
			//
			// If `apiVersion` and `kind` are unspecified they default to the
			// current latest
			// version (currently `webhook.config.cert-manager.io/v1alpha1`).
			// You can pin
			// the version by specifying the `apiVersion` yourself.
			//
			// For example:
			// apiVersion: webhook.config.cert-manager.io/v1alpha1
			// kind: WebhookConfiguration
			// # The port that the webhook listens on for requests.
			// # In GKE private clusters, by default Kubernetes apiservers are
			// allowed to
			// # talk to the cluster nodes only on 443 and 10250. Configuring
			// # securePort: 10250 therefore will work out-of-the-box without
			// needing to add firewall
			// # rules or requiring NET_BIND_SERVICE capabilities to bind port
			// numbers < 1000.
			// # This should be uncommented and set as a default by the chart
			// once
			// # the apiVersion of WebhookConfiguration graduates beyond
			// v1alpha1.
			// securePort: 10250
			// # Configure the metrics server for TLS
			// # See
			// https://cert-manager.io/docs/devops-tips/prometheus-metrics/#tls
			// metricsTLSConfig:
			// dynamic:
			// secretNamespace: "cert-manager"
			// secretName: "cert-manager-metrics-ca"
			// dnsNames:
			// - cert-manager-metrics
			config?: close({})

			// containerSecurityContext
			//
			// Container Security Context to be set on the webhook component
			// container.
			// For more information, see [Configure a Security Context for a
			// Pod or
			// Container](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/).
			// +docs:property
			containerSecurityContext?: close({
				// allowPrivilegeEscalation
				allowPrivilegeEscalation?: bool | *false

				// capabilities
				capabilities?: close({
					// drop
					drop?: [...string & (null | bool | number | string | [...] | {
						...
					})]
				})

				// readOnlyRootFilesystem
				readOnlyRootFilesystem?: bool | *true
			})

			// enableServiceLinks
			//
			// enableServiceLinks indicates whether information about services
			// should be
			// injected into the pod's environment variables, matching the
			// syntax of Docker
			// links.
			enableServiceLinks?: bool | *false

			// extraArgs
			//
			// Additional command line flags to pass to cert-manager webhook
			// binary.
			// To see all available flags run `docker run
			// quay.io/jetstack/cert-manager-webhook:<version> --help`.
			extraArgs?: [...null | bool | number | string | [...] | {
				...
			}]

			// extraEnv
			//
			// Additional environment variables to pass to cert-manager
			// webhook binary.
			// For example:
			// extraEnv:
			// - name: SOME_VAR
			// value: 'some value'
			extraEnv?: [...null | bool | number | string | [...] | {
				...
			}]

			// featureGates
			//
			// Comma separated list of feature gates that should be enabled on
			// the
			// webhook pod.
			featureGates?: string | *""

			// hostNetwork
			//
			// Specifies if the webhook should be started in hostNetwork mode.
			//
			// Required for use in some managed kubernetes clusters (such as
			// AWS EKS) with custom
			// CNI (such as calico), because control-plane managed by AWS
			// cannot communicate
			// with pods' IP CIDR and admission webhooks are not working
			//
			// Since the default port for the webhook conflicts with kubelet
			// on the host
			// network, `webhook.securePort` should be changed to an available
			// port if
			// running in hostNetwork mode.
			hostNetwork?: bool | *false

			// image
			image?: close({
				// pullPolicy
				//
				// Kubernetes imagePullPolicy on Deployment.
				pullPolicy?: string | *"IfNotPresent"

				// repository
				//
				// The container image for the cert-manager webhook
				// +docs:property
				repository?: string | *"quay.io/jetstack/cert-manager-webhook"
			})

			// livenessProbe
			//
			// Liveness probe values.
			// For more information, see [Container
			// probes](https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#container-probes).
			//
			// +docs:property
			livenessProbe?: close({
				// failureThreshold
				failureThreshold?: int | *3

				// initialDelaySeconds
				initialDelaySeconds?: int | *60

				// periodSeconds
				periodSeconds?: int | *10

				// successThreshold
				successThreshold?: int | *1

				// timeoutSeconds
				timeoutSeconds?: int | *1
			})

			// mutatingWebhookConfiguration
			mutatingWebhookConfiguration?: close({
				// namespaceSelector
				//
				// Configure spec.namespaceSelector for mutating webhooks.
				// +docs:property
				namespaceSelector?: close({})
			})

			// networkPolicy
			//
			// Enables default network policies for webhooks.
			networkPolicy?: close({
				// egress
				//
				// Egress rule for the webhook network policy. By default, it
				// allows all
				// outbound traffic to ports 80 and 443, as well as DNS ports.
				// +docs:property
				egress?: [...close({
					// ports
					ports?: [...matchN(>=1, [close({
						// port
						port?: int | *80

						// protocol
						protocol?: string | *"TCP"
					}), close({
						// port
						port?: int | *443

						// protocol
						protocol?: string | *"TCP"
					}), close({
						// port
						port?: int | *53

						// protocol
						protocol?: string | *"TCP"
					}), close({
						// port
						port?: int | *53

						// protocol
						protocol?: string | *"UDP"
					}), close({
						// port
						port?: int | *6443

						// protocol
						protocol?: string | *"TCP"
					})]) & {
						...
					}]

					// to
					to?: [...close({
						// ipBlock
						ipBlock?: close({
							// cidr
							cidr?: string | *"0.0.0.0/0"
						})
					}) & (null | bool | number | string | [...] | {
						...
					})]
				}) & (null | bool | number | string | [...] | {
					...
				})]

				// enabled
				//
				// Create network policies for the webhooks.
				enabled?: bool | *false

				// ingress
				//
				// Ingress rule for the webhook network policy. By default, it
				// allows all
				// inbound traffic.
				// +docs:property
				ingress?: [...close({
					// from
					from?: [...close({
						// ipBlock
						ipBlock?: close({
							// cidr
							cidr?: string | *"0.0.0.0/0"
						})
					}) & (null | bool | number | string | [...] | {
						...
					})]
				}) & (null | bool | number | string | [...] | {
					...
				})]
			})

			// nodeSelector
			//
			// The nodeSelector on Pods tells Kubernetes to schedule Pods on
			// the nodes with
			// matching labels.
			// For more information, see [Assigning Pods to
			// Nodes](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/).
			//
			// This default ensures that Pods are only scheduled to Linux
			// nodes.
			// It prevents Pods being scheduled to Windows nodes in a mixed OS
			// cluster.
			// +docs:property
			nodeSelector?: close({
				// kubernetes.io/os
				"kubernetes.io/os"?: string | *"linux"
			})

			// podDisruptionBudget
			podDisruptionBudget?: close({
				// enabled
				//
				// Enable or disable the PodDisruptionBudget resource.
				//
				// This prevents downtime during voluntary disruptions such as
				// during a Node upgrade.
				// For example, the PodDisruptionBudget will block `kubectl drain`
				// if it is used on the Node where the only remaining cert-manager
				// Pod is currently running.
				enabled?: bool | *false
			})

			// podLabels
			//
			// Optional additional labels to add to the Webhook Pods.
			podLabels?: close({})

			// readinessProbe
			//
			// Readiness probe values.
			// For more information, see [Container
			// probes](https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#container-probes).
			//
			// +docs:property
			readinessProbe?: close({
				// failureThreshold
				failureThreshold?: int | *3

				// initialDelaySeconds
				initialDelaySeconds?: int | *5

				// periodSeconds
				periodSeconds?: int | *5

				// successThreshold
				successThreshold?: int | *1

				// timeoutSeconds
				timeoutSeconds?: int | *1
			})

			// replicaCount
			//
			// Number of replicas of the cert-manager webhook to run.
			//
			// The default is 1, but in production set this to 2 or 3 to
			// provide high
			// availability.
			//
			// If `replicas > 1`, consider setting
			// `webhook.podDisruptionBudget.enabled=true`.
			replicaCount?: int | *1

			// resources
			//
			// Resources to provide to the cert-manager webhook pod.
			//
			// For example:
			// requests:
			// cpu: 10m
			// memory: 32Mi
			//
			// For more information, see [Resource Management for Pods and
			// Containers](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/).
			resources?: close({})

			// securePort
			//
			// The port that the webhook listens on for requests.
			// In GKE private clusters, by default Kubernetes apiservers are
			// allowed to
			// talk to the cluster nodes only on 443 and 10250. Configuring
			// securePort: 10250, therefore will work out-of-the-box without
			// needing to add firewall
			// rules or requiring NET_BIND_SERVICE capabilities to bind port
			// numbers <1000.
			securePort?: int | *10250

			// securityContext
			//
			// Pod Security Context to be set on the webhook component Pod.
			// For more information, see [Configure a Security Context for a
			// Pod or
			// Container](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/).
			// +docs:property
			securityContext?: close({
				// runAsNonRoot
				runAsNonRoot?: bool | *true

				// seccompProfile
				seccompProfile?: close({
					// type
					type?: string | *"RuntimeDefault"
				})
			})

			// serviceAccount
			serviceAccount?: close({
				// automountServiceAccountToken
				//
				// Automount API credentials for a Service Account.
				automountServiceAccountToken?: bool | *true

				// create
				//
				// Specifies whether a service account should be created.
				create?: bool | *true
			})

			// serviceIPFamilies
			//
			// Optionally set the IP families for the controller Service that
			// should be supported, in the order in which they should be
			// applied to ClusterIP. Can be IPv4 and/or IPv6.
			serviceIPFamilies?: [...null | bool | number | string | [...] | {
				...
			}]

			// serviceIPFamilyPolicy
			//
			// Optionally set the IP family policy for the controller Service
			// to configure dual-stack; see [Configure
			// dual-stack](https://kubernetes.io/docs/concepts/services-networking/dual-stack/#services).
			serviceIPFamilyPolicy?: string | *""

			// serviceLabels
			//
			// Optional additional labels to add to the Webhook Service.
			serviceLabels?: close({})

			// serviceType
			//
			// Specifies how the service should be handled. Useful if you want
			// to expose the
			// webhook outside of the cluster. In some cases, the control
			// plane cannot
			// reach internal services.
			serviceType?: string | *"ClusterIP"

			// strategy
			//
			// The update strategy for the cert-manager webhook deployment.
			// For more information, see the [Kubernetes
			// documentation](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#strategy)
			//
			// For example:
			// strategy:
			// type: RollingUpdate
			// rollingUpdate:
			// maxSurge: 0
			// maxUnavailable: 1
			strategy?: close({})

			// timeoutSeconds
			//
			// The number of seconds the API server should wait for the
			// webhook to respond before treating the call as a failure.
			// The value must be between 1 and 30 seconds. For more
			// information, see
			// [Validating webhook configuration
			// v1](https://kubernetes.io/docs/reference/kubernetes-api/extend-resources/validating-webhook-configuration-v1/).
			//
			// The default is set to the maximum value of 30 seconds as
			// users sometimes report that the connection between the K8S API
			// server and
			// the cert-manager webhook server times out.
			// If *this* timeout is reached, the error message will be
			// "context deadline exceeded",
			// which doesn't help the user diagnose what phase of the HTTPS
			// connection timed out.
			// For example, it could be during DNS resolution, TCP connection,
			// TLS
			// negotiation, HTTP negotiation, or slow HTTP response from the
			// webhook
			// server.
			// By setting this timeout to its maximum value the underlying
			// timeout error
			// message has more chance of being returned to the end user.
			timeoutSeconds?: int | *30

			// tolerations
			//
			// A list of Kubernetes Tolerations, if required. For more
			// information, see [Toleration v1
			// core](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.27/#toleration-v1-core).
			//
			// For example:
			// tolerations:
			// - key: foo.bar.com/role
			// operator: Equal
			// value: master
			// effect: NoSchedule
			tolerations?: [...null | bool | number | string | [...] | {
				...
			}]

			// topologySpreadConstraints
			//
			// A list of Kubernetes TopologySpreadConstraints, if required.
			// For more information, see [Topology spread constraint v1
			// core](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.27/#topologyspreadconstraint-v1-core).
			//
			// For example:
			// topologySpreadConstraints:
			// - maxSkew: 2
			// topologyKey: topology.kubernetes.io/zone
			// whenUnsatisfiable: ScheduleAnyway
			// labelSelector:
			// matchLabels:
			// app.kubernetes.io/instance: cert-manager
			// app.kubernetes.io/component: controller
			topologySpreadConstraints?: [...null | bool | number | string | [...] | {
				...
			}]

			// url
			//
			// Overrides the mutating webhook and validating webhook so they
			// reach the webhook
			// service using the `url` field instead of a service.
			url?: close({})

			// validatingWebhookConfiguration
			//
			// Optional additional annotations to add to the webhook
			// ValidatingWebhookConfiguration.
			// +docs:property
			// validatingWebhookConfigurationAnnotations: {}
			validatingWebhookConfiguration?: close({
				// namespaceSelector
				//
				// Configure spec.namespaceSelector for validating webhooks.
				// +docs:property
				namespaceSelector?: close({
					// matchExpressions
					matchExpressions?: [...close({
						// key
						key?: string | *"cert-manager.io/disable-validation"

						// operator
						operator?: string | *"NotIn"

						// values
						values?: [...string & (null | bool | number | string | [...] | {
							...
						})]
					}) & (null | bool | number | string | [...] | {
						...
					})]
				})
			})

			// volumeMounts
			//
			// Additional volume mounts to add to the cert-manager controller
			// container.
			volumeMounts?: [...null | bool | number | string | [...] | {
				...
			}]

			// volumes
			//
			// Additional volumes to add to the cert-manager controller pod.
			volumes?: [...null | bool | number | string | [...] | {
				...
			}]
		})
	})
}
