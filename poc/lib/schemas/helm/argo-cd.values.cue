package helm

#ArgoCDValues: {
	@jsonschema(schema="http://json-schema.org/draft-07/schema#")
	close({
		// apiVersionOverrides
		//
		// Override APIVersions
		// If you want to template helm charts but cannot access k8s API
		// server
		// you can set api versions here
		apiVersionOverrides?: close({})

		// applicationSet
		//
		// # ApplicationSet controller
		applicationSet?: close({
			// affinity
			//
			// Assign custom [affinity] rules
			affinity?: close({})

			// allowAnyNamespace
			//
			// Enable ApplicationSet in any namespace feature
			allowAnyNamespace?: bool | *false

			// automountServiceAccountToken
			//
			// Automount API credentials for the Service Account into the pod.
			automountServiceAccountToken?: bool | *true

			// certificate
			//
			// TLS certificate configuration via cert-manager
			// # Ref:
			// https://argo-cd.readthedocs.io/en/stable/operator-manual/tls/#tls-configuration
			certificate?: close({
				// additionalHosts
				//
				// Certificate Subject Alternate Names (SANs)
				additionalHosts?: [...null | bool | number | string | [...] | {
					...
				}]

				// annotations
				//
				// Annotations to be applied to the ApplicationSet Certificate
				annotations?: close({})

				// domain
				//
				// Certificate primary domain (commonName)
				domain?: string | *""

				// duration
				//
				// The requested 'duration' (i.e. lifetime) of the certificate.
				// # Ref: https://cert-manager.io/docs/usage/certificate/#renewal
				duration?: string | *""

				// enabled
				//
				// Deploy a Certificate resource (requires cert-manager)
				enabled?: bool | *false

				// issuer
				//
				// Certificate issuer
				// # Ref: https://cert-manager.io/docs/concepts/issuer
				issuer?: close({
					// group
					//
					// Certificate issuer group. Set if using an external issuer. Eg.
					// `cert-manager.io`
					group?: string | *""

					// kind
					//
					// Certificate issuer kind. Either `Issuer` or `ClusterIssuer`
					kind?: string | *""

					// name
					//
					// Certificate issuer name. Eg. `letsencrypt`
					name?: string | *""
				})

				// privateKey
				//
				// Private key of the certificate
				privateKey?: close({
					// algorithm
					//
					// Algorithm used to generate certificate private key. One of:
					// `RSA`, `Ed25519` or `ECDSA`
					algorithm?: string | *"RSA"

					// encoding
					//
					// The private key cryptography standards (PKCS) encoding for
					// private key. Either: `PCKS1` or `PKCS8`
					encoding?: string | *"PKCS1"

					// rotationPolicy
					//
					// Rotation policy of private key when certificate is re-issued.
					// Either: `Never` or `Always`
					rotationPolicy?: string | *"Never"

					// size
					//
					// Key bit size of the private key. If algorithm is set to
					// `Ed25519`, size is ignored.
					size?: int | *2048
				})

				// renewBefore
				//
				// How long before the expiry a certificate should be renewed.
				// # Ref: https://cert-manager.io/docs/usage/certificate/#renewal
				renewBefore?: string | *""
			})

			// containerPorts
			//
			// ApplicationSet controller container ports
			containerPorts?: close({
				// metrics
				//
				// Metrics container port
				metrics?: int | *8080

				// probe
				//
				// Probe container port
				probe?: int | *8081

				// webhook
				//
				// Webhook container port
				webhook?: int | *7000
			})

			// containerSecurityContext
			//
			// ApplicationSet controller container-level security context
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

				// runAsNonRoot
				runAsNonRoot?: bool | *true

				// seccompProfile
				seccompProfile?: close({
					// type
					type?: string | *"RuntimeDefault"
				})
			})

			// deploymentAnnotations
			//
			// Annotations to be added to ApplicationSet controller Deployment
			deploymentAnnotations?: close({})

			// deploymentStrategy
			//
			// Deployment strategy to be added to the ApplicationSet
			// controller Deployment
			deploymentStrategy?: close({})

			// dnsConfig
			//
			// [DNS configuration]
			dnsConfig?: close({})

			// dnsPolicy
			//
			// Alternative DNS policy for ApplicationSet controller pods
			dnsPolicy?: string | *"ClusterFirst"

			// emptyDir
			//
			// # ApplicationSet controller emptyDir volumes
			emptyDir?: close({
				// sizeLimit
				//
				// EmptyDir size limit for applicationSet controller
				sizeLimit?: string | *""
			})

			// extraArgs
			//
			// ApplicationSet controller command line flags
			extraArgs?: [...null | bool | number | string | [...] | {
				...
			}]

			// extraContainers
			//
			// Additional containers to be added to the ApplicationSet
			// controller pod
			// # Note: Supports use of custom Helm templates
			extraContainers?: [...null | bool | number | string | [...] | {
				...
			}]

			// extraEnv
			//
			// Environment variables to pass to the ApplicationSet controller
			extraEnv?: [...null | bool | number | string | [...] | {
				...
			}]

			// extraEnvFrom
			//
			// envFrom to pass to the ApplicationSet controller
			extraEnvFrom?: [...null | bool | number | string | [...] | {
				...
			}]

			// extraVolumeMounts
			//
			// List of extra mounts to add (normally used with extraVolumes)
			extraVolumeMounts?: [...null | bool | number | string | [...] | {
				...
			}]

			// extraVolumes
			//
			// List of extra volumes to add
			extraVolumes?: [...null | bool | number | string | [...] | {
				...
			}]

			// image
			//
			// # ApplicationSet controller image
			image?: close({
				// imagePullPolicy
				//
				// Image pull policy for the ApplicationSet controller
				imagePullPolicy?: string | *""

				// repository
				//
				// Repository to use for the ApplicationSet controller
				repository?: string | *""

				// tag
				//
				// Tag to use for the ApplicationSet controller
				tag?: string | *""
			})

			// imagePullSecrets
			//
			// If defined, uses a Secret to pull an image from a private
			// Docker registry or repository.
			imagePullSecrets?: [...null | bool | number | string | [...] | {
				...
			}]

			// ingress
			//
			// # Ingress for the Git Generator webhook
			// # Ref:
			// https://argocd-applicationset.readthedocs.io/en/master/Generators-Git/#webhook-configuration)
			ingress?: close({
				// annotations
				//
				// Additional ingress annotations
				annotations?: close({})

				// enabled
				//
				// Enable an ingress resource for ApplicationSet webhook
				enabled?: bool | *false

				// extraHosts
				//
				// The list of additional hostnames to be covered by ingress
				// record
				extraHosts?: [...null | bool | number | string | [...] | {
					...
				}]

				// extraPaths
				//
				// Additional ingress paths
				extraPaths?: [...null | bool | number | string | [...] | {
					...
				}]

				// extraRules
				//
				// Additional ingress rules
				// # Note: Supports use of custom Helm templates
				extraRules?: [...null | bool | number | string | [...] | {
					...
				}]

				// extraTls
				//
				// Additional ingress TLS configuration
				extraTls?: [...null | bool | number | string | [...] | {
					...
				}]

				// hostname
				//
				// Argo CD ApplicationSet hostname
				hostname?: string | *""

				// ingressClassName
				//
				// Defines which ingress ApplicationSet controller will implement
				// the resource
				ingressClassName?: string | *""

				// labels
				//
				// Additional ingress labels
				labels?: close({})

				// path
				//
				// List of ingress paths
				path?: string | *"/api/webhook"

				// pathType
				//
				// Ingress path type. One of `Exact`, `Prefix` or
				// `ImplementationSpecific`
				pathType?: string | *"Prefix"

				// tls
				//
				// Enable TLS configuration for the hostname defined at
				// `applicationSet.webhook.ingress.hostname`
				// # TLS certificate will be retrieved from a TLS secret with
				// name:`argocd-applicationset-controller-tls`
				tls?: bool | *false
			})

			// initContainers
			//
			// Init containers to add to the ApplicationSet controller pod
			// # Note: Supports use of custom Helm templates
			initContainers?: [...null | bool | number | string | [...] | {
				...
			}]

			// livenessProbe
			livenessProbe?: close({
				// enabled
				//
				// Enable Kubernetes liveness probe for ApplicationSet controller
				enabled?: bool | *false

				// failureThreshold
				//
				// Minimum consecutive failures for the [probe] to be considered
				// failed after having succeeded
				failureThreshold?: int | *3

				// initialDelaySeconds
				//
				// Number of seconds after the container has started before
				// [probe] is initiated
				initialDelaySeconds?: int | *10

				// periodSeconds
				//
				// How often (in seconds) to perform the [probe]
				periodSeconds?: int | *10

				// successThreshold
				//
				// Minimum consecutive successes for the [probe] to be considered
				// successful after having failed
				successThreshold?: int | *1

				// timeoutSeconds
				//
				// Number of seconds after which the [probe] times out
				timeoutSeconds?: int | *1
			})

			// metrics
			//
			// # Metrics service configuration
			metrics?: close({
				// enabled
				//
				// Deploy metrics service
				enabled?: bool | *false

				// service
				service?: close({
					// annotations
					//
					// Metrics service annotations
					annotations?: close({})

					// clusterIP
					//
					// Metrics service clusterIP. `None` makes a "headless service"
					// (no virtual IP)
					clusterIP?: string | *""

					// labels
					//
					// Metrics service labels
					labels?: close({})

					// portName
					//
					// Metrics service port name
					portName?: string | *"http-metrics"

					// servicePort
					//
					// Metrics service port
					servicePort?: int | *8080

					// type
					//
					// Metrics service type
					type?: string | *"ClusterIP"
				})

				// serviceMonitor
				serviceMonitor?: close({
					// additionalLabels
					//
					// Prometheus ServiceMonitor labels
					additionalLabels?: close({})

					// annotations
					//
					// Prometheus ServiceMonitor annotations
					annotations?: close({})

					// enabled
					//
					// Enable a prometheus ServiceMonitor
					enabled?: bool | *false

					// honorLabels
					//
					// When true, honorLabels preserves the metric’s labels when they
					// collide with the target’s labels.
					honorLabels?: bool | *false

					// interval
					//
					// Prometheus ServiceMonitor interval
					interval?: string | *"30s"

					// metricRelabelings
					//
					// Prometheus [MetricRelabelConfigs] to apply to samples before
					// ingestion
					metricRelabelings?: [...null | bool | number | string | [...] | {
						...
					}]

					// namespace
					//
					// Prometheus ServiceMonitor namespace
					namespace?: string | *""

					// relabelings
					//
					// Prometheus [RelabelConfigs] to apply to samples before scraping
					relabelings?: [...null | bool | number | string | [...] | {
						...
					}]

					// scheme
					//
					// Prometheus ServiceMonitor scheme
					scheme?: string | *""

					// scrapeTimeout
					//
					// Prometheus ServiceMonitor scrapeTimeout. If empty, Prometheus
					// uses the global scrape timeout unless it is less than the
					// target's scrape interval value in which the latter is used.
					scrapeTimeout?: string | *""

					// selector
					//
					// Prometheus ServiceMonitor selector
					selector?: close({})

					// tlsConfig
					//
					// Prometheus ServiceMonitor tlsConfig
					tlsConfig?: close({})
				})
			})

			// name
			//
			// ApplicationSet controller name string
			name?: string | *"applicationset-controller"

			// nodeSelector
			//
			// [Node selector]
			nodeSelector?: close({})

			// pdb
			//
			// # ApplicationSet controller Pod Disruption Budget
			// # Ref:
			// https://kubernetes.io/docs/tasks/run-application/configure-pdb/
			pdb?: close({
				// annotations
				//
				// Annotations to be added to ApplicationSet controller pdb
				annotations?: close({})

				// enabled
				//
				// Deploy a [PodDisruptionBudget] for the ApplicationSet
				// controller
				enabled?: bool | *false

				// labels
				//
				// Labels to be added to ApplicationSet controller pdb
				labels?: close({})

				// maxUnavailable
				//
				// Number of pods that are unavailable after eviction as number or
				// percentage (eg.: 50%).
				// # Has higher precedence over `applicationSet.pdb.minAvailable`
				maxUnavailable?: string | *""

				// minAvailable
				//
				// Number of pods that are available after eviction as number or
				// percentage (eg.: 50%)
				minAvailable?: string | *""
			})

			// podAnnotations
			//
			// Annotations for the ApplicationSet controller pods
			podAnnotations?: close({})

			// podLabels
			//
			// Labels for the ApplicationSet controller pods
			podLabels?: close({})

			// priorityClassName
			//
			// Priority class for the ApplicationSet controller pods
			priorityClassName?: string | *""

			// readinessProbe
			//
			// # Probes for ApplicationSet controller (optional)
			// # Ref:
			// https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/
			readinessProbe?: close({
				// enabled
				//
				// Enable Kubernetes liveness probe for ApplicationSet controller
				enabled?: bool | *false

				// failureThreshold
				//
				// Minimum consecutive failures for the [probe] to be considered
				// failed after having succeeded
				failureThreshold?: int | *3

				// initialDelaySeconds
				//
				// Number of seconds after the container has started before
				// [probe] is initiated
				initialDelaySeconds?: int | *10

				// periodSeconds
				//
				// How often (in seconds) to perform the [probe]
				periodSeconds?: int | *10

				// successThreshold
				//
				// Minimum consecutive successes for the [probe] to be considered
				// successful after having failed
				successThreshold?: int | *1

				// timeoutSeconds
				//
				// Number of seconds after which the [probe] times out
				timeoutSeconds?: int | *1
			})

			// replicas
			//
			// The number of ApplicationSet controller pods to run
			replicas?: int | *1

			// resources
			//
			// Resource limits and requests for the ApplicationSet controller
			// pods.
			resources?: close({})

			// runtimeClassName
			//
			// Runtime class name for the ApplicationSet controller
			runtimeClassName?: string | *""

			// service
			//
			// # ApplicationSet service configuration
			service?: close({
				// annotations
				//
				// ApplicationSet service annotations
				annotations?: close({})

				// labels
				//
				// ApplicationSet service labels
				labels?: close({})

				// port
				//
				// ApplicationSet service port
				port?: int | *7000

				// portName
				//
				// ApplicationSet service port name
				portName?: string | *"http-webhook"

				// type
				//
				// ApplicationSet service type
				type?: string | *"ClusterIP"
			})

			// serviceAccount
			serviceAccount?: close({
				// annotations
				//
				// Annotations applied to created service account
				annotations?: close({})

				// automountServiceAccountToken
				//
				// Automount API credentials for the Service Account
				automountServiceAccountToken?: bool | *true

				// create
				//
				// Create ApplicationSet controller service account
				create?: bool | *true

				// labels
				//
				// Labels applied to created service account
				labels?: close({})

				// name
				//
				// ApplicationSet controller service account name
				name?: string | *"argocd-applicationset-controller"
			})

			// terminationGracePeriodSeconds
			//
			// terminationGracePeriodSeconds for container lifecycle hook
			terminationGracePeriodSeconds?: int | *30

			// tolerations
			//
			// [Tolerations] for use with node taints
			tolerations?: [...null | bool | number | string | [...] | {
				...
			}]

			// topologySpreadConstraints
			//
			// Assign custom [TopologySpreadConstraints] rules to the
			// ApplicationSet controller
			// # Ref:
			// https://kubernetes.io/docs/concepts/workloads/pods/pod-topology-spread-constraints/
			// # If labelSelector is left out, it will default to the
			// labelSelector configuration of the deployment
			topologySpreadConstraints?: [...null | bool | number | string | [...] | {
				...
			}]
		})

		// configs
		//
		// # Argo Configs
		configs?: close({
			// clusterCredentials
			//
			// Provide one or multiple [external cluster credentials]
			// # Ref:
			// # -
			// https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/#clusters
			// # -
			// https://argo-cd.readthedocs.io/en/stable/operator-manual/security/#external-cluster-credentials
			// # -
			// https://argo-cd.readthedocs.io/en/stable/user-guide/projects/#project-scoped-repositories-and-clusters
			clusterCredentials?: close({})

			// cm
			//
			// General Argo CD configuration
			// # Ref:
			// https://github.com/argoproj/argo-cd/blob/master/docs/operator-manual/argocd-cm.yaml
			cm?: close({
				// admin.enabled
				//
				// Enable local admin user
				// # Ref:
				// https://argo-cd.readthedocs.io/en/latest/faq/#how-to-disable-admin-user
				"admin.enabled"?: bool | *true

				// annotations
				//
				// Annotations to be added to argocd-cm configmap
				annotations?: close({})

				// application.instanceLabelKey
				//
				// The name of tracking label used by Argo CD for resource pruning
				"application.instanceLabelKey"?: string | *"argocd.argoproj.io/instance"

				// create
				//
				// Create the argocd-cm configmap for [declarative setup]
				create?: bool | *true

				// exec.enabled
				//
				// Enable exec feature in Argo UI
				// # Ref:
				// https://argo-cd.readthedocs.io/en/latest/operator-manual/rbac/#exec-resource
				"exec.enabled"?: bool | *false

				// server.rbac.log.enforce.enable
				//
				// Enable logs RBAC enforcement
				// # Ref:
				// https://argo-cd.readthedocs.io/en/latest/operator-manual/upgrading/2.3-2.4/#enable-logs-rbac-enforcement
				"server.rbac.log.enforce.enable"?: bool | *false

				// statusbadge.enabled
				//
				// Enable Status Badge
				// # Ref:
				// https://argo-cd.readthedocs.io/en/stable/user-guide/status-badge/
				"statusbadge.enabled"?: bool | *false

				// timeout.hard.reconciliation
				//
				// Timeout to refresh application data as well as target manifests
				// cache
				"timeout.hard.reconciliation"?: string | *"0s"

				// timeout.reconciliation
				//
				// Timeout to discover if a new manifests version got published to
				// the repository
				"timeout.reconciliation"?: string | *"180s"
			})

			// cmp
			//
			// ConfigMap for Config Management Plugins
			// Ref:
			// https://argo-cd.readthedocs.io/en/stable/operator-manual/config-management-plugins/
			cmp?: close({
				// annotations
				//
				// Annotations to be added to argocd-cmp-cm configmap
				annotations?: close({})

				// create
				//
				// Create the argocd-cmp-cm configmap
				create?: bool | *false

				// plugins
				//
				// Plugin yaml files to be added to argocd-cmp-cm
				plugins?: close({})
			})

			// credentialTemplates
			//
			// Repository credentials to be used as Templates for other repos
			// # Creates a secret for each key/value specified below to create
			// repository credentials
			credentialTemplates?: close({})

			// credentialTemplatesAnnotations
			//
			// Annotations to be added to `configs.credentialTemplates` Secret
			credentialTemplatesAnnotations?: close({})

			// gpg
			//
			// GnuPG public keys for commit verification
			// # Ref:
			// https://argo-cd.readthedocs.io/en/stable/user-guide/gpg-verification/
			gpg?: close({
				// annotations
				//
				// Annotations to be added to argocd-gpg-keys-cm configmap
				annotations?: close({})

				// keys
				//
				// [GnuPG] public keys to add to the keyring
				// # Note: Public keys should be exported with `gpg --export
				// --armor <KEY>`
				keys?: close({})
			})

			// params
			//
			// Argo CD configuration parameters
			// # Ref:
			// https://github.com/argoproj/argo-cd/blob/master/docs/operator-manual/argocd-cmd-params-cm.yaml
			params?: close({
				// annotations
				//
				// Annotations to be added to the argocd-cmd-params-cm ConfigMap
				annotations?: close({})

				// application.namespaces
				//
				// Enables [Applications in any namespace]
				// # List of additional namespaces where applications may be
				// created in and reconciled from.
				// # The namespace where Argo CD is installed to will always be
				// allowed.
				// # Set comma-separated list. (e.g. app-team-one, app-team-two)
				"application.namespaces"?: string | *""

				// applicationsetcontroller.enable.progressive.syncs
				//
				// Enables use of the Progressive Syncs capability
				"applicationsetcontroller.enable.progressive.syncs"?: bool | *false

				// applicationsetcontroller.namespaces
				//
				// A list of glob patterns specifying where to look for
				// ApplicationSet resources. (e.g. `"argocd,argocd-appsets-*"`)
				// # For more information:
				// https://argo-cd.readthedocs.io/en/stable/operator-manual/applicationset/Appset-Any-Namespace/
				"applicationsetcontroller.namespaces"?: string | *""

				// applicationsetcontroller.policy
				//
				// # ApplicationSet Properties
				// Modify how application is synced between the generator and the
				// cluster. One of: `sync`, `create-only`, `create-update`,
				// `create-delete`
				"applicationsetcontroller.policy"?: string | *"sync"

				// controller.ignore.normalizer.jq.timeout
				//
				// JQ Path expression timeout
				// # By default, the evaluation of a JQPathExpression is limited
				// to one second.
				// # If you encounter a "JQ patch execution timed out" error
				// message due to a complex JQPathExpression
				// # that requires more time to evaluate, you can extend the
				// timeout period.
				"controller.ignore.normalizer.jq.timeout"?: string | *"1s"

				// controller.operation.processors
				//
				// Number of application operation processors
				"controller.operation.processors"?: int | *10

				// controller.repo.server.timeout.seconds
				//
				// Repo server RPC call timeout seconds.
				"controller.repo.server.timeout.seconds"?: int | *60

				// controller.self.heal.timeout.seconds
				//
				// Specifies timeout between application self heal attempts
				"controller.self.heal.timeout.seconds"?: int | *5

				// controller.status.processors
				//
				// # Controller Properties
				// Number of application status processors
				"controller.status.processors"?: int | *20

				// create
				//
				// Create the argocd-cmd-params-cm configmap
				// If false, it is expected the configmap will be created by
				// something else.
				create?: bool | *true

				// otlp.address
				//
				// # Generic parameters
				// Open-Telemetry collector address: (e.g. "otel-collector:4317")
				"otlp.address"?: string | *""

				// reposerver.parallelism.limit
				//
				// # Repo-server properties
				// Limit on number of concurrent manifests generate requests. Any
				// value less the 1 means no limit.
				"reposerver.parallelism.limit"?: int | *0

				// server.basehref
				//
				// Value for base href in index.html. Used if Argo CD is running
				// behind reverse proxy under subpath different from /
				"server.basehref"?: string | *"/"

				// server.disable.auth
				//
				// Disable Argo CD RBAC for user authentication
				"server.disable.auth"?: bool | *false

				// server.enable.gzip
				//
				// Enable GZIP compression
				"server.enable.gzip"?: bool | *true

				// server.enable.proxy.extension
				//
				// Enable proxy extension feature. (proxy extension is in Alpha
				// phase)
				"server.enable.proxy.extension"?: bool | *false

				// server.insecure
				//
				// # Server properties
				// Run server without TLS
				// # NOTE: This value should be set when you generate params by
				// other means as it changes ports used by ingress template.
				"server.insecure"?: bool | *false

				// server.rootpath
				//
				// Used if Argo CD is running behind reverse proxy under subpath
				// different from /
				"server.rootpath"?: string | *""

				// server.staticassets
				//
				// Directory path that contains additional static assets
				"server.staticassets"?: string | *"/shared/app"

				// server.x.frame.options
				//
				// Set X-Frame-Options header in HTTP responses to value. To
				// disable, set to "".
				"server.x.frame.options"?: string | *"sameorigin"
			})

			// rbac
			//
			// Argo CD RBAC policy configuration
			// # Ref:
			// https://github.com/argoproj/argo-cd/blob/master/docs/operator-manual/rbac.md
			rbac?: close({
				// annotations
				//
				// Annotations to be added to argocd-rbac-cm configmap
				annotations?: close({})

				// create
				//
				// Create the argocd-rbac-cm configmap with ([Argo CD RBAC
				// policy]) definitions.
				// If false, it is expected the configmap will be created by
				// something else.
				// Argo CD will not work if there is no configmap created with the
				// name above.
				create?: bool | *true

				// policy.csv
				//
				// File containing user-defined policies and role definitions.
				"policy.csv"?: string | *""

				// policy.default
				//
				// The name of the default role which Argo CD will falls back to,
				// when authorizing API requests (optional).
				// If omitted or empty, users may be still be able to login, but
				// will see no apps, projects, etc...
				"policy.default"?: string | *""

				// policy.matchMode
				//
				// Matcher function for Casbin, `glob` for glob matcher and
				// `regex` for regex matcher.
				"policy.matchMode"?: string | *"glob"

				// scopes
				//
				// OIDC scopes to examine during rbac enforcement (in addition to
				// `sub` scope).
				// The scope value can be a string, or a list of strings.
				scopes?: string | *"[groups]"
			})

			// repositories
			//
			// Repositories list to be used by applications
			// # Creates a secret for each key/value specified below to create
			// repositories
			// # Note: the last example in the list would use a repository
			// credential template, configured under
			// "configs.credentialTemplates".
			repositories?: close({})

			// repositoriesAnnotations
			//
			// Annotations to be added to `configs.repositories` Secret
			repositoriesAnnotations?: close({})

			// secret
			//
			// Argo CD sensitive data
			// Ref:
			// https://argo-cd.readthedocs.io/en/stable/operator-manual/user-management/#sensitive-data-and-sso-client-secrets
			secret?: close({
				// annotations
				//
				// Annotations to be added to argocd-secret
				annotations?: close({})

				// argocdServerAdminPassword
				//
				// Bcrypt hashed admin password
				// # Argo expects the password in the secret to be bcrypt hashed.
				// You can create this hash with
				// # `htpasswd -nbBC 10 "" $ARGO_PWD | tr -d ':\n' | sed
				// 's/$2y/$2a/'`
				argocdServerAdminPassword?: string | *""

				// argocdServerAdminPasswordMtime
				//
				// Admin password modification time. Eg. `"2006-01-02T15:04:05Z"`
				argocdServerAdminPasswordMtime?: string | *""

				// azureDevops
				//
				// # Azure DevOps
				azureDevops?: close({
					// password
					//
					// Shared secret password for authenticating Azure DevOps webhook
					// events
					password?: string | *""

					// username
					//
					// Shared secret username for authenticating Azure DevOps webhook
					// events
					username?: string | *""
				})

				// bitbucketServerSecret
				//
				// Shared secret for authenticating BitbucketServer webhook events
				bitbucketServerSecret?: string | *""

				// bitbucketUUID
				//
				// UUID for authenticating Bitbucket webhook events
				bitbucketUUID?: string | *""

				// createSecret
				//
				// Create the argocd-secret
				createSecret?: bool | *true

				// extra
				//
				// add additional secrets to be added to argocd-secret
				// # Custom secrets. Useful for injecting SSO secrets into
				// environment variables.
				// # Ref:
				// https://argo-cd.readthedocs.io/en/stable/operator-manual/user-management/#sensitive-data-and-sso-client-secrets
				// # Note that all values must be non-empty.
				extra?: close({})

				// githubSecret
				//
				// Shared secret for authenticating GitHub webhook events
				githubSecret?: string | *""

				// gitlabSecret
				//
				// Shared secret for authenticating GitLab webhook events
				gitlabSecret?: string | *""

				// gogsSecret
				//
				// Shared secret for authenticating Gogs webhook events
				gogsSecret?: string | *""

				// labels
				//
				// Labels to be added to argocd-secret
				labels?: close({})
			})

			// ssh
			//
			// SSH known hosts for Git repositories
			// # Ref:
			// https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/#ssh-known-host-public-keys
			ssh?: close({
				// annotations
				//
				// Annotations to be added to argocd-ssh-known-hosts-cm configmap
				annotations?: close({})

				// create
				//
				// Specifies if the argocd-ssh-known-hosts-cm configmap should be
				// created by Helm.
				create?: bool | *true

				// extraHosts
				//
				// Additional known hosts for private repositories
				extraHosts?: string | *""

				// knownHosts
				//
				// Known hosts to be added to the known host list by default.
				knownHosts?: string | *"""
					[ssh.github.com]:443 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg=
					[ssh.github.com]:443 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl
					[ssh.github.com]:443 ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCj7ndNxQowgcQnjshcLrqPEiiphnt+VTTvDP6mHBL9j1aNUkY4Ue1gvwnGLVlOhGeYrnZaMgRK6+PKCUXaDbC7qtbW8gIkhL7aGCsOr/C56SJMy/BCZfxd1nWzAOxSDPgVsmerOBYfNqltV9/hWCqBywINIR+5dIg6JTJ72pcEpEjcYgXkE2YEFXV1JHnsKgbLWNlhScqb2UmyRkQyytRLtL+38TGxkxCflmO+5Z8CSSNY7GidjMIZ7Q4zMjA2n1nGrlTDkzwDCsw+wqFPGQA179cnfGWOWRVruj16z6XyvxvjJwbz0wQZ75XK5tKSb7FNyeIEs4TT4jk+S4dhPeAUC5y+bDYirYgM4GC7uEnztnZyaVWQ7B381AK4Qdrwt51ZqExKbQpTUNn+EjqoTwvqNj4kqx5QUCI0ThS/YkOxJCXmPUWZbhjpCg56i+2aB6CmK2JGhn57K5mj0MNdBXA4/WnwH6XoPWJzK5Nyu2zB3nAZp+S5hpQs+p1vN1/wsjk=
					bitbucket.org ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBPIQmuzMBuKdWeF4+a2sjSSpBK0iqitSQ+5BM9KhpexuGt20JpTVM7u5BDZngncgrqDMbWdxMWWOGtZ9UgbqgZE=
					bitbucket.org ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIazEu89wgQZ4bqs3d63QSMzYVa0MuJ2e2gKTKqu+UUO
					bitbucket.org ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDQeJzhupRu0u0cdegZIa8e86EG2qOCsIsD1Xw0xSeiPDlCr7kq97NLmMbpKTX6Esc30NuoqEEHCuc7yWtwp8dI76EEEB1VqY9QJq6vk+aySyboD5QF61I/1WeTwu+deCbgKMGbUijeXhtfbxSxm6JwGrXrhBdofTsbKRUsrN1WoNgUa8uqN1Vx6WAJw1JHPhglEGGHea6QICwJOAr/6mrui/oB7pkaWKHj3z7d1IC4KWLtY47elvjbaTlkN04Kc/5LFEirorGYVbt15kAUlqGM65pk6ZBxtaO3+30LVlORZkxOh+LKL/BvbZ/iRNhItLqNyieoQj/uh/7Iv4uyH/cV/0b4WDSd3DptigWq84lJubb9t/DnZlrJazxyDCulTmKdOR7vs9gMTo+uoIrPSb8ScTtvw65+odKAlBj59dhnVp9zd7QUojOpXlL62Aw56U4oO+FALuevvMjiWeavKhJqlR7i5n9srYcrNV7ttmDw7kf/97P5zauIhxcjX+xHv4M=
					github.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg=
					github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl
					github.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCj7ndNxQowgcQnjshcLrqPEiiphnt+VTTvDP6mHBL9j1aNUkY4Ue1gvwnGLVlOhGeYrnZaMgRK6+PKCUXaDbC7qtbW8gIkhL7aGCsOr/C56SJMy/BCZfxd1nWzAOxSDPgVsmerOBYfNqltV9/hWCqBywINIR+5dIg6JTJ72pcEpEjcYgXkE2YEFXV1JHnsKgbLWNlhScqb2UmyRkQyytRLtL+38TGxkxCflmO+5Z8CSSNY7GidjMIZ7Q4zMjA2n1nGrlTDkzwDCsw+wqFPGQA179cnfGWOWRVruj16z6XyvxvjJwbz0wQZ75XK5tKSb7FNyeIEs4TT4jk+S4dhPeAUC5y+bDYirYgM4GC7uEnztnZyaVWQ7B381AK4Qdrwt51ZqExKbQpTUNn+EjqoTwvqNj4kqx5QUCI0ThS/YkOxJCXmPUWZbhjpCg56i+2aB6CmK2JGhn57K5mj0MNdBXA4/WnwH6XoPWJzK5Nyu2zB3nAZp+S5hpQs+p1vN1/wsjk=
					gitlab.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBFSMqzJeV9rUzU4kWitGjeR4PWSa29SPqJ1fVkhtj3Hw9xjLVXVYrU9QlYWrOLXBpQ6KWjbjTDTdDkoohFzgbEY=
					gitlab.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAfuCHKVTjquxvt6CM6tdG4SLp1Btn/nOeHHE5UOzRdf
					gitlab.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsj2bNKTBSpIYDEGk9KxsGh3mySTRgMtXL583qmBpzeQ+jqCMRgBqB98u3z++J1sKlXHWfM9dyhSevkMwSbhoR8XIq/U0tCNyokEi/ueaBMCvbcTHhO7FcwzY92WK4Yt0aGROY5qX2UKSeOvuP4D6TPqKF1onrSzH9bx9XUf2lEdWT/ia1NEKjunUqu1xOB/StKDHMoX4/OKyIzuS0q/T1zOATthvasJFoPrAjkohTyaDUz2LN5JoH839hViyEG82yB+MjcFV5MU3N1l1QL3cVUCh93xSaua1N85qivl+siMkPGbO5xR/En4iEY6K2XPASUEMaieWVNTRCtJ4S8H+9
					ssh.dev.azure.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7Hr1oTWqNqOlzGJOfGJ4NakVyIzf1rXYd4d7wo6jBlkLvCA4odBlL0mDUyZ0/QUfTTqeu+tm22gOsv+VrVTMk6vwRU75gY/y9ut5Mb3bR5BV58dKXyq9A9UeB5Cakehn5Zgm6x1mKoVyf+FFn26iYqXJRgzIZZcZ5V6hrE0Qg39kZm4az48o0AUbf6Sp4SLdvnuMa2sVNwHBboS7EJkm57XQPVU3/QpyNLHbWDdzwtrlS+ez30S3AdYhLKEOxAG8weOnyrtLJAUen9mTkol8oII1edf7mWWbWVf0nBmly21+nZcmCTISQBtdcyPaEno7fFQMDD26/s0lfKob4Kw8H
					vs-ssh.visualstudio.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7Hr1oTWqNqOlzGJOfGJ4NakVyIzf1rXYd4d7wo6jBlkLvCA4odBlL0mDUyZ0/QUfTTqeu+tm22gOsv+VrVTMk6vwRU75gY/y9ut5Mb3bR5BV58dKXyq9A9UeB5Cakehn5Zgm6x1mKoVyf+FFn26iYqXJRgzIZZcZ5V6hrE0Qg39kZm4az48o0AUbf6Sp4SLdvnuMa2sVNwHBboS7EJkm57XQPVU3/QpyNLHbWDdzwtrlS+ez30S3AdYhLKEOxAG8weOnyrtLJAUen9mTkol8oII1edf7mWWbWVf0nBmly21+nZcmCTISQBtdcyPaEno7fFQMDD26/s0lfKob4Kw8H

					"""
			})

			// styles
			//
			// Define custom [CSS styles] for your argo instance.
			// This setting will automatically mount the provided CSS and
			// reference it in the argo configuration.
			// # Ref:
			// https://argo-cd.readthedocs.io/en/stable/operator-manual/custom-styles/
			styles?: string | *""

			// tls
			//
			// Repository TLS certificates
			// Ref:
			// https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/#repositories-using-self-signed-tls-certificates-or-are-signed-by-custom-ca
			tls?: close({
				// annotations
				//
				// Annotations to be added to argocd-tls-certs-cm configmap
				annotations?: close({})

				// certificates
				//
				// TLS certificates for Git repositories
				certificates?: close({})
			})
		})

		// controller
		//
		// # Application controller
		controller?: close({
			// affinity
			//
			// Assign custom [affinity] rules to the deployment
			affinity?: close({})

			// automountServiceAccountToken
			//
			// Automount API credentials for the Service Account into the pod.
			automountServiceAccountToken?: bool | *true

			// clusterRoleRules
			//
			// # Enable this and set the rules: to whatever custom rules you
			// want for the Cluster Role resource.
			// # Defaults to off
			clusterRoleRules?: close({
				// enabled
				//
				// Enable custom rules for the application controller's
				// ClusterRole resource
				enabled?: bool | *false

				// rules
				//
				// List of custom rules for the application controller's
				// ClusterRole resource
				rules?: [...null | bool | number | string | [...] | {
					...
				}]
			})

			// containerPorts
			//
			// Application controller container ports
			containerPorts?: close({
				// metrics
				//
				// Metrics container port
				metrics?: int | *8082
			})

			// containerSecurityContext
			//
			// Application controller container-level security context
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

				// runAsNonRoot
				runAsNonRoot?: bool | *true

				// seccompProfile
				seccompProfile?: close({
					// type
					type?: string | *"RuntimeDefault"
				})
			})

			// deploymentAnnotations
			//
			// Annotations for the application controller Deployment
			deploymentAnnotations?: close({})

			// dnsConfig
			//
			// [DNS configuration]
			dnsConfig?: close({})

			// dnsPolicy
			//
			// Alternative DNS policy for application controller pods
			dnsPolicy?: string | *"ClusterFirst"

			// dynamicClusterDistribution
			//
			// Enable dynamic cluster distribution (alpha)
			// Ref:
			// https://argo-cd.readthedocs.io/en/stable/operator-manual/dynamic-cluster-distribution
			// # This is done using a deployment instead of a statefulSet
			// # When replicas are added or removed, the sharding algorithm is
			// re-run to ensure that the
			// # clusters are distributed according to the algorithm. If the
			// algorithm is well-balanced,
			// # like round-robin, then the shards will be well-balanced.
			dynamicClusterDistribution?: bool | *false

			// emptyDir
			//
			// # Application controller emptyDir volumes
			emptyDir?: close({
				// sizeLimit
				//
				// EmptyDir size limit for application controller
				sizeLimit?: string | *""
			})

			// env
			//
			// Environment variables to pass to application controller
			env?: [...null | bool | number | string | [...] | {
				...
			}]

			// envFrom
			//
			// envFrom to pass to application controller
			envFrom?: [...null | bool | number | string | [...] | {
				...
			}]

			// extraArgs
			//
			// Additional command line arguments to pass to application
			// controller
			extraArgs?: [...null | bool | number | string | [...] | {
				...
			}]

			// extraContainers
			//
			// Additional containers to be added to the application controller
			// pod
			// # Note: Supports use of custom Helm templates
			extraContainers?: [...null | bool | number | string | [...] | {
				...
			}]

			// heartbeatTime
			//
			// Application controller heartbeat time
			// Ref:
			// https://argo-cd.readthedocs.io/en/stable/operator-manual/dynamic-cluster-distribution/#working-of-dynamic-distribution
			heartbeatTime?: int | *10

			// hostNetwork
			//
			// Host Network for application controller pods
			hostNetwork?: bool | *false

			// image
			//
			// # Application controller image
			image?: close({
				// imagePullPolicy
				//
				// Image pull policy for the application controller
				imagePullPolicy?: string | *""

				// repository
				//
				// Repository to use for the application controller
				repository?: string | *""

				// tag
				//
				// Tag to use for the application controller
				tag?: string | *""
			})

			// imagePullSecrets
			//
			// Secrets with credentials to pull images from a private registry
			imagePullSecrets?: [...null | bool | number | string | [...] | {
				...
			}]

			// initContainers
			//
			// Init containers to add to the application controller pod
			// # If your target Kubernetes cluster(s) require a custom
			// credential (exec) plugin
			// # you could use this (and the same in the server pod) to
			// provide such executable
			// # Ref:
			// https://kubernetes.io/docs/reference/access-authn-authz/authentication/#client-go-credential-plugins
			// # Note: Supports use of custom Helm templates
			initContainers?: [...null | bool | number | string | [...] | {
				...
			}]

			// metrics
			//
			// # Application controller metrics configuration
			metrics?: close({
				// applicationLabels
				applicationLabels?: close({
					// enabled
					//
					// Enables additional labels in argocd_app_labels metric
					enabled?: bool | *false

					// labels
					//
					// Additional labels
					labels?: [...null | bool | number | string | [...] | {
						...
					}]
				})

				// enabled
				//
				// Deploy metrics service
				enabled?: bool | *false

				// rules
				rules?: close({
					// additionalLabels
					//
					// PrometheusRule labels
					additionalLabels?: close({})

					// annotations
					//
					// PrometheusRule annotations
					annotations?: close({})

					// enabled
					//
					// Deploy a PrometheusRule for the application controller
					enabled?: bool | *false

					// namespace
					//
					// PrometheusRule namespace
					namespace?: string | *""

					// selector
					//
					// PrometheusRule selector
					selector?: close({})

					// spec
					//
					// PrometheusRule.Spec for the application controller
					spec?: [...null | bool | number | string | [...] | {
						...
					}]
				})

				// scrapeTimeout
				//
				// Prometheus ServiceMonitor scrapeTimeout. If empty, Prometheus
				// uses the global scrape timeout unless it is less than the
				// target's scrape interval value in which the latter is used.
				scrapeTimeout?: string | *""

				// service
				service?: close({
					// annotations
					//
					// Metrics service annotations
					annotations?: close({})

					// clusterIP
					//
					// Metrics service clusterIP. `None` makes a "headless service"
					// (no virtual IP)
					clusterIP?: string | *""

					// labels
					//
					// Metrics service labels
					labels?: close({})

					// portName
					//
					// Metrics service port name
					portName?: string | *"http-metrics"

					// servicePort
					//
					// Metrics service port
					servicePort?: int | *8082

					// type
					//
					// Metrics service type
					type?: string | *"ClusterIP"
				})

				// serviceMonitor
				serviceMonitor?: close({
					// additionalLabels
					//
					// Prometheus ServiceMonitor labels
					additionalLabels?: close({})

					// annotations
					//
					// Prometheus ServiceMonitor annotations
					annotations?: close({})

					// enabled
					//
					// Enable a prometheus ServiceMonitor
					enabled?: bool | *false

					// honorLabels
					//
					// When true, honorLabels preserves the metric’s labels when they
					// collide with the target’s labels.
					honorLabels?: bool | *false

					// interval
					//
					// Prometheus ServiceMonitor interval
					interval?: string | *"30s"

					// metricRelabelings
					//
					// Prometheus [MetricRelabelConfigs] to apply to samples before
					// ingestion
					metricRelabelings?: [...null | bool | number | string | [...] | {
						...
					}]

					// namespace
					//
					// Prometheus ServiceMonitor namespace
					namespace?: string | *""

					// relabelings
					//
					// Prometheus [RelabelConfigs] to apply to samples before scraping
					relabelings?: [...null | bool | number | string | [...] | {
						...
					}]

					// scheme
					//
					// Prometheus ServiceMonitor scheme
					scheme?: string | *""

					// selector
					//
					// Prometheus ServiceMonitor selector
					selector?: close({})

					// tlsConfig
					//
					// Prometheus ServiceMonitor tlsConfig
					tlsConfig?: close({})
				})
			})

			// name
			//
			// Application controller name string
			name?: string | *"application-controller"

			// nodeSelector
			//
			// [Node selector]
			nodeSelector?: close({})

			// pdb
			//
			// # Application controller Pod Disruption Budget
			// # Ref:
			// https://kubernetes.io/docs/tasks/run-application/configure-pdb/
			pdb?: close({
				// annotations
				//
				// Annotations to be added to application controller pdb
				annotations?: close({})

				// enabled
				//
				// Deploy a [PodDisruptionBudget] for the application controller
				enabled?: bool | *false

				// labels
				//
				// Labels to be added to application controller pdb
				labels?: close({})

				// maxUnavailable
				//
				// Number of pods that are unavailable after eviction as number or
				// percentage (eg.: 50%).
				// # Has higher precedence over `controller.pdb.minAvailable`
				maxUnavailable?: string | *""

				// minAvailable
				//
				// Number of pods that are available after eviction as number or
				// percentage (eg.: 50%)
				minAvailable?: string | *""
			})

			// podAnnotations
			//
			// Annotations to be added to application controller pods
			podAnnotations?: close({})

			// podLabels
			//
			// Labels to be added to application controller pods
			podLabels?: close({})

			// priorityClassName
			//
			// Priority class for the application controller pods
			priorityClassName?: string | *""

			// readinessProbe
			//
			// Readiness probe for application controller
			// # Ref:
			// https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/
			readinessProbe?: close({
				// failureThreshold
				//
				// Minimum consecutive failures for the [probe] to be considered
				// failed after having succeeded
				failureThreshold?: int | *3

				// initialDelaySeconds
				//
				// Number of seconds after the container has started before
				// [probe] is initiated
				initialDelaySeconds?: int | *10

				// periodSeconds
				//
				// How often (in seconds) to perform the [probe]
				periodSeconds?: int | *10

				// successThreshold
				//
				// Minimum consecutive successes for the [probe] to be considered
				// successful after having failed
				successThreshold?: int | *1

				// timeoutSeconds
				//
				// Number of seconds after which the [probe] times out
				timeoutSeconds?: int | *1
			})

			// replicas
			//
			// The number of application controller pods to run.
			// Additional replicas will cause sharding of managed clusters
			// across number of replicas.
			// # With dynamic cluster distribution turned on, sharding of the
			// clusters will gracefully
			// # rebalance if the number of replica's changes or one becomes
			// unhealthy. (alpha)
			replicas?: int | *1

			// resources
			//
			// Resource limits and requests for the application controller
			// pods
			resources?: close({})

			// revisionHistoryLimit
			//
			// Maximum number of controller revisions that will be maintained
			// in StatefulSet history
			revisionHistoryLimit?: int | *5

			// runtimeClassName
			//
			// Runtime class name for the application controller
			runtimeClassName?: string | *""

			// serviceAccount
			serviceAccount?: close({
				// annotations
				//
				// Annotations applied to created service account
				annotations?: close({})

				// automountServiceAccountToken
				//
				// Automount API credentials for the Service Account
				automountServiceAccountToken?: bool | *true

				// create
				//
				// Create a service account for the application controller
				create?: bool | *true

				// labels
				//
				// Labels applied to created service account
				labels?: close({})

				// name
				//
				// Service account name
				name?: string | *"argocd-application-controller"
			})

			// statefulsetAnnotations
			//
			// Annotations for the application controller StatefulSet
			statefulsetAnnotations?: close({})

			// terminationGracePeriodSeconds
			//
			// terminationGracePeriodSeconds for container lifecycle hook
			terminationGracePeriodSeconds?: int | *30

			// tolerations
			//
			// [Tolerations] for use with node taints
			tolerations?: [...null | bool | number | string | [...] | {
				...
			}]

			// topologySpreadConstraints
			//
			// Assign custom [TopologySpreadConstraints] rules to the
			// application controller
			// # Ref:
			// https://kubernetes.io/docs/concepts/workloads/pods/pod-topology-spread-constraints/
			// # If labelSelector is left out, it will default to the
			// labelSelector configuration of the deployment
			topologySpreadConstraints?: [...null | bool | number | string | [...] | {
				...
			}]

			// volumeMounts
			//
			// Additional volumeMounts to the application controller main
			// container
			volumeMounts?: [...null | bool | number | string | [...] | {
				...
			}]

			// volumes
			//
			// Additional volumes to the application controller pod
			volumes?: [...null | bool | number | string | [...] | {
				...
			}]
		})

		// crds
		//
		// # Custom resource configuration
		crds?: close({
			// additionalLabels
			//
			// Addtional labels to be added to all CRDs
			additionalLabels?: close({})

			// annotations
			//
			// Annotations to be added to all CRDs
			annotations?: close({})

			// install
			//
			// Install and upgrade CRDs
			install?: bool | *true

			// keep
			//
			// Keep CRDs on chart uninstall
			keep?: bool | *true
		})

		// createAggregateRoles
		//
		// Create aggregated roles that extend existing cluster roles to
		// interact with argo-cd resources
		// # Ref:
		// https://kubernetes.io/docs/reference/access-authn-authz/rbac/#aggregated-clusterroles
		createAggregateRoles?: bool | *false

		// createClusterRoles
		//
		// Create cluster roles for cluster-wide installation.
		// # Used when you manage applications in the same cluster where
		// Argo CD runs
		createClusterRoles?: bool | *true

		// dex
		//
		// # Dex
		dex?: close({
			// affinity
			//
			// Assign custom [affinity] rules to the deployment
			affinity?: close({})

			// automountServiceAccountToken
			//
			// Automount API credentials for the Service Account into the pod.
			automountServiceAccountToken?: bool | *true

			// certificateSecret
			//
			// TLS certificate configuration via Secret
			// # Ref:
			// https://argo-cd.readthedocs.io/en/stable/operator-manual/tls/#configuring-tls-to-argocd-dex-server
			// # Note: Issuing certificates via cert-manager in not supported
			// right now because it's not possible to restart Dex
			// automatically without extra controllers.
			certificateSecret?: close({
				// annotations
				//
				// Annotations to be added to argocd-dex-server-tls secret
				annotations?: close({})

				// ca
				//
				// Certificate authority. Required for self-signed certificates.
				ca?: string | *""

				// crt
				//
				// Certificate data. Must contain SANs of Dex service (ie:
				// argocd-dex-server, argocd-dex-server.argo-cd.svc)
				crt?: string | *""

				// enabled
				//
				// Create argocd-dex-server-tls secret
				enabled?: bool | *false

				// key
				//
				// Certificate private key
				key?: string | *""

				// labels
				//
				// Labels to be added to argocd-dex-server-tls secret
				labels?: close({})
			})

			// containerPorts
			//
			// Dex container ports
			// NOTE: These ports are currently hardcoded and cannot be changed
			containerPorts?: close({
				// grpc
				//
				// gRPC container port
				grpc?: int | *5557

				// http
				//
				// HTTP container port
				http?: int | *5556

				// metrics
				//
				// Metrics container port
				metrics?: int | *5558
			})

			// containerSecurityContext
			//
			// Dex container-level security context
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

				// runAsNonRoot
				runAsNonRoot?: bool | *true

				// seccompProfile
				seccompProfile?: close({
					// type
					type?: string | *"RuntimeDefault"
				})
			})

			// deploymentAnnotations
			//
			// Annotations to be added to the Dex server Deployment
			deploymentAnnotations?: close({})

			// deploymentStrategy
			//
			// Deployment strategy to be added to the Dex server Deployment
			deploymentStrategy?: close({})

			// dnsConfig
			//
			// [DNS configuration]
			dnsConfig?: close({})

			// dnsPolicy
			//
			// Alternative DNS policy for Dex server pods
			dnsPolicy?: string | *"ClusterFirst"

			// emptyDir
			//
			// # Dex server emptyDir volumes
			emptyDir?: close({
				// sizeLimit
				//
				// EmptyDir size limit for Dex server
				sizeLimit?: string | *""
			})

			// enabled
			//
			// Enable dex
			enabled?: bool | *true

			// env
			//
			// Environment variables to pass to the Dex server
			env?: [...null | bool | number | string | [...] | {
				...
			}]

			// envFrom
			//
			// envFrom to pass to the Dex server
			envFrom?: [...null | bool | number | string | [...] | {
				...
			}]

			// extraArgs
			//
			// Additional command line arguments to pass to the Dex server
			extraArgs?: [...null | bool | number | string | [...] | {
				...
			}]

			// extraContainers
			//
			// Additional containers to be added to the dex pod
			// # Note: Supports use of custom Helm templates
			extraContainers?: [...null | bool | number | string | [...] | {
				...
			}]

			// image
			//
			// # Dex image
			image?: close({
				// imagePullPolicy
				//
				// Dex imagePullPolicy
				imagePullPolicy?: string | *""

				// repository
				//
				// Dex image repository
				repository?: string | *"ghcr.io/dexidp/dex"

				// tag
				//
				// Dex image tag
				tag?: string | *"v2.41.1"
			})

			// imagePullSecrets
			//
			// Secrets with credentials to pull images from a private registry
			imagePullSecrets?: [...null | bool | number | string | [...] | {
				...
			}]

			// initContainers
			//
			// Init containers to add to the dex pod
			// # Note: Supports use of custom Helm templates
			initContainers?: [...null | bool | number | string | [...] | {
				...
			}]

			// initImage
			//
			// Argo CD init image that creates Dex config
			initImage?: close({
				// imagePullPolicy
				//
				// Argo CD init image imagePullPolicy
				imagePullPolicy?: string | *""

				// repository
				//
				// Argo CD init image repository
				repository?: string | *""

				// resources
				//
				// Argo CD init image resources
				resources?: close({})

				// tag
				//
				// Argo CD init image tag
				tag?: string | *""
			})

			// livenessProbe
			//
			// # Probes for Dex server
			// # Supported from Dex >= 2.28.0
			livenessProbe?: close({
				// enabled
				//
				// Enable Kubernetes liveness probe for Dex >= 2.28.0
				enabled?: bool | *false

				// failureThreshold
				//
				// Minimum consecutive failures for the [probe] to be considered
				// failed after having succeeded
				failureThreshold?: int | *3

				// httpPath
				//
				// Http path to use for the liveness probe
				httpPath?: string | *"/healthz/live"

				// httpPort
				//
				// Http port to use for the liveness probe
				httpPort?: string | *"metrics"

				// httpScheme
				//
				// Scheme to use for for the liveness probe (can be HTTP or HTTPS)
				httpScheme?: string | *"HTTP"

				// initialDelaySeconds
				//
				// Number of seconds after the container has started before
				// [probe] is initiated
				initialDelaySeconds?: int | *10

				// periodSeconds
				//
				// How often (in seconds) to perform the [probe]
				periodSeconds?: int | *10

				// successThreshold
				//
				// Minimum consecutive successes for the [probe] to be considered
				// successful after having failed
				successThreshold?: int | *1

				// timeoutSeconds
				//
				// Number of seconds after which the [probe] times out
				timeoutSeconds?: int | *1
			})

			// logFormat
			//
			// Dex log format. Either `text` or `json`
			logFormat?: string | *""

			// logLevel
			//
			// Dex log level. One of: `debug`, `info`, `warn`, `error`
			logLevel?: string | *""

			// metrics
			metrics?: close({
				// enabled
				//
				// Deploy metrics service
				enabled?: bool | *false

				// service
				service?: close({
					// annotations
					//
					// Metrics service annotations
					annotations?: close({})

					// labels
					//
					// Metrics service labels
					labels?: close({})

					// portName
					//
					// Metrics service port name
					portName?: string | *"http-metrics"
				})

				// serviceMonitor
				serviceMonitor?: close({
					// additionalLabels
					//
					// Prometheus ServiceMonitor labels
					additionalLabels?: close({})

					// annotations
					//
					// Prometheus ServiceMonitor annotations
					annotations?: close({})

					// enabled
					//
					// Enable a prometheus ServiceMonitor
					enabled?: bool | *false

					// honorLabels
					//
					// When true, honorLabels preserves the metric’s labels when they
					// collide with the target’s labels.
					honorLabels?: bool | *false

					// interval
					//
					// Prometheus ServiceMonitor interval
					interval?: string | *"30s"

					// metricRelabelings
					//
					// Prometheus [MetricRelabelConfigs] to apply to samples before
					// ingestion
					metricRelabelings?: [...null | bool | number | string | [...] | {
						...
					}]

					// namespace
					//
					// Prometheus ServiceMonitor namespace
					namespace?: string | *""

					// relabelings
					//
					// Prometheus [RelabelConfigs] to apply to samples before scraping
					relabelings?: [...null | bool | number | string | [...] | {
						...
					}]

					// scheme
					//
					// Prometheus ServiceMonitor scheme
					scheme?: string | *""

					// selector
					//
					// Prometheus ServiceMonitor selector
					selector?: close({})

					// tlsConfig
					//
					// Prometheus ServiceMonitor tlsConfig
					tlsConfig?: close({})
				})
			})

			// name
			//
			// Dex name
			name?: string | *"dex-server"

			// nodeSelector
			//
			// [Node selector]
			nodeSelector?: close({})

			// pdb
			//
			// # Dex Pod Disruption Budget
			// # Ref:
			// https://kubernetes.io/docs/tasks/run-application/configure-pdb/
			pdb?: close({
				// annotations
				//
				// Annotations to be added to Dex server pdb
				annotations?: close({})

				// enabled
				//
				// Deploy a [PodDisruptionBudget] for the Dex server
				enabled?: bool | *false

				// labels
				//
				// Labels to be added to Dex server pdb
				labels?: close({})

				// maxUnavailable
				//
				// Number of pods that are unavailble after eviction as number or
				// percentage (eg.: 50%).
				// # Has higher precedence over `dex.pdb.minAvailable`
				maxUnavailable?: string | *""

				// minAvailable
				//
				// Number of pods that are available after eviction as number or
				// percentage (eg.: 50%)
				minAvailable?: string | *""
			})

			// podAnnotations
			//
			// Annotations to be added to the Dex server pods
			podAnnotations?: close({})

			// podLabels
			//
			// Labels to be added to the Dex server pods
			podLabels?: close({})

			// priorityClassName
			//
			// Priority class for the dex pods
			priorityClassName?: string | *""

			// readinessProbe
			readinessProbe?: close({
				// enabled
				//
				// Enable Kubernetes readiness probe for Dex >= 2.28.0
				enabled?: bool | *false

				// failureThreshold
				//
				// Minimum consecutive failures for the [probe] to be considered
				// failed after having succeeded
				failureThreshold?: int | *3

				// httpPath
				//
				// Http path to use for the readiness probe
				httpPath?: string | *"/healthz/ready"

				// httpPort
				//
				// Http port to use for the readiness probe
				httpPort?: string | *"metrics"

				// httpScheme
				//
				// Scheme to use for for the liveness probe (can be HTTP or HTTPS)
				httpScheme?: string | *"HTTP"

				// initialDelaySeconds
				//
				// Number of seconds after the container has started before
				// [probe] is initiated
				initialDelaySeconds?: int | *10

				// periodSeconds
				//
				// How often (in seconds) to perform the [probe]
				periodSeconds?: int | *10

				// successThreshold
				//
				// Minimum consecutive successes for the [probe] to be considered
				// successful after having failed
				successThreshold?: int | *1

				// timeoutSeconds
				//
				// Number of seconds after which the [probe] times out
				timeoutSeconds?: int | *1
			})

			// resources
			//
			// Resource limits and requests for dex
			resources?: close({})

			// runtimeClassName
			//
			// Runtime class name for Dex
			runtimeClassName?: string | *""

			// serviceAccount
			serviceAccount?: close({
				// annotations
				//
				// Annotations applied to created service account
				annotations?: close({})

				// automountServiceAccountToken
				//
				// Automount API credentials for the Service Account
				automountServiceAccountToken?: bool | *true

				// create
				//
				// Create dex service account
				create?: bool | *true

				// name
				//
				// Dex service account name
				name?: string | *"argocd-dex-server"
			})

			// servicePortGrpc
			//
			// Service port for gRPC access
			servicePortGrpc?: int | *5557

			// servicePortGrpcName
			//
			// Service port name for gRPC access
			servicePortGrpcName?: string | *"grpc"

			// servicePortHttp
			//
			// Service port for HTTP access
			servicePortHttp?: int | *5556

			// servicePortHttpName
			//
			// Service port name for HTTP access
			servicePortHttpName?: string | *"http"

			// servicePortMetrics
			//
			// Service port for metrics access
			servicePortMetrics?: int | *5558

			// terminationGracePeriodSeconds
			//
			// terminationGracePeriodSeconds for container lifecycle hook
			terminationGracePeriodSeconds?: int | *30

			// tolerations
			//
			// [Tolerations] for use with node taints
			tolerations?: [...null | bool | number | string | [...] | {
				...
			}]

			// topologySpreadConstraints
			//
			// Assign custom [TopologySpreadConstraints] rules to dex
			// # Ref:
			// https://kubernetes.io/docs/concepts/workloads/pods/pod-topology-spread-constraints/
			// # If labelSelector is left out, it will default to the
			// labelSelector configuration of the deployment
			topologySpreadConstraints?: [...null | bool | number | string | [...] | {
				...
			}]

			// volumeMounts
			//
			// Additional volumeMounts to the dex main container
			volumeMounts?: [...null | bool | number | string | [...] | {
				...
			}]

			// volumes
			//
			// Additional volumes to the dex pod
			volumes?: [...null | bool | number | string | [...] | {
				...
			}]
		})

		// externalRedis
		//
		// External Redis parameters
		externalRedis?: close({
			// existingSecret
			//
			// The name of an existing secret with Redis (must contain key
			// `redis-password`) and Sentinel credentials.
			// When it's set, the `externalRedis.password` parameter is
			// ignored
			existingSecret?: string | *""

			// host
			//
			// External Redis server host
			host?: string | *""

			// password
			//
			// External Redis password
			password?: string | *""

			// port
			//
			// External Redis server port
			port?: int | *6379

			// secretAnnotations
			//
			// External Redis Secret annotations
			secretAnnotations?: close({})

			// username
			//
			// External Redis username
			username?: string | *""
		})

		// extraObjects
		//
		// Array of extra K8s manifests to deploy
		// # Note: Supports use of custom Helm templates
		extraObjects?: [...null | bool | number | string | [...] | {
			...
		}]

		// fullnameOverride
		//
		// String to fully override `"argo-cd.fullname"`
		fullnameOverride?: string | *""

		// global
		//
		// # Globally shared configuration
		global?: close({
			// addPrometheusAnnotations
			//
			// Add Prometheus scrape annotations to all metrics services. This
			// can be used as an alternative to the ServiceMonitors.
			addPrometheusAnnotations?: bool | *false

			// additionalLabels
			//
			// Common labels for the all resources
			additionalLabels?: close({})

			// affinity
			//
			// Default affinity preset for all components
			affinity?: close({
				// nodeAffinity
				//
				// Node affinity rules
				nodeAffinity?: close({
					// matchExpressions
					//
					// Default match expressions for node affinity
					matchExpressions?: [...null | bool | number | string | [...] | {
						...
					}]

					// type
					//
					// Default node affinity rules. Either: `none`, `soft` or `hard`
					type?: string | *"hard"
				})

				// podAntiAffinity
				//
				// Default pod anti-affinity rules. Either: `none`, `soft` or
				// `hard`
				podAntiAffinity?: string | *"soft"
			})

			// certificateAnnotations
			//
			// Annotations for the all deployed Certificates
			certificateAnnotations?: close({})

			// deploymentAnnotations
			//
			// Annotations for the all deployed Deployments
			deploymentAnnotations?: close({})

			// deploymentStrategy
			//
			// Deployment strategy for the all deployed Deployments
			deploymentStrategy?: close({})

			// domain
			//
			// Default domain used by all components
			// # Used for ingresses, certificates, SSO, notifications, etc.
			domain?: string | *"argocd.example.com"

			// dualStack
			//
			// Configure dual-stack used by all component services
			dualStack?: close({
				// ipFamilies
				//
				// IP families that should be supported and the order in which
				// they should be applied to ClusterIP as well. Can be IPv4
				// and/or IPv6.
				ipFamilies?: [...null | bool | number | string | [...] | {
					...
				}]

				// ipFamilyPolicy
				//
				// IP family policy to configure dual-stack see [Configure
				// dual-stack](https://kubernetes.io/docs/concepts/services-networking/dual-stack/#services)
				ipFamilyPolicy?: string | *""
			})

			// env
			//
			// Environment variables to pass to all deployed Deployments
			env?: [...null | bool | number | string | [...] | {
				...
			}]

			// hostAliases
			//
			// Mapping between IP and hostnames that will be injected as
			// entries in the pod's hosts files
			hostAliases?: [...null | bool | number | string | [...] | {
				...
			}]

			// image
			//
			// Default image used by all components
			image?: close({
				// imagePullPolicy
				//
				// If defined, a imagePullPolicy applied to all Argo CD
				// deployments
				imagePullPolicy?: string | *"IfNotPresent"

				// repository
				//
				// If defined, a repository applied to all Argo CD deployments
				repository?: string | *"quay.io/argoproj/argocd"

				// tag
				//
				// Overrides the global Argo CD image tag whose default is the
				// chart appVersion
				tag?: string | *""
			})

			// imagePullSecrets
			//
			// Secrets with credentials to pull images from a private registry
			imagePullSecrets?: [...null | bool | number | string | [...] | {
				...
			}]

			// logging
			//
			// Default logging options used by all components
			logging?: close({
				// format
				//
				// Set the global logging format. Either: `text` or `json`
				format?: string | *"text"

				// level
				//
				// Set the global logging level. One of: `debug`, `info`, `warn`
				// or `error`
				level?: string | *"info"
			})

			// networkPolicy
			//
			// Default network policy rules used by all components
			networkPolicy?: close({
				// create
				//
				// Create NetworkPolicy objects for all components
				create?: bool | *false

				// defaultDenyIngress
				//
				// Default deny all ingress traffic
				defaultDenyIngress?: bool | *false
			})

			// nodeSelector
			//
			// Default node selector for all components
			nodeSelector?: close({})

			// podAnnotations
			//
			// Annotations for the all deployed pods
			podAnnotations?: close({})

			// podLabels
			//
			// Labels for the all deployed pods
			podLabels?: close({})

			// priorityClassName
			//
			// Default priority class for all components
			priorityClassName?: string | *""

			// revisionHistoryLimit
			//
			// Number of old deployment ReplicaSets to retain. The rest will
			// be garbage collected.
			revisionHistoryLimit?: int | *3

			// runtimeClassName
			//
			// Runtime class name for all components
			runtimeClassName?: string | *""

			// securityContext
			//
			// Toggle and define pod-level security context.
			securityContext?: close({})

			// statefulsetAnnotations
			//
			// Annotations for the all deployed Statefulsets
			statefulsetAnnotations?: close({})

			// tolerations
			//
			// Default tolerations for all components
			tolerations?: [...null | bool | number | string | [...] | {
				...
			}]

			// topologySpreadConstraints
			//
			// Default [TopologySpreadConstraints] rules for all components
			// # Ref:
			// https://kubernetes.io/docs/concepts/workloads/pods/pod-topology-spread-constraints/
			// # If labelSelector is left out, it will default to the
			// labelSelector of the component
			topologySpreadConstraints?: [...null | bool | number | string | [...] | {
				...
			}]
		})

		// kubeVersionOverride
		//
		// Override the Kubernetes version, which is used to evaluate
		// certain manifests
		kubeVersionOverride?: string | *""

		// nameOverride
		//
		// Provide a name in place of `argocd`
		nameOverride?: string | *"argocd"

		// namespaceOverride
		//
		// Override the namespace
		namespaceOverride?: string | *""

		// notifications
		//
		// # Notifications controller
		notifications?: close({
			// affinity
			//
			// Assign custom [affinity] rules
			affinity?: close({})

			// argocdUrl
			//
			// Argo CD dashboard url; used in place of {{.context.argocdUrl}}
			// in templates
			argocdUrl?: string | *""

			// automountServiceAccountToken
			//
			// Automount API credentials for the Service Account into the pod.
			automountServiceAccountToken?: bool | *true

			// clusterRoleRules
			//
			// # Enable this and set the rules: to whatever custom rules you
			// want for the Cluster Role resource.
			// # Defaults to off
			clusterRoleRules?: close({
				// rules
				//
				// List of custom rules for the notifications controller's
				// ClusterRole resource
				rules?: [...null | bool | number | string | [...] | {
					...
				}]
			})

			// cm
			cm?: close({
				// create
				//
				// Whether helm chart creates notifications controller config map
				create?: bool | *true
			})

			// containerPorts
			//
			// Notification controller container ports
			containerPorts?: close({
				// metrics
				//
				// Metrics container port
				metrics?: int | *9001
			})

			// containerSecurityContext
			//
			// Notification controller container-level security Context
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

				// runAsNonRoot
				runAsNonRoot?: bool | *true

				// seccompProfile
				seccompProfile?: close({
					// type
					type?: string | *"RuntimeDefault"
				})
			})

			// context
			//
			// Define user-defined context
			// # For more information:
			// https://argo-cd.readthedocs.io/en/stable/operator-manual/notifications/templates/#defining-user-defined-context
			context?: close({})

			// deploymentAnnotations
			//
			// Annotations to be applied to the notifications controller
			// Deployment
			deploymentAnnotations?: close({})

			// deploymentStrategy
			//
			// Deployment strategy to be added to the notifications controller
			// Deployment
			deploymentStrategy?: close({
				// type
				type?: string | *"Recreate"
			})

			// dnsConfig
			//
			// [DNS configuration]
			dnsConfig?: close({})

			// dnsPolicy
			//
			// Alternative DNS policy for notifications controller Pods
			dnsPolicy?: string | *"ClusterFirst"

			// enabled
			//
			// Enable notifications controller
			enabled?: bool | *true

			// extraArgs
			//
			// Extra arguments to provide to the notifications controller
			extraArgs?: [...null | bool | number | string | [...] | {
				...
			}]

			// extraContainers
			//
			// Additional containers to be added to the notifications
			// controller pod
			// # Note: Supports use of custom Helm templates
			extraContainers?: [...null | bool | number | string | [...] | {
				...
			}]

			// extraEnv
			//
			// Additional container environment variables
			extraEnv?: [...null | bool | number | string | [...] | {
				...
			}]

			// extraEnvFrom
			//
			// envFrom to pass to the notifications controller
			extraEnvFrom?: [...null | bool | number | string | [...] | {
				...
			}]

			// extraVolumeMounts
			//
			// List of extra mounts to add (normally used with extraVolumes)
			extraVolumeMounts?: [...null | bool | number | string | [...] | {
				...
			}]

			// extraVolumes
			//
			// List of extra volumes to add
			extraVolumes?: [...null | bool | number | string | [...] | {
				...
			}]

			// image
			//
			// # Notifications controller image
			image?: close({
				// imagePullPolicy
				//
				// Image pull policy for the notifications controller
				imagePullPolicy?: string | *""

				// repository
				//
				// Repository to use for the notifications controller
				repository?: string | *""

				// tag
				//
				// Tag to use for the notifications controller
				tag?: string | *""
			})

			// imagePullSecrets
			//
			// Secrets with credentials to pull images from a private registry
			imagePullSecrets?: [...null | bool | number | string | [...] | {
				...
			}]

			// initContainers
			//
			// Init containers to add to the notifications controller pod
			// # Note: Supports use of custom Helm templates
			initContainers?: [...null | bool | number | string | [...] | {
				...
			}]

			// livenessProbe
			livenessProbe?: close({
				// enabled
				//
				// Enable Kubernetes liveness probe for notifications controller
				// Pods
				enabled?: bool | *false

				// failureThreshold
				//
				// Minimum consecutive failures for the [probe] to be considered
				// failed after having succeeded
				failureThreshold?: int | *3

				// initialDelaySeconds
				//
				// Number of seconds after the container has started before
				// [probe] is initiated
				initialDelaySeconds?: int | *10

				// periodSeconds
				//
				// How often (in seconds) to perform the [probe]
				periodSeconds?: int | *10

				// successThreshold
				//
				// Minimum consecutive successes for the [probe] to be considered
				// successful after having failed
				successThreshold?: int | *1

				// timeoutSeconds
				//
				// Number of seconds after which the [probe] times out
				timeoutSeconds?: int | *1
			})

			// logFormat
			//
			// Notifications controller log format. Either `text` or `json`
			logFormat?: string | *""

			// logLevel
			//
			// Notifications controller log level. One of: `debug`, `info`,
			// `warn`, `error`
			logLevel?: string | *""

			// metrics
			metrics?: close({
				// enabled
				//
				// Enables prometheus metrics server
				enabled?: bool | *false

				// port
				//
				// Metrics port
				port?: int | *9001

				// service
				service?: close({
					// annotations
					//
					// Metrics service annotations
					annotations?: close({})

					// clusterIP
					//
					// Metrics service clusterIP. `None` makes a "headless service"
					// (no virtual IP)
					clusterIP?: string | *""

					// labels
					//
					// Metrics service labels
					labels?: close({})

					// portName
					//
					// Metrics service port name
					portName?: string | *"http-metrics"

					// type
					//
					// Metrics service type
					type?: string | *"ClusterIP"
				})

				// serviceMonitor
				serviceMonitor?: close({
					// additionalLabels
					//
					// prometheus: kube-prometheus
					// Prometheus ServiceMonitor labels
					additionalLabels?: close({})

					// annotations
					//
					// Prometheus ServiceMonitor annotations
					annotations?: close({})

					// enabled
					//
					// Enable a prometheus ServiceMonitor
					enabled?: bool | *false

					// honorLabels
					//
					// When true, honorLabels preserves the metric’s labels when they
					// collide with the target’s labels.
					honorLabels?: bool | *false

					// metricRelabelings
					//
					// Prometheus [MetricRelabelConfigs] to apply to samples before
					// ingestion
					metricRelabelings?: [...null | bool | number | string | [...] | {
						...
					}]

					// relabelings
					//
					// Prometheus [RelabelConfigs] to apply to samples before scraping
					relabelings?: [...null | bool | number | string | [...] | {
						...
					}]

					// scheme
					//
					// namespace: monitoring
					// interval: 30s
					// scrapeTimeout: 10s
					// Prometheus ServiceMonitor scheme
					scheme?: string | *""

					// selector
					//
					// Prometheus ServiceMonitor selector
					selector?: close({})

					// tlsConfig
					//
					// Prometheus ServiceMonitor tlsConfig
					tlsConfig?: close({})
				})
			})

			// name
			//
			// Notifications controller name string
			name?: string | *"notifications-controller"

			// nodeSelector
			//
			// [Node selector]
			nodeSelector?: close({})

			// notifiers
			//
			// Configures notification services such as slack, email or custom
			// webhook
			// # For more information:
			// https://argo-cd.readthedocs.io/en/stable/operator-manual/notifications/services/overview/
			notifiers?: close({})

			// pdb
			//
			// # Notifications controller Pod Disruption Budget
			// # Ref:
			// https://kubernetes.io/docs/tasks/run-application/configure-pdb/
			pdb?: close({
				// annotations
				//
				// Annotations to be added to notifications controller pdb
				annotations?: close({})

				// enabled
				//
				// Deploy a [PodDisruptionBudget] for the notifications controller
				enabled?: bool | *false

				// labels
				//
				// Labels to be added to notifications controller pdb
				labels?: close({})

				// maxUnavailable
				//
				// Number of pods that are unavailable after eviction as number or
				// percentage (eg.: 50%).
				// # Has higher precedence over `notifications.pdb.minAvailable`
				maxUnavailable?: string | *""

				// minAvailable
				//
				// Number of pods that are available after eviction as number or
				// percentage (eg.: 50%)
				minAvailable?: string | *""
			})

			// podAnnotations
			//
			// Annotations to be applied to the notifications controller Pods
			podAnnotations?: close({})

			// podLabels
			//
			// Labels to be applied to the notifications controller Pods
			podLabels?: close({})

			// priorityClassName
			//
			// Priority class for the notifications controller pods
			priorityClassName?: string | *""

			// readinessProbe
			//
			// # Probes for notifications controller Pods (optional)
			// # Ref:
			// https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/
			readinessProbe?: close({
				// enabled
				//
				// Enable Kubernetes liveness probe for notifications controller
				// Pods
				enabled?: bool | *false

				// failureThreshold
				//
				// Minimum consecutive failures for the [probe] to be considered
				// failed after having succeeded
				failureThreshold?: int | *3

				// initialDelaySeconds
				//
				// Number of seconds after the container has started before
				// [probe] is initiated
				initialDelaySeconds?: int | *10

				// periodSeconds
				//
				// How often (in seconds) to perform the [probe]
				periodSeconds?: int | *10

				// successThreshold
				//
				// Minimum consecutive successes for the [probe] to be considered
				// successful after having failed
				successThreshold?: int | *1

				// timeoutSeconds
				//
				// Number of seconds after which the [probe] times out
				timeoutSeconds?: int | *1
			})

			// resources
			//
			// Resource limits and requests for the notifications controller
			resources?: close({})

			// runtimeClassName
			//
			// Runtime class name for the notifications controller
			runtimeClassName?: string | *""

			// secret
			secret?: close({
				// annotations
				//
				// key:value pairs of annotations to be added to the secret
				annotations?: close({})

				// create
				//
				// Whether helm chart creates notifications controller secret
				// # If true, will create a secret with the name below. Otherwise,
				// will assume existence of a secret with that name.
				create?: bool | *true

				// items
				//
				// Generic key:value pairs to be inserted into the secret
				// # Can be used for templates, notification services etc. Some
				// examples given below.
				// # For more information:
				// https://argo-cd.readthedocs.io/en/stable/operator-manual/notifications/services/overview/
				items?: close({})

				// labels
				//
				// key:value pairs of labels to be added to the secret
				labels?: close({})

				// name
				//
				// notifications controller Secret name
				name?: string | *"argocd-notifications-secret"
			})

			// serviceAccount
			serviceAccount?: close({
				// annotations
				//
				// Annotations applied to created service account
				annotations?: close({})

				// automountServiceAccountToken
				//
				// Automount API credentials for the Service Account
				automountServiceAccountToken?: bool | *true

				// create
				//
				// Create notifications controller service account
				create?: bool | *true

				// labels
				//
				// Labels applied to created service account
				labels?: close({})

				// name
				//
				// Notification controller service account name
				name?: string | *"argocd-notifications-controller"
			})

			// subscriptions
			//
			// Contains centrally managed global application subscriptions
			// # For more information:
			// https://argo-cd.readthedocs.io/en/stable/operator-manual/notifications/subscriptions/
			subscriptions?: [...null | bool | number | string | [...] | {
				...
			}]

			// templates
			//
			// The notification template is used to generate the notification
			// content
			// # For more information:
			// https://argo-cd.readthedocs.io/en/stable/operator-manual/notifications/templates/
			templates?: close({})

			// terminationGracePeriodSeconds
			//
			// terminationGracePeriodSeconds for container lifecycle hook
			terminationGracePeriodSeconds?: int | *30

			// tolerations
			//
			// [Tolerations] for use with node taints
			tolerations?: [...null | bool | number | string | [...] | {
				...
			}]

			// topologySpreadConstraints
			//
			// Assign custom [TopologySpreadConstraints] rules to the
			// application controller
			// # Ref:
			// https://kubernetes.io/docs/concepts/workloads/pods/pod-topology-spread-constraints/
			// # If labelSelector is left out, it will default to the
			// labelSelector configuration of the deployment
			topologySpreadConstraints?: [...null | bool | number | string | [...] | {
				...
			}]

			// triggers
			//
			// The trigger defines the condition when the notification should
			// be sent
			// # For more information:
			// https://argo-cd.readthedocs.io/en/stable/operator-manual/notifications/triggers/
			triggers?: close({})
		})

		// openshift
		openshift?: close({
			// enabled
			//
			// enables using arbitrary uid for argo repo server
			enabled?: bool | *false
		})

		// redis
		//
		// # Redis
		redis?: close({
			// affinity
			//
			// Assign custom [affinity] rules to the deployment
			affinity?: close({})

			// automountServiceAccountToken
			//
			// Automount API credentials for the Service Account into the pod.
			automountServiceAccountToken?: bool | *true

			// containerPorts
			//
			// Redis container ports
			containerPorts?: close({
				// metrics
				//
				// Metrics container port
				metrics?: int | *9121

				// redis
				//
				// Redis container port
				redis?: int | *6379
			})

			// containerSecurityContext
			//
			// Redis container-level security context
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

			// deploymentAnnotations
			//
			// Annotations to be added to the Redis server Deployment
			deploymentAnnotations?: close({})

			// dnsConfig
			//
			// [DNS configuration]
			dnsConfig?: close({})

			// dnsPolicy
			//
			// Alternative DNS policy for Redis server pods
			dnsPolicy?: string | *"ClusterFirst"

			// enabled
			//
			// Enable redis
			enabled?: bool | *true

			// env
			//
			// Environment variables to pass to the Redis server
			env?: [...null | bool | number | string | [...] | {
				...
			}]

			// envFrom
			//
			// envFrom to pass to the Redis server
			envFrom?: [...null | bool | number | string | [...] | {
				...
			}]

			// exporter
			//
			// # Prometheus redis-exporter sidecar
			exporter?: close({
				// containerSecurityContext
				//
				// Redis exporter security context
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

					// runAsNonRoot
					runAsNonRoot?: bool | *true

					// seccompProfile
					seccompProfile?: close({
						// type
						type?: string | *"RuntimeDefault"
					})
				})

				// enabled
				//
				// Enable Prometheus redis-exporter sidecar
				enabled?: bool | *false

				// env
				//
				// Environment variables to pass to the Redis exporter
				env?: [...null | bool | number | string | [...] | {
					...
				}]

				// image
				//
				// # Prometheus redis-exporter image
				image?: close({
					// imagePullPolicy
					//
					// Image pull policy for the redis-exporter
					imagePullPolicy?: string | *""

					// repository
					//
					// Repository to use for the redis-exporter
					repository?: string | *"public.ecr.aws/bitnami/redis-exporter"

					// tag
					//
					// Tag to use for the redis-exporter
					tag?: string | *"1.58.0"
				})

				// livenessProbe
				livenessProbe?: close({
					// enabled
					//
					// Enable Kubernetes liveness probe for Redis exporter
					enabled?: bool | *false

					// failureThreshold
					//
					// Minimum consecutive failures for the [probe] to be considered
					// failed after having succeeded
					failureThreshold?: int | *5

					// initialDelaySeconds
					//
					// Number of seconds after the container has started before
					// [probe] is initiated
					initialDelaySeconds?: int | *30

					// periodSeconds
					//
					// How often (in seconds) to perform the [probe]
					periodSeconds?: int | *15

					// successThreshold
					//
					// Minimum consecutive successes for the [probe] to be considered
					// successful after having failed
					successThreshold?: int | *1

					// timeoutSeconds
					//
					// Number of seconds after which the [probe] times out
					timeoutSeconds?: int | *15
				})

				// readinessProbe
				//
				// # Probes for Redis exporter (optional)
				// # Ref:
				// https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/
				readinessProbe?: close({
					// enabled
					//
					// Enable Kubernetes liveness probe for Redis exporter (optional)
					enabled?: bool | *false

					// failureThreshold
					//
					// Minimum consecutive failures for the [probe] to be considered
					// failed after having succeeded
					failureThreshold?: int | *5

					// initialDelaySeconds
					//
					// Number of seconds after the container has started before
					// [probe] is initiated
					initialDelaySeconds?: int | *30

					// periodSeconds
					//
					// How often (in seconds) to perform the [probe]
					periodSeconds?: int | *15

					// successThreshold
					//
					// Minimum consecutive successes for the [probe] to be considered
					// successful after having failed
					successThreshold?: int | *1

					// timeoutSeconds
					//
					// Number of seconds after which the [probe] times out
					timeoutSeconds?: int | *15
				})

				// resources
				//
				// Resource limits and requests for redis-exporter sidecar
				resources?: close({})
			})

			// extraArgs
			//
			// Additional command line arguments to pass to redis-server
			extraArgs?: [...null | bool | number | string | [...] | {
				...
			}]

			// extraContainers
			//
			// Additional containers to be added to the redis pod
			// # Note: Supports use of custom Helm templates
			extraContainers?: [...null | bool | number | string | [...] | {
				...
			}]

			// image
			//
			// # Redis image
			image?: close({
				// imagePullPolicy
				//
				// Redis image pull policy
				imagePullPolicy?: string | *""

				// repository
				//
				// Redis repository
				repository?: string | *"public.ecr.aws/docker/library/redis"

				// tag
				//
				// Redis tag
				tag?: string | *"7.4.1-alpine"
			})

			// imagePullSecrets
			//
			// Secrets with credentials to pull images from a private registry
			imagePullSecrets?: [...null | bool | number | string | [...] | {
				...
			}]

			// initContainers
			//
			// Init containers to add to the redis pod
			// # Note: Supports use of custom Helm templates
			initContainers?: [...null | bool | number | string | [...] | {
				...
			}]

			// livenessProbe
			livenessProbe?: close({
				// enabled
				//
				// Enable Kubernetes liveness probe for Redis server
				enabled?: bool | *false

				// failureThreshold
				//
				// Minimum consecutive failures for the [probe] to be considered
				// failed after having succeeded
				failureThreshold?: int | *5

				// initialDelaySeconds
				//
				// Number of seconds after the container has started before
				// [probe] is initiated
				initialDelaySeconds?: int | *30

				// periodSeconds
				//
				// How often (in seconds) to perform the [probe]
				periodSeconds?: int | *15

				// successThreshold
				//
				// Minimum consecutive successes for the [probe] to be considered
				// successful after having failed
				successThreshold?: int | *1

				// timeoutSeconds
				//
				// Number of seconds after which the [probe] times out
				timeoutSeconds?: int | *15
			})

			// metrics
			metrics?: close({
				// enabled
				//
				// Deploy metrics service
				enabled?: bool | *false

				// service
				//
				// Redis metrics service configuration
				service?: close({
					// annotations
					//
					// Metrics service annotations
					annotations?: close({})

					// clusterIP
					//
					// Metrics service clusterIP. `None` makes a "headless service"
					// (no virtual IP)
					clusterIP?: string | *"None"

					// labels
					//
					// Metrics service labels
					labels?: close({})

					// portName
					//
					// Metrics service port name
					portName?: string | *"http-metrics"

					// servicePort
					//
					// Metrics service port
					servicePort?: int | *9121

					// type
					//
					// Metrics service type
					type?: string | *"ClusterIP"
				})

				// serviceMonitor
				serviceMonitor?: close({
					// additionalLabels
					//
					// Prometheus ServiceMonitor labels
					additionalLabels?: close({})

					// annotations
					//
					// Prometheus ServiceMonitor annotations
					annotations?: close({})

					// enabled
					//
					// Enable a prometheus ServiceMonitor
					enabled?: bool | *false

					// honorLabels
					//
					// When true, honorLabels preserves the metric’s labels when they
					// collide with the target’s labels.
					honorLabels?: bool | *false

					// interval
					//
					// Interval at which metrics should be scraped
					interval?: string | *"30s"

					// metricRelabelings
					//
					// Prometheus [MetricRelabelConfigs] to apply to samples before
					// ingestion
					metricRelabelings?: [...null | bool | number | string | [...] | {
						...
					}]

					// namespace
					//
					// Prometheus ServiceMonitor namespace
					namespace?: string | *""

					// relabelings
					//
					// Prometheus [RelabelConfigs] to apply to samples before scraping
					relabelings?: [...null | bool | number | string | [...] | {
						...
					}]

					// scheme
					//
					// Prometheus ServiceMonitor scheme
					scheme?: string | *""

					// selector
					//
					// Prometheus ServiceMonitor selector
					selector?: close({})

					// tlsConfig
					//
					// Prometheus ServiceMonitor tlsConfig
					tlsConfig?: close({})
				})
			})

			// name
			//
			// Redis name
			name?: string | *"redis"

			// nodeSelector
			//
			// [Node selector]
			nodeSelector?: close({})

			// pdb
			//
			// # Redis Pod Disruption Budget
			// # Ref:
			// https://kubernetes.io/docs/tasks/run-application/configure-pdb/
			pdb?: close({
				// annotations
				//
				// Annotations to be added to Redis pdb
				annotations?: close({})

				// enabled
				//
				// Deploy a [PodDisruptionBudget] for the Redis
				enabled?: bool | *false

				// labels
				//
				// Labels to be added to Redis pdb
				labels?: close({})

				// maxUnavailable
				//
				// Number of pods that are unavailble after eviction as number or
				// percentage (eg.: 50%).
				// # Has higher precedence over `redis.pdb.minAvailable`
				maxUnavailable?: string | *""

				// minAvailable
				//
				// Number of pods that are available after eviction as number or
				// percentage (eg.: 50%)
				minAvailable?: string | *""
			})

			// podAnnotations
			//
			// Annotations to be added to the Redis server pods
			podAnnotations?: close({})

			// podLabels
			//
			// Labels to be added to the Redis server pods
			podLabels?: close({})

			// priorityClassName
			//
			// Priority class for redis pods
			priorityClassName?: string | *""

			// readinessProbe
			//
			// # Probes for Redis server (optional)
			// # Ref:
			// https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/
			readinessProbe?: close({
				// enabled
				//
				// Enable Kubernetes liveness probe for Redis server
				enabled?: bool | *false

				// failureThreshold
				//
				// Minimum consecutive failures for the [probe] to be considered
				// failed after having succeeded
				failureThreshold?: int | *5

				// initialDelaySeconds
				//
				// Number of seconds after the container has started before
				// [probe] is initiated
				initialDelaySeconds?: int | *30

				// periodSeconds
				//
				// How often (in seconds) to perform the [probe]
				periodSeconds?: int | *15

				// successThreshold
				//
				// Minimum consecutive successes for the [probe] to be considered
				// successful after having failed
				successThreshold?: int | *1

				// timeoutSeconds
				//
				// Number of seconds after which the [probe] times out
				timeoutSeconds?: int | *15
			})

			// resources
			//
			// Resource limits and requests for redis
			resources?: close({})

			// runtimeClassName
			//
			// Runtime class name for redis
			runtimeClassName?: string | *""

			// securityContext
			//
			// Redis pod-level security context
			securityContext?: close({
				// runAsNonRoot
				runAsNonRoot?: bool | *true

				// runAsUser
				runAsUser?: int | *999

				// seccompProfile
				seccompProfile?: close({
					// type
					type?: string | *"RuntimeDefault"
				})
			})

			// service
			service?: close({
				// annotations
				//
				// Redis service annotations
				annotations?: close({})

				// labels
				//
				// Additional redis service labels
				labels?: close({})
			})

			// serviceAccount
			serviceAccount?: close({
				// annotations
				//
				// Annotations applied to created service account
				annotations?: close({})

				// automountServiceAccountToken
				//
				// Automount API credentials for the Service Account
				automountServiceAccountToken?: bool | *false

				// create
				//
				// Create a service account for the redis pod
				create?: bool | *false

				// name
				//
				// Service account name for redis pod
				name?: string | *""
			})

			// servicePort
			//
			// Redis service port
			servicePort?: int | *6379

			// terminationGracePeriodSeconds
			//
			// terminationGracePeriodSeconds for container lifecycle hook
			terminationGracePeriodSeconds?: int | *30

			// tolerations
			//
			// [Tolerations] for use with node taints
			tolerations?: [...null | bool | number | string | [...] | {
				...
			}]

			// topologySpreadConstraints
			//
			// Assign custom [TopologySpreadConstraints] rules to redis
			// # Ref:
			// https://kubernetes.io/docs/concepts/workloads/pods/pod-topology-spread-constraints/
			// # If labelSelector is left out, it will default to the
			// labelSelector configuration of the deployment
			topologySpreadConstraints?: [...null | bool | number | string | [...] | {
				...
			}]

			// volumeMounts
			//
			// Additional volumeMounts to the redis container
			volumeMounts?: [...null | bool | number | string | [...] | {
				...
			}]

			// volumes
			//
			// Additional volumes to the redis pod
			volumes?: [...null | bool | number | string | [...] | {
				...
			}]
		})

		// redis-ha
		//
		// This Helm chart provides a highly available Redis
		// implementation with a master/slave configuration and uses
		// Sentinel sidecars for failover management
		"redis-ha"?: {
			// additionalAffinities
			//
			// Additional affinities to add to the Redis server pods.
			// # Ref:
			// https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity
			additionalAffinities?: close({})

			// affinity
			//
			// Override all other affinity settings for the Redis server pods
			// with a string.
			affinity?: string | *""

			// auth
			//
			// Configures redis with AUTH (requirepass & masterauth conf
			// params)
			auth?: bool | *false

			// authKey
			//
			// Defines the key holding the redis password in existing secret.
			authKey?: string | *"auth"

			// configmap
			//
			// # Custom labels for the redis configmap
			configmap?: close({
				// labels
				//
				// Custom labels for the redis configmap
				labels?: close({})
			})

			// configmapTest
			//
			// # ConfigMap Test Parameters
			configmapTest?: close({
				// image
				//
				// Image for redis-ha-configmap-test hook
				image?: close({
					// repository
					//
					// Repository of the configmap shellcheck test image.
					repository?: string | *"koalaman/shellcheck"

					// tag
					//
					// Tag of the configmap shellcheck test image.
					tag?: string | *"v0.5.0"
				})

				// resources
				//
				// Resources for the ConfigMap test pod
				resources?: close({})
			})

			// containerSecurityContext
			//
			// Security context to be added to the Redis containers.
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

				// runAsNonRoot
				runAsNonRoot?: bool | *true

				// runAsUser
				runAsUser?: int | *1000

				// seccompProfile
				seccompProfile?: close({
					// type
					type?: string | *"RuntimeDefault"
				})
			})

			// emptyDir
			//
			// Configuration of `emptyDir`, used only if persistentVolume is
			// disabled and no hostPath specified
			emptyDir?: close({})

			// enabled
			//
			// Conditional property used in parent chart
			enabled?: bool

			// existingSecret
			//
			// # Use existing secret containing key `authKey` (ignores
			// redisPassword)
			// # Can also store AWS S3 or SSH secrets in this secret
			// An existing secret containing a key defined by `authKey` that
			// configures `requirepass` and `masterauth` in the conf
			// parameters (Requires `auth: enabled`, cannot be used in
			// conjunction with `.Values.redisPassword`)
			existingSecret?: null | *"~"

			// exporter
			//
			// Prometheus exporter specific configuration options
			exporter?: close({
				// address
				//
				// Address/Host for Redis instance.
				// Exists to circumvent issues with IPv6 dns resolution that
				// occurs on certain environments
				address?: string | *"localhost"

				// enabled
				//
				// If `true`, the prometheus exporter sidecar is enabled
				enabled?: bool | *false

				// extraArgs
				//
				// Additional args for redis exporter
				extraArgs?: close({})

				// image
				//
				// Exporter image
				image?: string | *"oliver006/redis_exporter"

				// livenessProbe
				//
				// prometheus exporter SCANS redis db which can take some time
				// allow different probe settings to not let container crashloop
				livenessProbe?: close({
					// httpGet
					httpGet?: close({
						// path
						//
						// Exporter liveness probe httpGet path
						path?: string | *"/metrics"

						// port
						//
						// Exporter liveness probe httpGet port
						port?: int | *9121
					})

					// initialDelaySeconds
					//
					// Initial delay in seconds for liveness probe of exporter
					initialDelaySeconds?: int | *15

					// periodSeconds
					//
					// Period in seconds after which liveness probe will be repeated
					periodSeconds?: int | *15

					// timeoutSeconds
					//
					// Timeout seconds for liveness probe of exporter
					timeoutSeconds?: int | *3
				})

				// port
				//
				// Exporter port
				port?: int | *9121

				// portName
				//
				// Exporter port name
				portName?: string | *"exporter-port"

				// pullPolicy
				//
				// Exporter image pullPolicy
				pullPolicy?: string | *"IfNotPresent"

				// readinessProbe
				readinessProbe?: close({
					// httpGet
					httpGet?: close({
						// path
						//
						// Exporter readiness probe httpGet path
						path?: string | *"/metrics"

						// port
						//
						// Exporter readiness probe httpGet port
						port?: int | *9121
					})

					// initialDelaySeconds
					//
					// Initial delay in seconds for readiness probe of exporter
					initialDelaySeconds?: int | *15

					// periodSeconds
					//
					// Period in seconds after which readiness probe will be repeated
					periodSeconds?: int | *15

					// successThreshold
					//
					// Success threshold for readiness probe of exporter
					successThreshold?: int | *2

					// timeoutSeconds
					//
					// Timeout seconds for readiness probe of exporter
					timeoutSeconds?: int | *3
				})

				// resources
				//
				// cpu/memory resource limits/requests
				resources?: close({})

				// scrapePath
				//
				// Exporter scrape path
				scrapePath?: string | *"/metrics"

				// script
				//
				// A custom custom Lua script that will be mounted to exporter for
				// collection of custom metrics.
				// Creates a ConfigMap and sets env var `REDIS_EXPORTER_SCRIPT`.
				script?: string | *""

				// serviceMonitor
				serviceMonitor?: close({
					// disableAPICheck
					//
					// Disable API Check on ServiceMonitor
					disableAPICheck?: bool | *false

					// enabled
					//
					// When set true then use a ServiceMonitor to configure scraping
					enabled?: bool | *false

					// endpointAdditionalProperties
					//
					// Set additional properties for the ServiceMonitor endpoints such
					// as relabeling, scrapeTimeout, tlsConfig, and more.
					endpointAdditionalProperties?: close({})

					// interval
					//
					// Set how frequently Prometheus should scrape (default is 30s)
					interval?: string | *""

					// labels
					//
					// Set labels for the ServiceMonitor, use this to define your
					// scrape label for Prometheus Operator
					labels?: close({})

					// namespace
					//
					// Set the namespace the ServiceMonitor should be deployed
					namespace?: string | *""

					// telemetryPath
					//
					// Set path to redis-exporter telemtery-path (default is /metrics)
					telemetryPath?: string | *""

					// timeout
					//
					// Set timeout for scrape (default is 10s)
					timeout?: string | *""
				})

				// tag
				//
				// Exporter image tag
				tag?: string | *"v1.57.0"
			})

			// extraContainers
			//
			// Extra containers to include in StatefulSet
			extraContainers?: [...null | bool | number | string | [...] | {
				...
			}]

			// extraInitContainers
			//
			// Extra init containers to include in StatefulSet
			extraInitContainers?: [...null | bool | number | string | [...] | {
				...
			}]

			// extraLabels
			//
			// Labels added here are applied to all created resources
			extraLabels?: close({})

			// extraVolumes
			//
			// Extra volumes to include in StatefulSet
			extraVolumes?: [...null | bool | number | string | [...] | {
				...
			}]

			// fullNameOverride
			//
			// Full name of the Redis HA Resources
			fullNameOverride?: string | *""

			// global
			//
			// # Globally shared configuration
			global?: close({
				// compatibility
				//
				// Openshift compatibility options
				compatibility?: close({
					// openshift
					openshift?: close({
						// adaptSecurityContext
						adaptSecurityContext?: string | *"auto"
					})
				})

				// priorityClassName
				//
				// Default priority class for all components
				priorityClassName?: string | *""
			})

			// haproxy
			//
			// # Enables a HA Proxy for better LoadBalancing / Sentinel Master
			// support. Automatically proxies to Redis master.
			// # Recommend for externally exposed Redis clusters.
			// # ref: https://cbonte.github.io/haproxy-dconv/1.9/intro.html
			haproxy?: close({
				// IPv6
				//
				// # Enable HAProxy parameters to bind and consume IPv6 addresses.
				// Enabled by default.
				IPv6?: close({
					// enabled
					//
					// Enable HAProxy parameters to bind and consume IPv6 addresses.
					// Enabled by default.
					enabled?: bool | *true
				})

				// additionalAffinities
				//
				// Additional affinities to add to the haproxy pods.
				additionalAffinities?: close({})

				// affinity
				//
				// Override all other affinity settings for the haproxy pods with
				// a string.
				affinity?: string | *""

				// annotations
				//
				// HAProxy template annotations
				annotations?: close({})

				// checkFall
				//
				// haproxy.cfg `check fall` setting
				checkFall?: int | *1

				// checkInterval
				//
				// haproxy.cfg `check inter` setting
				checkInterval?: string | *"1s"

				// containerPort
				//
				// Modify HAProxy deployment container port
				containerPort?: int | *6379

				// containerSecurityContext
				//
				// Security context to be added to the HAProxy containers.
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

					// runAsNonRoot
					runAsNonRoot?: bool | *true

					// seccompProfile
					seccompProfile?: close({
						// type
						type?: string | *"RuntimeDefault"
					})
				})

				// customConfig
				//
				// # Custom config-haproxy.cfg files used to override default
				// settings. If this file is
				// # specified then the config-haproxy.cfg above will be ignored.
				// (string) Allows for custom config-haproxy.cfg file to be
				// applied. If this is used then default config will be
				// overwriten
				customConfig?: null | *"~"

				// deploymentStrategy
				//
				// Deployment strategy for the haproxy deployment
				deploymentStrategy?: close({
					// type
					type?: string | *"RollingUpdate"
				})

				// emptyDir
				//
				// Configuration of `emptyDir`
				emptyDir?: close({})

				// enabled
				//
				// Enabled HAProxy LoadBalancing/Proxy
				enabled?: bool | *false

				// extraConfig
				//
				// # Place any additional configuration section to add to the
				// default config-haproxy.cfg
				// (string) Allows to place any additional configuration section
				// to add to the default config-haproxy.cfg
				extraConfig?: null | *"~"

				// hardAntiAffinity
				//
				// Whether the haproxy pods should be forced to run on separate
				// nodes.
				hardAntiAffinity?: bool | *true

				// image
				image?: close({
					// pullPolicy
					//
					// HAProxy Image PullPolicy
					pullPolicy?: string | *"IfNotPresent"

					// repository
					//
					// HAProxy Image Repository
					repository?: string | *"public.ecr.aws/docker/library/haproxy"

					// tag
					//
					// HAProxy Image Tag
					tag?: string | *"2.9.4-alpine"
				})

				// imagePullSecrets
				//
				// Reference to one or more secrets to be used when pulling images
				// ref:
				// https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/
				imagePullSecrets?: [...null | bool | number | string | [...] | {
					...
				}]

				// init
				init?: close({
					// resources
					//
					// Extra init resources
					resources?: close({})
				})

				// labels
				//
				// Custom labels for the haproxy pod
				labels?: close({})

				// lifecycle
				//
				// Container lifecycle hooks.
				// Ref:
				// https://kubernetes.io/docs/concepts/containers/container-lifecycle-hooks/
				lifecycle?: close({})

				// metrics
				//
				// # Official HAProxy embedded prometheus metrics settings.
				// # Ref:
				// https://github.com/haproxy/haproxy/tree/master/contrib/prometheus-exporter
				// #
				metrics?: close({
					// enabled
					//
					// HAProxy enable prometheus metric scraping
					enabled?: bool | *false

					// port
					//
					// HAProxy prometheus metrics scraping port
					port?: int | *9101

					// portName
					//
					// HAProxy metrics scraping port name
					portName?: string | *"http-exporter-port"

					// scrapePath
					//
					// HAProxy prometheus metrics scraping path
					scrapePath?: string | *"/metrics"

					// serviceMonitor
					serviceMonitor?: close({
						// disableAPICheck
						//
						// Disable API Check on ServiceMonitor
						disableAPICheck?: bool | *false

						// enabled
						//
						// When set true then use a ServiceMonitor to configure scraping
						enabled?: bool | *false

						// endpointAdditionalProperties
						//
						// Set additional properties for the ServiceMonitor endpoints such
						// as relabeling, scrapeTimeout, tlsConfig, and more.
						endpointAdditionalProperties?: close({})

						// interval
						//
						// Set how frequently Prometheus should scrape (default is 30s)
						interval?: string | *""

						// labels
						//
						// Set labels for the ServiceMonitor, use this to define your
						// scrape label for Prometheus Operator
						labels?: close({})

						// namespace
						//
						// Set the namespace the ServiceMonitor should be deployed
						namespace?: string | *""

						// telemetryPath
						//
						// Set path to redis-exporter telemtery-path (default is /metrics)
						telemetryPath?: string | *""

						// timeout
						//
						// Set timeout for scrape (default is 10s)
						timeout?: string | *""
					})
				})

				// networkPolicy
				networkPolicy?: close({
					// annotations
					//
					// Annotations for Haproxy NetworkPolicy
					annotations?: close({})

					// egressRules
					//
					// user can define egress rules too, uses the same structure as
					// ingressRules
					egressRules?: [...null | bool | number | string | [...] | {
						...
					}]

					// enabled
					//
					// whether NetworkPolicy for Haproxy should be created
					enabled?: bool | *false

					// ingressRules
					//
					// user defined ingress rules that Haproxy should permit into.
					// uses the format defined in
					// https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors
					ingressRules?: [...null | bool | number | string | [...] | {
						...
					}]

					// labels
					//
					// Labels for Haproxy NetworkPolicy
					labels?: close({})
				})

				// podDisruptionBudget
				//
				// Pod Disruption Budget
				// ref:
				// https://kubernetes.io/docs/tasks/run-application/configure-pdb/
				podDisruptionBudget?: close({})

				// priorityClassName
				//
				// Kubernetes priorityClass name for the haproxy pod
				priorityClassName?: string | *""

				// readOnly
				//
				// Enable read-only redis-slaves
				readOnly?: close({
					// enabled
					//
					// Enable if you want a dedicated port in haproxy for redis-slaves
					enabled?: bool | *false

					// port
					//
					// Port for the read-only redis-slaves
					port?: int | *6380
				})

				// replicas
				//
				// Number of HAProxy instances
				replicas?: int | *3

				// resources
				//
				// HAProxy resources
				resources?: close({})

				// securityContext
				//
				// Security context to be added to the HAProxy deployment.
				securityContext?: close({
					// fsGroup
					fsGroup?: int | *99

					// runAsNonRoot
					runAsNonRoot?: bool | *true

					// runAsUser
					runAsUser?: int | *99
				})

				// service
				//
				// # Service for HAProxy
				service?: close({
					// annotations
					//
					// HAProxy service annotations
					annotations?: null | *"null"

					// externalIPs
					//
					// HAProxy external IPs
					externalIPs?: close({})

					// externalTrafficPolicy
					//
					// (string) HAProxy service externalTrafficPolicy value
					// (haproxy.service.type must be LoadBalancer)
					externalTrafficPolicy?: null | *"~"

					// labels
					//
					// HAProxy service labels
					labels?: close({})

					// loadBalancerIP
					//
					// HAProxy service loadbalancer IP
					loadBalancerIP?: null | *""

					// loadBalancerSourceRanges
					//
					// List of CIDR's allowed to connect to LoadBalancer
					loadBalancerSourceRanges?: [...null | bool | number | string | [...] | {
						...
					}]

					// nodePort
					//
					// (int) HAProxy service nodePort value (haproxy.service.type must
					// be NodePort)
					nodePort?: null | *"~"

					// type
					//
					// HAProxy service type "ClusterIP", "LoadBalancer" or "NodePort"
					type?: string | *"ClusterIP"
				})

				// serviceAccount
				serviceAccount?: close({
					// automountToken
					automountToken?: bool | *false

					// create
					//
					// Specifies whether a ServiceAccount should be created
					create?: bool | *true
				})

				// serviceAccountName
				//
				// HAProxy serviceAccountName
				serviceAccountName?: string | *"redis-sa"

				// servicePort
				//
				// Modify HAProxy service port
				servicePort?: int | *6379

				// stickyBalancing
				//
				// # Enable sticky sessions to Redis nodes via HAProxy
				// # Very useful for long-living connections as in case of Sentry
				// for example
				// HAProxy sticky load balancing to Redis nodes. Helps with
				// connections shutdown.
				stickyBalancing?: bool | *false

				// tests
				//
				// # HAProxy test related options
				tests?: close({
					// resources
					//
					// Pod resources for the tests against HAProxy.
					resources?: close({})
				})

				// timeout
				timeout?: close({
					// check
					//
					// haproxy.cfg `timeout check` setting
					check?: string | *"2s"

					// client
					//
					// haproxy.cfg `timeout client` setting
					client?: string | *"330s"

					// connect
					//
					// haproxy.cfg `timeout connect` setting
					connect?: string | *"4s"

					// server
					//
					// haproxy.cfg `timeout server` setting
					server?: string | *"330s"
				})

				// tls
				//
				// Enable TLS termination on HAproxy, This will create a volume
				// mount
				tls?: close({
					// certMountPath
					//
					// Path to mount the secret that contains the certificates.
					// haproxy
					certMountPath?: string | *"/tmp/"

					// enabled
					//
					// If "true" this will enable TLS termination on haproxy
					enabled?: bool | *false

					// keyName
					//
					// Key file name
					keyName?: null | *""

					// secretName
					//
					// Secret containing the .pem file
					secretName?: string | *""
				})
			})

			// hardAntiAffinity
			//
			// Whether the Redis server pods should be forced to run on
			// separate nodes.
			// # This is accomplished by setting their AntiAffinity with
			// requiredDuringSchedulingIgnoredDuringExecution as opposed to
			// preferred.
			// # Ref:
			// https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#inter-pod-affinity-and-anti-affinity-beta-feature
			hardAntiAffinity?: bool | *true

			// hostPath
			//
			// To use a hostPath for data, set persistentVolume.enabled to
			// false
			// and define hostPath.path.
			// Warning: this might overwrite existing folders on the host
			// system!
			hostPath?: close({
				// chown
				//
				// if chown is true, an init-container with root permissions is
				// launched to
				// change the owner of the hostPath folder to the user defined in
				// the
				// security context
				chown?: bool | *true

				// path
				//
				// Use this path on the host for data storage.
				// path is evaluated as template so placeholders are replaced
				path?: string | *""
			})

			// image
			//
			// # -- Image information for Redis HA
			// # ref: http://kubernetes.io/docs/user-guide/compute-resources/
			// #
			image?: close({
				// pullPolicy
				//
				// Redis image pull policy
				pullPolicy?: string | *"IfNotPresent"

				// repository
				//
				// Redis image repository
				repository?: string | *"public.ecr.aws/docker/library/redis"

				// tag
				//
				// Redis image tag
				tag?: string | *"7.2.4-alpine"
			})

			// imagePullSecrets
			//
			// # Reference to one or more secrets to be used when pulling
			// images
			// # ref:
			// https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/
			// # This imagePullSecrets is only for redis images
			// #
			// Reference to one or more secrets to be used when pulling redis
			// images
			imagePullSecrets?: [...null | bool | number | string | [...] | {
				...
			}]

			// init
			init?: close({
				// resources
				//
				// Extra init resources
				resources?: close({})
			})

			// labels
			//
			// Custom labels for the redis pod
			labels?: close({})

			// nameOverride
			//
			// Name override for Redis HA resources
			nameOverride?: string | *""

			// networkPolicy
			networkPolicy?: close({
				// annotations
				//
				// Annotations for NetworkPolicy
				annotations?: close({})

				// egressRules
				//
				// user can define egress rules too, uses the same structure as
				// ingressRules
				egressRules?: [...close({
					// ports
					ports?: [...matchN(>=1, [close({
						// port
						port?: int | *53

						// protocol
						protocol?: string | *"UDP"
					}), close({
						// port
						port?: int | *53

						// protocol
						protocol?: string | *"TCP"
					})]) & {
						...
					}]

					// selectors
					selectors?: [...matchN(>=1, [close({
						// namespaceSelector
						namespaceSelector?: close({})
					}), close({
						// ipBlock
						ipBlock?: close({
							// cidr
							//
							// Cloud Provider often uses the local link local range to host
							// managed DNS resolvers.
							// We need to allow this range to ensure that the Redis pods can
							// resolve DNS.
							// Example architecture for GCP Cloud DNS:
							// https://cloud.google.com/kubernetes-engine/docs/how-to/cloud-dns#architecture
							cidr?: string | *"169.254.0.0/16"
						})
					})]) & {
						...
					}]
				}) & (null | bool | number | string | [...] | {
					...
				})]

				// enabled
				//
				// whether NetworkPolicy for Redis StatefulSets should be created.
				// when enabled, inter-Redis connectivity is created
				enabled?: bool | *false

				// ingressRules
				//
				// User defined ingress rules that Redis should permit into.
				// Uses the format defined in
				// https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors
				ingressRules?: [...null | bool | number | string | [...] | {
					...
				}]

				// labels
				//
				// Labels for NetworkPolicy
				labels?: close({})
			})

			// nodeSelector
			//
			// # Node labels, affinity, and tolerations for pod assignment
			// # ref:
			// https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#nodeselector
			// # ref:
			// https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#taints-and-tolerations-beta-feature
			// # ref:
			// https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity
			// Node labels for pod assignment
			nodeSelector?: close({})

			// persistentVolume
			persistentVolume?: close({
				// accessModes
				//
				// Persistent volume access modes
				accessModes?: [...string & (null | bool | number | string | [...] | {
					...
				})]

				// annotations
				//
				// Annotations for the volume
				annotations?: close({})

				// enabled
				//
				// Enable persistent volume
				enabled?: bool | *true

				// labels
				//
				// Labels for the volume
				labels?: close({})

				// size
				//
				// Persistent volume size
				size?: string | *"10Gi"

				// storageClass
				//
				// # redis-ha data Persistent Volume Storage Class
				// # If defined, storageClassName: <storageClass>
				// # If set to "-", storageClassName: "", which disables dynamic
				// provisioning
				// # If undefined (the default) or set to null, no
				// storageClassName spec is
				// # set, choosing the default provisioner. (gp2 on AWS, standard
				// on
				// # GKE, AWS & OpenStack)
				// #
				// storageClass: "-"
				// redis-ha data Persistent Volume Storage Class
				storageClass?: null | *"~"
			})

			// podDisruptionBudget
			//
			// Pod Disruption Budget rules
			podDisruptionBudget?: close({})

			// podManagementPolicy
			//
			// # Customize the statefulset pod management policy:
			// # ref:
			// https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#pod-management-policies
			// The statefulset pod management policy
			podManagementPolicy?: string | *"OrderedReady"

			// priorityClassName
			//
			// Kubernetes priorityClass name for the redis-ha-server pod
			priorityClassName?: string | *""

			// prometheusRule
			//
			// # Custom PrometheusRule to be defined
			// # The value is evaluated as a template, so, for example, the
			// value can depend on .Release or .Chart
			// # ref:
			// https://github.com/coreos/prometheus-operator#customresourcedefinitions
			prometheusRule?: close({
				// additionalLabels
				//
				// Additional labels to be set in metadata.
				additionalLabels?: close({})

				// enabled
				//
				// If true, creates a Prometheus Operator PrometheusRule.
				enabled?: bool | *false

				// interval
				//
				// How often rules in the group are evaluated (falls back to
				// `global.evaluation_interval` if not set).
				interval?: string | *"10s"

				// namespace
				//
				// Namespace which Prometheus is running in.
				namespace?: null | *""

				// rules
				//
				// Rules spec template (see
				// https://github.com/prometheus-operator/prometheus-operator/blob/master/Documentation/api.md#rule).
				rules?: [...null | bool | number | string | [...] | {
					...
				}]
			})

			// rbac
			//
			// # Role Based Access
			// # Ref: https://kubernetes.io/docs/admin/authorization/rbac/
			// #
			rbac?: close({
				// create
				//
				// Create and use RBAC resources
				create?: bool | *true
			})

			// redis
			//
			// # Redis specific configuration options
			redis?: close({
				// annotations
				//
				// Annotations for the redis statefulset
				annotations?: close({})

				// authClients
				//
				// It is possible to disable client side certificates
				// authentication when "authClients" is set to "no"
				authClients?: string | *""

				// config
				//
				// Any valid redis config options in this section will be applied
				// to each server, For multi-value configs use list instead of
				// string (for example loadmodule) (see below)
				config?: close({
					// maxmemory
					//
					// Max memory to use for each redis instance. Default is
					// unlimited.
					maxmemory?: string | *"0"

					// maxmemory-policy
					//
					// Max memory policy to use for each redis instance. Default is
					// volatile-lru.
					"maxmemory-policy"?: string | *"volatile-lru"

					// min-replicas-max-lag
					//
					// Value in seconds
					"min-replicas-max-lag"?: int | *5

					// min-replicas-to-write
					//
					// # -- Additional redis conf options can be added below
					// # -- For all available options see
					// http://download.redis.io/redis-stable/redis.conf
					"min-replicas-to-write"?: int | *1

					// rdbchecksum
					rdbchecksum?: string | *"yes"

					// rdbcompression
					rdbcompression?: string | *"yes"

					// repl-diskless-sync
					//
					// When enabled, directly sends the RDB over the wire to slaves,
					// without using the disk as intermediate storage. Default is
					// false.
					"repl-diskless-sync"?: string | *"yes"

					// save
					//
					// Determines if scheduled RDB backups are created. Default is
					// false.
					// Please note that local (on-disk) RDBs will still be created
					// when re-syncing with a new slave. The only way to prevent this
					// is to enable diskless replication.
					save?: string | *"900 1"
				})

				// customArgs
				//
				// Allows overriding the redis container arguments
				customArgs?: [...null | bool | number | string | [...] | {
					...
				}]

				// customCommand
				//
				// Allows overriding the redis container command
				customCommand?: [...null | bool | number | string | [...] | {
					...
				}]

				// customConfig
				//
				// (string) Allows for custom redis.conf files to be applied. If
				// this is used then `redis.config` is ignored
				customConfig?: null | *"~"

				// disableCommands
				//
				// Array with commands to disable
				disableCommands?: [...matchN(>=1, [string, string])]

				// envFrom
				//
				// Load environment variables from ConfigMap/Secret
				envFrom?: [...null | bool | number | string | [...] | {
					...
				}]

				// extraVolumeMounts
				//
				// additional volumeMounts for Redis container
				extraVolumeMounts?: [...null | bool | number | string | [...] | {
					...
				}]

				// lifecycle
				//
				// Container Lifecycle Hooks for redis container
				// Ref:
				// https://kubernetes.io/docs/concepts/containers/container-lifecycle-hooks/
				lifecycle?: close({
					// preStop
					preStop?: close({
						// exec
						exec?: close({
							// command
							command?: [...matchN(>=1, [string, string])]
						})
					})
				})

				// livenessProbe
				//
				// Liveness probe parameters for redis container
				livenessProbe?: close({
					// enabled
					//
					// Enable the Liveness Probe
					enabled?: bool | *true

					// failureThreshold
					//
					// Failure threshold for liveness probe
					failureThreshold?: int | *5

					// initialDelaySeconds
					//
					// Initial delay in seconds for liveness probe
					initialDelaySeconds?: int | *30

					// periodSeconds
					//
					// Period in seconds after which liveness probe will be repeated
					periodSeconds?: int | *15

					// successThreshold
					//
					// Success threshold for liveness probe
					successThreshold?: int | *1

					// timeoutSeconds
					//
					// Timeout seconds for liveness probe
					timeoutSeconds?: int | *15
				})

				// masterGroupName
				//
				// Redis convention for naming the cluster group: must match
				// `^[\\w-\\.]+$` and can be templated
				masterGroupName?: string | *"mymaster"

				// port
				//
				// Port to access the redis service
				port?: int | *6379

				// readinessProbe
				//
				// Readiness probe parameters for redis container
				readinessProbe?: close({
					// enabled
					//
					// Enable the Readiness Probe
					enabled?: bool | *true

					// failureThreshold
					//
					// Failure threshold for readiness probe
					failureThreshold?: int | *5

					// initialDelaySeconds
					//
					// Initial delay in seconds for readiness probe
					initialDelaySeconds?: int | *30

					// periodSeconds
					//
					// Period in seconds after which readiness probe will be repeated
					periodSeconds?: int | *15

					// successThreshold
					//
					// Success threshold for readiness probe
					successThreshold?: int | *1

					// timeoutSeconds
					//
					// Timeout seconds for readiness probe
					timeoutSeconds?: int | *15
				})

				// resources
				//
				// CPU/Memory for master/slave nodes resource requests/limits
				resources?: close({})

				// startupProbe
				//
				// Startup probe parameters for redis container
				startupProbe?: close({
					// enabled
					//
					// Enable Startup Probe
					enabled?: bool | *true

					// failureThreshold
					//
					// Failure threshold for startup probe
					failureThreshold?: int | *3

					// initialDelaySeconds
					//
					// Initial delay in seconds for startup probe
					initialDelaySeconds?: int | *5

					// periodSeconds
					//
					// Period in seconds after which startup probe will be repeated
					periodSeconds?: int | *10

					// successThreshold
					//
					// Success threshold for startup probe
					successThreshold?: int | *1

					// timeoutSeconds
					//
					// Timeout seconds for startup probe
					timeoutSeconds?: int | *15
				})

				// terminationGracePeriodSeconds
				//
				// Increase terminationGracePeriodSeconds to allow writing large
				// RDB snapshots. (k8s default is 30s)
				// ref:
				// https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#pod-termination-forced
				terminationGracePeriodSeconds?: int | *60

				// tlsPort
				//
				// # Configures redis with tls-port parameter
				// (int) TLS Port to access the redis service
				tlsPort?: null | *"~"

				// tlsReplication
				//
				// (bool) Configures redis with tls-replication parameter, if true
				// sets "tls-replication yes" in redis.conf
				tlsReplication?: null | *"~"

				// updateStrategy
				//
				// Update strategy for Redis StatefulSet
				// # ref:
				// https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#update-strategies
				updateStrategy?: close({
					// type
					type?: string | *"RollingUpdate"
				})
			})

			// redisPassword
			//
			// (string) A password that configures a `requirepass` and
			// `masterauth` in the conf parameters (Requires `auth: enabled`)
			redisPassword?: null | *"~"

			// replicas
			//
			// Number of redis master/slave
			replicas?: int | *3

			// restore
			//
			// restore init container is executed if restore.[s3|ssh].source
			// is not false
			// restore init container creates /data/dump.rdb_ from original if
			// exists
			// restore init container overrides /data/dump.rdb
			// secrets are stored into environment of init container - stored
			// encoded on k8s
			// REQUIRED for s3 restore: AWS 'access_key' and 'secret_key' or
			// stored in existingSecret
			// EXAMPLE source for s3 restore: 's3://bucket/dump.rdb'
			// REQUIRED for ssh restore: 'key' should be in one line including
			// CR i.e. '-----BEGIN RSA PRIVATE
			// KEY-----\n...\n...\n...\n-----END RSA PRIVATE KEY-----'
			// EXAMPLE source for ssh restore: 'user
			restore?: close({
				// existingSecret
				//
				// Set existingSecret to true to use secret specified in
				// existingSecret above
				existingSecret?: bool | *false

				// s3
				s3?: close({
					// access_key
					//
					// If using existingSecret, that secret must contain:
					// AWS_SECRET_ACCESS_KEY: <YOUR_ACCESS_KEY:>
					// AWS_ACCESS_KEY_ID: <YOUR_KEY_ID>
					// If not set the key and ID as strings below:
					// Restore init container - AWS AWS_ACCESS_KEY_ID to access
					// restore.s3.source
					access_key?: string | *""

					// region
					//
					// Restore init container - AWS AWS_REGION to access
					// restore.s3.source
					region?: string | *""

					// secret_key
					//
					// Restore init container - AWS AWS_SECRET_ACCESS_KEY to access
					// restore.s3.source
					secret_key?: string | *""

					// source
					//
					// Restore init container - AWS S3 location of dump - i.e.
					// s3://bucket/dump.rdb or false
					source?: string | *""
				})

				// ssh
				ssh?: close({
					// key
					//
					// Restore init container - SSH private key to scp
					// restore.ssh.source to init container.
					// Key should be in one line separated with \n.
					// i.e. `-----BEGIN RSA PRIVATE KEY-----\n...\n...\n-----END RSA
					// PRIVATE KEY-----`
					key?: string | *""

					// source
					//
					// Restore init container - SSH scp location of dump - i.e. user
					source?: string | *""
				})

				// timeout
				//
				// Timeout for the restore
				timeout?: int | *600
			})

			// ro_replicas
			//
			// # read-only replicas
			// # indexed slaves get never promoted to be master
			// # index starts with 0 - which is master on init
			// # i.e. "8,9" means 8th and 9th slave will be replica with
			// replica-priority=0
			// # see also: https://redis.io/topics/sentinel
			// Comma separated list of slaves which never get promoted to be
			// master.
			// Count starts with 0. Allowed values 1-9. i.e. 3,4 - 3th and 4th
			// redis slave never make it to be master, where master is index
			// 0.
			ro_replicas?: string | *""

			// schedulerName
			//
			// Use an alternate scheduler, e.g. "stork".
			// ref:
			// https://kubernetes.io/docs/tasks/administer-cluster/configure-multiple-schedulers/
			schedulerName?: string | *""

			// securityContext
			//
			// Security context to be added to the Redis StatefulSet.
			securityContext?: close({
				// fsGroup
				fsGroup?: int | *1000

				// runAsNonRoot
				runAsNonRoot?: bool | *true

				// runAsUser
				runAsUser?: int | *1000
			})

			// sentinel
			//
			// # Sentinel specific configuration options
			sentinel?: close({
				// auth
				//
				// # Configures sentinel with AUTH (requirepass params)
				// Enables or disables sentinel AUTH (Requires `sentinel.password`
				// to be set)
				auth?: bool | *false

				// authClients
				//
				// It is possible to disable client side certificates
				// authentication when "authClients" is set to "no"
				authClients?: string | *""

				// authKey
				//
				// # Defines the key holding the sentinel password in existing
				// secret.
				// The key holding the sentinel password in an existing secret.
				authKey?: string | *"sentinel-password"

				// config
				//
				// Valid sentinel config options in this section will be applied
				// as config options to each sentinel (see below)
				config?: close({
					// down-after-milliseconds
					//
					// # Additional sentinel conf options can be added below. Only
					// options that
					// # are expressed in the format simialar to 'sentinel xxx
					// mymaster xxx' will
					// # be properly templated expect maxclients option.
					// # For available options see
					// http://download.redis.io/redis-stable/sentinel.conf
					"down-after-milliseconds"?: int | *10000

					// failover-timeout
					//
					// # Failover timeout value in milliseconds
					"failover-timeout"?: int | *180000

					// maxclients
					maxclients?: int | *10000

					// parallel-syncs
					"parallel-syncs"?: int | *5
				})

				// customArgs
				customArgs?: [...null | bool | number | string | [...] | {
					...
				}]

				// customCommand
				customCommand?: [...null | bool | number | string | [...] | {
					...
				}]

				// customConfig
				//
				// # Custom sentinel.conf files used to override default settings.
				// If this file is
				// # specified then the sentinel.config above will be ignored.
				// Allows for custom sentinel.conf files to be applied. If this is
				// used then `sentinel.config` is ignored
				customConfig?: string | *""

				// existingSecret
				//
				// An existing secret containing a key defined by
				// `sentinel.authKey` that configures `requirepass`
				// in the conf parameters (Requires `sentinel.auth: enabled`,
				// cannot be used in conjunction with
				// `.Values.sentinel.password`)
				existingSecret?: string | *""

				// extraVolumeMounts
				//
				// additional volumeMounts for Sentinel container
				extraVolumeMounts?: [...null | bool | number | string | [...] | {
					...
				}]

				// lifecycle
				//
				// Container Lifecycle Hooks for sentinel container.
				// Ref:
				// https://kubernetes.io/docs/concepts/containers/container-lifecycle-hooks/
				lifecycle?: close({})

				// livenessProbe
				//
				// liveness probe parameters for sentinel container
				livenessProbe?: close({
					// enabled
					enabled?: bool | *true

					// failureThreshold
					//
					// Failure threshold for liveness probe
					failureThreshold?: int | *5

					// initialDelaySeconds
					//
					// Initial delay in seconds for liveness probe
					initialDelaySeconds?: int | *30

					// periodSeconds
					//
					// Period in seconds after which liveness probe will be repeated
					periodSeconds?: int | *15

					// successThreshold
					//
					// Success threshold for liveness probe
					successThreshold?: int | *1

					// timeoutSeconds
					//
					// Timeout seconds for liveness probe
					timeoutSeconds?: int | *15
				})

				// password
				//
				// (string) A password that configures a `requirepass` in the conf
				// parameters (Requires `sentinel.auth: enabled`)
				password?: null | *"~"

				// port
				//
				// Port to access the sentinel service
				port?: int | *26379

				// quorum
				//
				// Minimum number of nodes expected to be live.
				quorum?: int | *2

				// readinessProbe
				//
				// readiness probe parameters for sentinel container
				readinessProbe?: close({
					// enabled
					enabled?: bool | *true

					// failureThreshold
					//
					// Failure threshold for readiness probe
					failureThreshold?: int | *5

					// initialDelaySeconds
					//
					// Initial delay in seconds for readiness probe
					initialDelaySeconds?: int | *30

					// periodSeconds
					//
					// Period in seconds after which readiness probe will be repeated
					periodSeconds?: int | *15

					// successThreshold
					//
					// Success threshold for readiness probe
					successThreshold?: int | *3

					// timeoutSeconds
					//
					// Timeout seconds for readiness probe
					timeoutSeconds?: int | *15
				})

				// resources
				//
				// CPU/Memory for sentinel node resource requests/limits
				resources?: close({})

				// startupProbe
				//
				// Startup probe parameters for redis container
				startupProbe?: close({
					// enabled
					//
					// Enable Startup Probe
					enabled?: bool | *true

					// failureThreshold
					//
					// Failure threshold for startup probe
					failureThreshold?: int | *3

					// initialDelaySeconds
					//
					// Initial delay in seconds for startup probe
					initialDelaySeconds?: int | *5

					// periodSeconds
					//
					// Period in seconds after which startup probe will be repeated
					periodSeconds?: int | *10

					// successThreshold
					//
					// Success threshold for startup probe
					successThreshold?: int | *1

					// timeoutSeconds
					//
					// Timeout seconds for startup probe
					timeoutSeconds?: int | *15
				})

				// tlsPort
				//
				// # Configures sentinel with tls-port parameter
				// (int) TLS Port to access the sentinel service
				tlsPort?: null | *"~"

				// tlsReplication
				//
				// (bool) Configures sentinel with tls-replication parameter, if
				// true sets "tls-replication yes" in sentinel.conf
				tlsReplication?: null | *"~"
			})

			// serviceAccount
			//
			// # Pods Service Account
			// # ref:
			// https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/
			serviceAccount?: close({
				// annotations
				//
				// Annotations to be added to the service account for the redis
				// statefulset
				annotations?: close({})

				// automountToken
				//
				// opt in/out of automounting API credentials into container.
				// Ref:
				// https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/
				automountToken?: bool | *false

				// create
				//
				// Specifies whether a ServiceAccount should be created
				create?: bool | *true

				// name
				//
				// The name of the ServiceAccount to use.
				// If not set and create is true, a name is generated using the
				// redis-ha.fullname template
				name?: string | *""
			})

			// serviceLabels
			//
			// Custom labels for redis service
			serviceLabels?: close({})

			// splitBrainDetection
			splitBrainDetection?: close({
				// interval
				//
				// Interval between redis sentinel and server split brain checks
				// (in seconds)
				interval?: int | *60

				// resources
				//
				// splitBrainDetection resources
				resources?: close({})
			})

			// sysctlImage
			//
			// NOT RECOMMENDED: Additional container in which you can execute
			// arbitrary commands to update sysctl parameters
			// You can now use securityContext.sysctls to leverage this
			// capability
			// Ref:
			// https://kubernetes.io/docs/tasks/administer-cluster/sysctl-cluster/
			// #
			sysctlImage?: close({
				// command
				//
				// sysctlImage command to execute
				command?: [...null | bool | number | string | [...] | {
					...
				}]

				// enabled
				//
				// Enable an init container to modify Kernel settings
				enabled?: bool | *false

				// mountHostSys
				//
				// Mount the host `/sys` folder to `/host-sys`
				mountHostSys?: bool | *false

				// pullPolicy
				//
				// sysctlImage Init container pull policy
				pullPolicy?: string | *"Always"

				// registry
				//
				// sysctlImage Init container registry
				registry?: string | *"public.ecr.aws/docker/library"

				// repository
				//
				// sysctlImage Init container name
				repository?: string | *"busybox"

				// resources
				//
				// sysctlImage resources
				resources?: close({})

				// tag
				//
				// sysctlImage Init container tag
				tag?: string | *"1.34.1"
			})

			// tls
			tls?: close({
				// caCertFile
				//
				// Name of CA certificate file
				caCertFile?: string | *"ca.crt"

				// certFile
				//
				// Name of certificate file
				certFile?: string | *"redis.crt"

				// dhParamsFile
				//
				// (string) Name of Diffie-Hellman (DH) key exchange parameters
				// file (Example: redis.dh)
				dhParamsFile?: null | *"~"

				// keyFile
				//
				// Name of key file
				keyFile?: string | *"redis.key"
			})

			// topologySpreadConstraints
			//
			// #
			// https://kubernetes.io/docs/concepts/workloads/pods/pod-topology-spread-constraints/
			topologySpreadConstraints?: close({
				// enabled
				//
				// Enable topology spread constraints
				enabled?: bool | *false

				// maxSkew
				//
				// Max skew of pods tolerated
				maxSkew?: string | *""

				// topologyKey
				//
				// Topology key for spread constraints
				topologyKey?: string | *""

				// whenUnsatisfiable
				//
				// Enforcement policy, hard or soft
				whenUnsatisfiable?: string | *""
			})
			...
		}

		// redisSecretInit
		redisSecretInit?: close({
			// affinity
			//
			// Assign custom [affinity] rules to the Redis secret-init Job
			affinity?: close({})

			// containerSecurityContext
			//
			// Application controller container-level security context
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

				// runAsNonRoot
				runAsNonRoot?: bool | *true

				// seccompProfile
				seccompProfile?: close({
					// type
					type?: string | *"RuntimeDefault"
				})
			})

			// enabled
			//
			// Enable Redis secret initialization. If disabled, secret must be
			// provisioned by alternative methods
			enabled?: bool | *true

			// image
			image?: close({
				// imagePullPolicy
				//
				// Image pull policy for the Redis secret-init Job
				imagePullPolicy?: string | *""

				// repository
				//
				// Repository to use for the Redis secret-init Job
				repository?: string | *""

				// tag
				//
				// Tag to use for the Redis secret-init Job
				tag?: string | *""
			})

			// imagePullSecrets
			//
			// Secrets with credentials to pull images from a private registry
			imagePullSecrets?: [...null | bool | number | string | [...] | {
				...
			}]

			// jobAnnotations
			//
			// Annotations to be added to the Redis secret-init Job
			jobAnnotations?: close({})

			// name
			//
			// Redis secret-init name
			name?: string | *"redis-secret-init"

			// nodeSelector
			//
			// Node selector to be added to the Redis secret-init Job
			nodeSelector?: close({})

			// podAnnotations
			//
			// Annotations to be added to the Redis secret-init Job
			podAnnotations?: close({})

			// podLabels
			//
			// Labels to be added to the Redis secret-init Job
			podLabels?: close({})

			// priorityClassName
			//
			// Priority class for Redis secret-init Job
			priorityClassName?: string | *""

			// resources
			//
			// Resource limits and requests for Redis secret-init Job
			resources?: close({})

			// securityContext
			//
			// Redis secret-init Job pod-level security context
			securityContext?: close({})

			// serviceAccount
			serviceAccount?: close({
				// annotations
				//
				// Annotations applied to created service account
				annotations?: close({})

				// automountServiceAccountToken
				//
				// Automount API credentials for the Service Account
				automountServiceAccountToken?: bool | *true

				// create
				//
				// Create a service account for the redis pod
				create?: bool | *true

				// name
				//
				// Service account name for redis pod
				name?: string | *""
			})

			// tolerations
			//
			// Tolerations to be added to the Redis secret-init Job
			tolerations?: [...null | bool | number | string | [...] | {
				...
			}]
		})

		// repoServer
		//
		// # Repo Server
		repoServer?: close({
			// affinity
			//
			// Assign custom [affinity] rules to the deployment
			affinity?: close({})

			// automountServiceAccountToken
			//
			// Automount API credentials for the Service Account into the pod.
			automountServiceAccountToken?: bool | *true

			// autoscaling
			//
			// # Repo server Horizontal Pod Autoscaler
			autoscaling?: close({
				// behavior
				//
				// Configures the scaling behavior of the target in both Up and
				// Down directions.
				behavior?: close({})

				// enabled
				//
				// Enable Horizontal Pod Autoscaler ([HPA]) for the repo server
				enabled?: bool | *false

				// maxReplicas
				//
				// Maximum number of replicas for the repo server [HPA]
				maxReplicas?: int | *5

				// metrics
				//
				// scaleDown:
				// stabilizationWindowSeconds: 300
				// policies:
				// - type: Pods
				// value: 1
				// periodSeconds: 180
				// scaleUp:
				// stabilizationWindowSeconds: 300
				// policies:
				// - type: Pods
				// value: 2
				// periodSeconds: 60
				// Configures custom HPA metrics for the Argo CD repo server
				// Ref:
				// https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/
				metrics?: [...null | bool | number | string | [...] | {
					...
				}]

				// minReplicas
				//
				// Minimum number of replicas for the repo server [HPA]
				minReplicas?: int | *1

				// targetCPUUtilizationPercentage
				//
				// Average CPU utilization percentage for the repo server [HPA]
				targetCPUUtilizationPercentage?: int | *50

				// targetMemoryUtilizationPercentage
				//
				// Average memory utilization percentage for the repo server [HPA]
				targetMemoryUtilizationPercentage?: int | *50
			})

			// certificateSecret
			//
			// TLS certificate configuration via Secret
			// # Ref:
			// https://argo-cd.readthedocs.io/en/stable/operator-manual/tls/#configuring-tls-to-argocd-repo-server
			// # Note: Issuing certificates via cert-manager in not supported
			// right now because it's not possible to restart repo server
			// automatically without extra controllers.
			certificateSecret?: close({
				// annotations
				//
				// Annotations to be added to argocd-repo-server-tls secret
				annotations?: close({})

				// ca
				//
				// Certificate authority. Required for self-signed certificates.
				ca?: string | *""

				// crt
				//
				// Certificate data. Must contain SANs of Repo service (ie:
				// argocd-repo-server, argocd-repo-server.argo-cd.svc)
				crt?: string | *""

				// enabled
				//
				// Create argocd-repo-server-tls secret
				enabled?: bool | *false

				// key
				//
				// Certificate private key
				key?: string | *""

				// labels
				//
				// Labels to be added to argocd-repo-server-tls secret
				labels?: close({})
			})

			// clusterRoleRules
			//
			// # Enable Custom Rules for the Repo server's Cluster Role
			// resource
			// # Enable this and set the rules: to whatever custom rules you
			// want for the Cluster Role resource.
			// # Defaults to off
			clusterRoleRules?: close({
				// enabled
				//
				// Enable custom rules for the Repo server's Cluster Role resource
				enabled?: bool | *false

				// rules
				//
				// List of custom rules for the Repo server's Cluster Role
				// resource
				rules?: [...null | bool | number | string | [...] | {
					...
				}]
			})

			// containerPorts
			//
			// Repo server container ports
			containerPorts?: close({
				// metrics
				//
				// Metrics container port
				metrics?: int | *8084

				// server
				//
				// Repo server container port
				server?: int | *8081
			})

			// containerSecurityContext
			//
			// Repo server container-level security context
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

				// runAsNonRoot
				runAsNonRoot?: bool | *true

				// seccompProfile
				seccompProfile?: close({
					// type
					type?: string | *"RuntimeDefault"
				})
			})

			// deploymentAnnotations
			//
			// Annotations to be added to repo server Deployment
			deploymentAnnotations?: close({})

			// deploymentStrategy
			//
			// Deployment strategy to be added to the repo server Deployment
			deploymentStrategy?: close({})

			// dnsConfig
			//
			// [DNS configuration]
			dnsConfig?: close({})

			// dnsPolicy
			//
			// Alternative DNS policy for Repo server pods
			dnsPolicy?: string | *"ClusterFirst"

			// emptyDir
			//
			// # RepoServer emptyDir volumes
			emptyDir?: close({
				// sizeLimit
				//
				// EmptyDir size limit for repo server
				sizeLimit?: string | *""
			})

			// env
			//
			// Environment variables to pass to repo server
			env?: [...null | bool | number | string | [...] | {
				...
			}]

			// envFrom
			//
			// envFrom to pass to repo server
			envFrom?: [...null | bool | number | string | [...] | {
				...
			}]

			// existingVolumes
			//
			// Volumes to be used in replacement of emptydir on default
			// volumes
			existingVolumes?: close({})

			// extraArgs
			//
			// Additional command line arguments to pass to repo server
			extraArgs?: [...null | bool | number | string | [...] | {
				...
			}]

			// extraContainers
			//
			// Additional containers to be added to the repo server pod
			// # Ref:
			// https://argo-cd.readthedocs.io/en/stable/user-guide/config-management-plugins/
			// # Note: Supports use of custom Helm templates
			extraContainers?: [...null | bool | number | string | [...] | {
				...
			}]

			// hostNetwork
			//
			// Host Network for Repo server pods
			hostNetwork?: bool | *false

			// image
			//
			// # Repo server image
			image?: close({
				// imagePullPolicy
				//
				// Image pull policy for the repo server
				imagePullPolicy?: string | *""

				// repository
				//
				// Repository to use for the repo server
				repository?: string | *""

				// tag
				//
				// Tag to use for the repo server
				tag?: string | *""
			})

			// imagePullSecrets
			//
			// Secrets with credentials to pull images from a private registry
			imagePullSecrets?: [...null | bool | number | string | [...] | {
				...
			}]

			// initContainers
			//
			// Init containers to add to the repo server pods
			initContainers?: [...null | bool | number | string | [...] | {
				...
			}]

			// lifecycle
			//
			// Specify postStart and preStop lifecycle hooks for your
			// argo-repo-server container
			lifecycle?: close({})

			// livenessProbe
			livenessProbe?: close({
				// failureThreshold
				//
				// Minimum consecutive failures for the [probe] to be considered
				// failed after having succeeded
				failureThreshold?: int | *3

				// initialDelaySeconds
				//
				// Number of seconds after the container has started before
				// [probe] is initiated
				initialDelaySeconds?: int | *10

				// periodSeconds
				//
				// How often (in seconds) to perform the [probe]
				periodSeconds?: int | *10

				// successThreshold
				//
				// Minimum consecutive successes for the [probe] to be considered
				// successful after having failed
				successThreshold?: int | *1

				// timeoutSeconds
				//
				// Number of seconds after which the [probe] times out
				timeoutSeconds?: int | *1
			})

			// metrics
			//
			// # Repo server metrics service configuration
			metrics?: close({
				// enabled
				//
				// Deploy metrics service
				enabled?: bool | *false

				// service
				service?: close({
					// annotations
					//
					// Metrics service annotations
					annotations?: close({})

					// clusterIP
					//
					// Metrics service clusterIP. `None` makes a "headless service"
					// (no virtual IP)
					clusterIP?: string | *""

					// labels
					//
					// Metrics service labels
					labels?: close({})

					// portName
					//
					// Metrics service port name
					portName?: string | *"http-metrics"

					// servicePort
					//
					// Metrics service port
					servicePort?: int | *8084

					// type
					//
					// Metrics service type
					type?: string | *"ClusterIP"
				})

				// serviceMonitor
				serviceMonitor?: close({
					// additionalLabels
					//
					// Prometheus ServiceMonitor labels
					additionalLabels?: close({})

					// annotations
					//
					// Prometheus ServiceMonitor annotations
					annotations?: close({})

					// enabled
					//
					// Enable a prometheus ServiceMonitor
					enabled?: bool | *false

					// honorLabels
					//
					// When true, honorLabels preserves the metric’s labels when they
					// collide with the target’s labels.
					honorLabels?: bool | *false

					// interval
					//
					// Prometheus ServiceMonitor interval
					interval?: string | *"30s"

					// metricRelabelings
					//
					// Prometheus [MetricRelabelConfigs] to apply to samples before
					// ingestion
					metricRelabelings?: [...null | bool | number | string | [...] | {
						...
					}]

					// namespace
					//
					// Prometheus ServiceMonitor namespace
					namespace?: string | *""

					// relabelings
					//
					// Prometheus [RelabelConfigs] to apply to samples before scraping
					relabelings?: [...null | bool | number | string | [...] | {
						...
					}]

					// scheme
					//
					// Prometheus ServiceMonitor scheme
					scheme?: string | *""

					// scrapeTimeout
					//
					// Prometheus ServiceMonitor scrapeTimeout. If empty, Prometheus
					// uses the global scrape timeout unless it is less than the
					// target's scrape interval value in which the latter is used.
					scrapeTimeout?: string | *""

					// selector
					//
					// Prometheus ServiceMonitor selector
					selector?: close({})

					// tlsConfig
					//
					// Prometheus ServiceMonitor tlsConfig
					tlsConfig?: close({})
				})
			})

			// name
			//
			// Repo server name
			name?: string | *"repo-server"

			// nodeSelector
			//
			// [Node selector]
			nodeSelector?: close({})

			// pdb
			//
			// # Repo server Pod Disruption Budget
			// # Ref:
			// https://kubernetes.io/docs/tasks/run-application/configure-pdb/
			pdb?: close({
				// annotations
				//
				// Annotations to be added to repo server pdb
				annotations?: close({})

				// enabled
				//
				// Deploy a [PodDisruptionBudget] for the repo server
				enabled?: bool | *false

				// labels
				//
				// Labels to be added to repo server pdb
				labels?: close({})

				// maxUnavailable
				//
				// Number of pods that are unavailable after eviction as number or
				// percentage (eg.: 50%).
				// # Has higher precedence over `repoServer.pdb.minAvailable`
				maxUnavailable?: string | *""

				// minAvailable
				//
				// Number of pods that are available after eviction as number or
				// percentage (eg.: 50%)
				minAvailable?: string | *""
			})

			// podAnnotations
			//
			// Annotations to be added to repo server pods
			podAnnotations?: close({})

			// podLabels
			//
			// Labels to be added to repo server pods
			podLabels?: close({})

			// priorityClassName
			//
			// Priority class for the repo server pods
			priorityClassName?: string | *""

			// rbac
			//
			// Repo server rbac rules
			rbac?: [...null | bool | number | string | [...] | {
				...
			}]

			// readinessProbe
			//
			// # Readiness and liveness probes for default backend
			// # Ref:
			// https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/
			readinessProbe?: close({
				// failureThreshold
				//
				// Minimum consecutive failures for the [probe] to be considered
				// failed after having succeeded
				failureThreshold?: int | *3

				// initialDelaySeconds
				//
				// Number of seconds after the container has started before
				// [probe] is initiated
				initialDelaySeconds?: int | *10

				// periodSeconds
				//
				// How often (in seconds) to perform the [probe]
				periodSeconds?: int | *10

				// successThreshold
				//
				// Minimum consecutive successes for the [probe] to be considered
				// successful after having failed
				successThreshold?: int | *1

				// timeoutSeconds
				//
				// Number of seconds after which the [probe] times out
				timeoutSeconds?: int | *1
			})

			// replicas
			//
			// The number of repo server pods to run
			replicas?: int | *1

			// resources
			//
			// Resource limits and requests for the repo server pods
			resources?: close({})

			// runtimeClassName
			//
			// Runtime class name for the repo server
			runtimeClassName?: string | *""

			// service
			//
			// # Repo server service configuration
			service?: close({
				// annotations
				//
				// Repo server service annotations
				annotations?: close({})

				// labels
				//
				// Repo server service labels
				labels?: close({})

				// port
				//
				// Repo server service port
				port?: int | *8081

				// portName
				//
				// Repo server service port name
				portName?: string | *"tcp-repo-server"
			})

			// serviceAccount
			//
			// # Repo server service account
			// # If create is set to true, make sure to uncomment the name and
			// update the rbac section below
			serviceAccount?: close({
				// annotations
				//
				// Annotations applied to created service account
				annotations?: close({})

				// automountServiceAccountToken
				//
				// Automount API credentials for the Service Account
				automountServiceAccountToken?: bool | *true

				// create
				//
				// Create repo server service account
				create?: bool | *true

				// labels
				//
				// Labels applied to created service account
				labels?: close({})

				// name
				//
				// Repo server service account name
				name?: string | *""
			})

			// terminationGracePeriodSeconds
			//
			// terminationGracePeriodSeconds for container lifecycle hook
			terminationGracePeriodSeconds?: int | *30

			// tolerations
			//
			// [Tolerations] for use with node taints
			tolerations?: [...null | bool | number | string | [...] | {
				...
			}]

			// topologySpreadConstraints
			//
			// Assign custom [TopologySpreadConstraints] rules to the repo
			// server
			// # Ref:
			// https://kubernetes.io/docs/concepts/workloads/pods/pod-topology-spread-constraints/
			// # If labelSelector is left out, it will default to the
			// labelSelector configuration of the deployment
			topologySpreadConstraints?: [...null | bool | number | string | [...] | {
				...
			}]

			// useEphemeralHelmWorkingDir
			//
			// Toggle the usage of a ephemeral Helm working directory
			useEphemeralHelmWorkingDir?: bool | *true

			// volumeMounts
			//
			// Additional volumeMounts to the repo server main container
			volumeMounts?: [...null | bool | number | string | [...] | {
				...
			}]

			// volumes
			//
			// Additional volumes to the repo server pod
			volumes?: [...null | bool | number | string | [...] | {
				...
			}]
		})

		// server
		//
		// # Server
		server?: close({
			// affinity
			//
			// Assign custom [affinity] rules to the deployment
			affinity?: close({})

			// automountServiceAccountToken
			//
			// Automount API credentials for the Service Account into the pod.
			automountServiceAccountToken?: bool | *true

			// autoscaling
			//
			// # Argo CD server Horizontal Pod Autoscaler
			autoscaling?: close({
				// behavior
				//
				// Configures the scaling behavior of the target in both Up and
				// Down directions.
				behavior?: close({})

				// enabled
				//
				// Enable Horizontal Pod Autoscaler ([HPA]) for the Argo CD server
				enabled?: bool | *false

				// maxReplicas
				//
				// Maximum number of replicas for the Argo CD server [HPA]
				maxReplicas?: int | *5

				// metrics
				//
				// scaleDown:
				// stabilizationWindowSeconds: 300
				// policies:
				// - type: Pods
				// value: 1
				// periodSeconds: 180
				// scaleUp:
				// stabilizationWindowSeconds: 300
				// policies:
				// - type: Pods
				// value: 2
				// periodSeconds: 60
				// Configures custom HPA metrics for the Argo CD server
				// Ref:
				// https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/
				metrics?: [...null | bool | number | string | [...] | {
					...
				}]

				// minReplicas
				//
				// Minimum number of replicas for the Argo CD server [HPA]
				minReplicas?: int | *1

				// targetCPUUtilizationPercentage
				//
				// Average CPU utilization percentage for the Argo CD server [HPA]
				targetCPUUtilizationPercentage?: int | *50

				// targetMemoryUtilizationPercentage
				//
				// Average memory utilization percentage for the Argo CD server
				// [HPA]
				targetMemoryUtilizationPercentage?: int | *50
			})

			// certificate
			//
			// TLS certificate configuration via cert-manager
			// # Ref:
			// https://argo-cd.readthedocs.io/en/stable/operator-manual/tls/#tls-certificates-used-by-argocd-server
			certificate?: close({
				// additionalHosts
				//
				// Certificate Subject Alternate Names (SANs)
				additionalHosts?: [...null | bool | number | string | [...] | {
					...
				}]

				// annotations
				//
				// Annotations to be applied to the Server Certificate
				annotations?: close({})

				// domain
				//
				// Certificate primary domain (commonName)
				domain?: string | *""

				// duration
				//
				// The requested 'duration' (i.e. lifetime) of the certificate.
				// # Ref: https://cert-manager.io/docs/usage/certificate/#renewal
				duration?: string | *""

				// enabled
				//
				// Deploy a Certificate resource (requires cert-manager)
				enabled?: bool | *false

				// issuer
				//
				// Certificate issuer
				// # Ref: https://cert-manager.io/docs/concepts/issuer
				issuer?: close({
					// group
					//
					// Certificate issuer group. Set if using an external issuer. Eg.
					// `cert-manager.io`
					group?: string | *""

					// kind
					//
					// Certificate issuer kind. Either `Issuer` or `ClusterIssuer`
					kind?: string | *""

					// name
					//
					// Certificate issuer name. Eg. `letsencrypt`
					name?: string | *""
				})

				// privateKey
				//
				// Private key of the certificate
				privateKey?: close({
					// algorithm
					//
					// Algorithm used to generate certificate private key. One of:
					// `RSA`, `Ed25519` or `ECDSA`
					algorithm?: string | *"RSA"

					// encoding
					//
					// The private key cryptography standards (PKCS) encoding for
					// private key. Either: `PCKS1` or `PKCS8`
					encoding?: string | *"PKCS1"

					// rotationPolicy
					//
					// Rotation policy of private key when certificate is re-issued.
					// Either: `Never` or `Always`
					rotationPolicy?: string | *"Never"

					// size
					//
					// Key bit size of the private key. If algorithm is set to
					// `Ed25519`, size is ignored.
					size?: int | *2048
				})

				// renewBefore
				//
				// How long before the expiry a certificate should be renewed.
				// # Ref: https://cert-manager.io/docs/usage/certificate/#renewal
				renewBefore?: string | *""

				// secretTemplateAnnotations
				//
				// Annotations that allow the certificate to be composed from data
				// residing in existing Kubernetes Resources
				secretTemplateAnnotations?: close({})

				// usages
				//
				// Usages for the certificate
				// ## Ref:
				// https://cert-manager.io/docs/reference/api-docs/#cert-manager.io/v1.KeyUsage
				usages?: [...null | bool | number | string | [...] | {
					...
				}]
			})

			// certificateSecret
			//
			// TLS certificate configuration via Secret
			// # Ref:
			// https://argo-cd.readthedocs.io/en/stable/operator-manual/tls/#tls-certificates-used-by-argocd-server
			certificateSecret?: close({
				// annotations
				//
				// Annotations to be added to argocd-server-tls secret
				annotations?: close({})

				// crt
				//
				// Certificate data
				crt?: string | *""

				// enabled
				//
				// Create argocd-server-tls secret
				enabled?: bool | *false

				// key
				//
				// Private Key of the certificate
				key?: string | *""

				// labels
				//
				// Labels to be added to argocd-server-tls secret
				labels?: close({})
			})

			// clusterRoleRules
			//
			// # Enable this and set the rules: to whatever custom rules you
			// want for the Cluster Role resource.
			// # Defaults to off
			clusterRoleRules?: close({
				// enabled
				//
				// Enable custom rules for the server's ClusterRole resource
				enabled?: bool | *false

				// rules
				//
				// List of custom rules for the server's ClusterRole resource
				rules?: [...null | bool | number | string | [...] | {
					...
				}]
			})

			// containerPorts
			//
			// Server container ports
			containerPorts?: close({
				// metrics
				//
				// Metrics container port
				metrics?: int | *8083

				// server
				//
				// Server container port
				server?: int | *8080
			})

			// containerSecurityContext
			//
			// Server container-level security context
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

				// runAsNonRoot
				runAsNonRoot?: bool | *true

				// seccompProfile
				seccompProfile?: close({
					// type
					type?: string | *"RuntimeDefault"
				})
			})

			// deploymentAnnotations
			//
			// Annotations to be added to server Deployment
			deploymentAnnotations?: close({})

			// deploymentStrategy
			//
			// Deployment strategy to be added to the server Deployment
			deploymentStrategy?: close({})

			// dnsConfig
			//
			// [DNS configuration]
			dnsConfig?: close({})

			// dnsPolicy
			//
			// Alternative DNS policy for Server pods
			dnsPolicy?: string | *"ClusterFirst"

			// emptyDir
			//
			// # Argo CD server emptyDir volumes
			emptyDir?: close({
				// sizeLimit
				//
				// EmptyDir size limit for the Argo CD server
				sizeLimit?: string | *""
			})

			// env
			//
			// Environment variables to pass to Argo CD server
			env?: [...null | bool | number | string | [...] | {
				...
			}]

			// envFrom
			//
			// envFrom to pass to Argo CD server
			envFrom?: [...null | bool | number | string | [...] | {
				...
			}]

			// extensions
			//
			// # Argo CD extensions
			// # This function in tech preview stage, do expect instability or
			// breaking changes in newer versions.
			// # Ref:
			// https://github.com/argoproj-labs/argocd-extension-installer
			// # When you enable extensions, you need to configure RBAC of
			// logged in Argo CD user.
			// # Ref:
			// https://argo-cd.readthedocs.io/en/stable/operator-manual/rbac/#the-extensions-resource
			extensions?: close({
				// containerSecurityContext
				//
				// Server UI extensions container-level security context
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

					// runAsNonRoot
					runAsNonRoot?: bool | *true

					// runAsUser
					runAsUser?: int | *1000

					// seccompProfile
					seccompProfile?: close({
						// type
						type?: string | *"RuntimeDefault"
					})
				})

				// enabled
				//
				// Enable support for Argo CD extensions
				enabled?: bool | *false

				// extensionList
				//
				// Extensions for Argo CD
				// # Ref:
				// https://github.com/argoproj-labs/argocd-extension-metrics#install-ui-extension
				extensionList?: [...null | bool | number | string | [...] | {
					...
				}]

				// image
				//
				// # Argo CD extension installer image
				image?: close({
					// imagePullPolicy
					//
					// Image pull policy for extensions
					imagePullPolicy?: string | *""

					// repository
					//
					// Repository to use for extension installer image
					repository?: string | *"quay.io/argoprojlabs/argocd-extension-installer"

					// tag
					//
					// Tag to use for extension installer image
					tag?: string | *"v0.0.8"
				})

				// resources
				//
				// Resource limits and requests for the argocd-extensions
				// container
				resources?: close({})
			})

			// extraArgs
			//
			// Additional command line arguments to pass to Argo CD server
			extraArgs?: [...null | bool | number | string | [...] | {
				...
			}]

			// extraContainers
			//
			// Additional containers to be added to the server pod
			// # Note: Supports use of custom Helm templates
			extraContainers?: [...null | bool | number | string | [...] | {
				...
			}]

			// hostNetwork
			//
			// Host Network for Server pods
			hostNetwork?: bool | *false

			// image
			//
			// # Argo CD server image
			image?: close({
				// imagePullPolicy
				//
				// Image pull policy for the Argo CD server
				imagePullPolicy?: string | *""

				// repository
				//
				// Repository to use for the Argo CD server
				repository?: string | *""

				// tag
				//
				// Tag to use for the Argo CD server
				tag?: string | *""
			})

			// imagePullSecrets
			//
			// Secrets with credentials to pull images from a private registry
			imagePullSecrets?: [...null | bool | number | string | [...] | {
				...
			}]

			// ingress
			//
			// Argo CD server ingress configuration
			ingress?: close({
				// annotations
				//
				// Additional ingress annotations
				// # Ref:
				// https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/#option-1-ssl-passthrough
				annotations?: close({})

				// aws
				//
				// AWS specific options for Application Load Balancer
				// Applies only when `serv.ingress.controller` is set to `aws`
				// # Ref:
				// https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/#aws-application-load-balancers-albs-and-classic-elb-http-mode
				aws?: close({
					// backendProtocolVersion
					//
					// Backend protocol version for the AWS ALB gRPC service
					// # This tells AWS to send traffic from the ALB using gRPC.
					// # For more information:
					// https://docs.aws.amazon.com/elasticloadbalancing/latest/application/target-group-health-checks.html#health-check-settings
					backendProtocolVersion?: string | *"GRPC"

					// serviceType
					//
					// Service type for the AWS ALB gRPC service
					// # Can be of type NodePort or ClusterIP depending on which mode
					// you are running.
					// # Instance mode needs type NodePort, IP mode needs type
					// ClusterIP
					// # Ref:
					// https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/how-it-works/#ingress-traffic
					serviceType?: string | *"NodePort"
				})

				// controller
				//
				// Specific implementation for ingress controller. One of
				// `generic`, `aws` or `gke`
				// # Additional configuration might be required in related
				// configuration sections
				controller?: string | *"generic"

				// enabled
				//
				// Enable an ingress resource for the Argo CD server
				enabled?: bool | *false

				// extraHosts
				//
				// The list of additional hostnames to be covered by ingress
				// record
				extraHosts?: [...null | bool | number | string | [...] | {
					...
				}]

				// extraPaths
				//
				// Additional ingress paths
				// # Note: Supports use of custom Helm templates
				extraPaths?: [...null | bool | number | string | [...] | {
					...
				}]

				// extraRules
				//
				// Additional ingress rules
				// # Note: Supports use of custom Helm templates
				extraRules?: [...null | bool | number | string | [...] | {
					...
				}]

				// extraTls
				//
				// Additional TLS configuration
				extraTls?: [...null | bool | number | string | [...] | {
					...
				}]

				// gke
				//
				// Google specific options for Google Application Load Balancer
				// Applies only when `server.ingress.controller` is set to `gke`
				// # Ref:
				// https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/#google-cloud-load-balancers-with-kubernetes-ingress
				gke?: close({
					// backendConfig
					//
					// Google [BackendConfig] resource, for use with the GKE Ingress
					// Controller
					// # Ref:
					// https://cloud.google.com/kubernetes-engine/docs/how-to/ingress-features#configuring_ingress_features_through_frontendconfig_parameters
					backendConfig?: close({})

					// frontendConfig
					//
					// Google [FrontendConfig] resource, for use with the GKE Ingress
					// Controller
					// # Ref:
					// https://cloud.google.com/kubernetes-engine/docs/how-to/ingress-features#configuring_ingress_features_through_frontendconfig_parameters
					frontendConfig?: close({})

					// managedCertificate
					//
					// Managed GKE certificate for ingress hostname
					managedCertificate?: close({
						// create
						//
						// Create ManagedCertificate resource and annotations for Google
						// Load balancer
						// # Ref:
						// https://cloud.google.com/kubernetes-engine/docs/how-to/managed-certs
						create?: bool | *true

						// extraDomains
						//
						// Additional domains for ManagedCertificate resource
						extraDomains?: [...null | bool | number | string | [...] | {
							...
						}]
					})
				})

				// hostname
				//
				// Argo CD server hostname
				hostname?: string | *""

				// ingressClassName
				//
				// Defines which ingress controller will implement the resource
				ingressClassName?: string | *""

				// labels
				//
				// Additional ingress labels
				labels?: close({})

				// path
				//
				// The path to Argo CD server
				path?: string | *"/"

				// pathType
				//
				// Ingress path type. One of `Exact`, `Prefix` or
				// `ImplementationSpecific`
				pathType?: string | *"Prefix"

				// tls
				//
				// Enable TLS configuration for the hostname defined at
				// `server.ingress.hostname`
				// # TLS certificate will be retrieved from a TLS secret
				// `argocd-server-tls`
				// # You can create this secret via `certificate` or
				// `certificateSecret` option
				tls?: bool | *false
			})

			// ingressGrpc
			//
			// Dedicated gRPC ingress for ingress controllers that supports
			// only single backend protocol per Ingress resource
			// Ref:
			// https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/#option-2-multiple-ingress-objects-and-hosts
			ingressGrpc?: close({
				// annotations
				//
				// Additional ingress annotations for dedicated [gRPC-ingress]
				annotations?: close({})

				// enabled
				//
				// Enable an ingress resource for the Argo CD server for dedicated
				// [gRPC-ingress]
				enabled?: bool | *false

				// extraHosts
				//
				// The list of additional hostnames to be covered by ingress
				// record
				extraHosts?: [...null | bool | number | string | [...] | {
					...
				}]

				// extraPaths
				//
				// Additional ingress paths for dedicated [gRPC-ingress]
				// # Note: Supports use of custom Helm templates
				extraPaths?: [...null | bool | number | string | [...] | {
					...
				}]

				// extraRules
				//
				// Additional ingress rules
				// # Note: Supports use of custom Helm templates
				extraRules?: [...null | bool | number | string | [...] | {
					...
				}]

				// extraTls
				//
				// Additional TLS configuration for dedicated [gRPC-ingress]
				extraTls?: [...null | bool | number | string | [...] | {
					...
				}]

				// hostname
				//
				// Argo CD server hostname for dedicated [gRPC-ingress]
				hostname?: string | *""

				// ingressClassName
				//
				// Defines which ingress controller will implement the resource
				// [gRPC-ingress]
				ingressClassName?: string | *""

				// labels
				//
				// Additional ingress labels for dedicated [gRPC-ingress]
				labels?: close({})

				// path
				//
				// Argo CD server ingress path for dedicated [gRPC-ingress]
				path?: string | *"/"

				// pathType
				//
				// Ingress path type for dedicated [gRPC-ingress]. One of `Exact`,
				// `Prefix` or `ImplementationSpecific`
				pathType?: string | *"Prefix"

				// tls
				//
				// Enable TLS configuration for the hostname defined at
				// `server.ingressGrpc.hostname`
				// # TLS certificate will be retrieved from a TLS secret with
				// name: `argocd-server-grpc-tls`
				tls?: bool | *false
			})

			// initContainers
			//
			// Init containers to add to the server pod
			// # If your target Kubernetes cluster(s) require a custom
			// credential (exec) plugin
			// # you could use this (and the same in the application
			// controller pod) to provide such executable
			// # Ref:
			// https://kubernetes.io/docs/reference/access-authn-authz/authentication/#client-go-credential-plugins
			initContainers?: [...null | bool | number | string | [...] | {
				...
			}]

			// lifecycle
			//
			// Specify postStart and preStop lifecycle hooks for your
			// argo-cd-server container
			lifecycle?: close({})

			// livenessProbe
			livenessProbe?: close({
				// failureThreshold
				//
				// Minimum consecutive failures for the [probe] to be considered
				// failed after having succeeded
				failureThreshold?: int | *3

				// initialDelaySeconds
				//
				// Number of seconds after the container has started before
				// [probe] is initiated
				initialDelaySeconds?: int | *10

				// periodSeconds
				//
				// How often (in seconds) to perform the [probe]
				periodSeconds?: int | *10

				// successThreshold
				//
				// Minimum consecutive successes for the [probe] to be considered
				// successful after having failed
				successThreshold?: int | *1

				// timeoutSeconds
				//
				// Number of seconds after which the [probe] times out
				timeoutSeconds?: int | *1
			})

			// metrics
			//
			// # Server metrics service configuration
			metrics?: close({
				// enabled
				//
				// Deploy metrics service
				enabled?: bool | *false

				// service
				service?: close({
					// annotations
					//
					// Metrics service annotations
					annotations?: close({})

					// clusterIP
					//
					// Metrics service clusterIP. `None` makes a "headless service"
					// (no virtual IP)
					clusterIP?: string | *""

					// labels
					//
					// Metrics service labels
					labels?: close({})

					// portName
					//
					// Metrics service port name
					portName?: string | *"http-metrics"

					// servicePort
					//
					// Metrics service port
					servicePort?: int | *8083

					// type
					//
					// Metrics service type
					type?: string | *"ClusterIP"
				})

				// serviceMonitor
				serviceMonitor?: close({
					// additionalLabels
					//
					// Prometheus ServiceMonitor labels
					additionalLabels?: close({})

					// annotations
					//
					// Prometheus ServiceMonitor annotations
					annotations?: close({})

					// enabled
					//
					// Enable a prometheus ServiceMonitor
					enabled?: bool | *false

					// honorLabels
					//
					// When true, honorLabels preserves the metric’s labels when they
					// collide with the target’s labels.
					honorLabels?: bool | *false

					// interval
					//
					// Prometheus ServiceMonitor interval
					interval?: string | *"30s"

					// metricRelabelings
					//
					// Prometheus [MetricRelabelConfigs] to apply to samples before
					// ingestion
					metricRelabelings?: [...null | bool | number | string | [...] | {
						...
					}]

					// namespace
					//
					// Prometheus ServiceMonitor namespace
					namespace?: string | *""

					// relabelings
					//
					// Prometheus [RelabelConfigs] to apply to samples before scraping
					relabelings?: [...null | bool | number | string | [...] | {
						...
					}]

					// scheme
					//
					// Prometheus ServiceMonitor scheme
					scheme?: string | *""

					// scrapeTimeout
					//
					// Prometheus ServiceMonitor scrapeTimeout. If empty, Prometheus
					// uses the global scrape timeout unless it is less than the
					// target's scrape interval value in which the latter is used.
					scrapeTimeout?: string | *""

					// selector
					//
					// Prometheus ServiceMonitor selector
					selector?: close({})

					// tlsConfig
					//
					// Prometheus ServiceMonitor tlsConfig
					tlsConfig?: close({})
				})
			})

			// name
			//
			// Argo CD server name
			name?: string | *"server"

			// nodeSelector
			//
			// [Node selector]
			nodeSelector?: close({})

			// pdb
			//
			// # Argo CD server Pod Disruption Budget
			// # Ref:
			// https://kubernetes.io/docs/tasks/run-application/configure-pdb/
			pdb?: close({
				// annotations
				//
				// Annotations to be added to Argo CD server pdb
				annotations?: close({})

				// enabled
				//
				// Deploy a [PodDisruptionBudget] for the Argo CD server
				enabled?: bool | *false

				// labels
				//
				// Labels to be added to Argo CD server pdb
				labels?: close({})

				// maxUnavailable
				//
				// Number of pods that are unavailable after eviction as number or
				// percentage (eg.: 50%).
				// # Has higher precedence over `server.pdb.minAvailable`
				maxUnavailable?: string | *""

				// minAvailable
				//
				// Number of pods that are available after eviction as number or
				// percentage (eg.: 50%)
				minAvailable?: string | *""
			})

			// podAnnotations
			//
			// Annotations to be added to server pods
			podAnnotations?: close({})

			// podLabels
			//
			// Labels to be added to server pods
			podLabels?: close({})

			// priorityClassName
			//
			// Priority class for the Argo CD server pods
			priorityClassName?: string | *""

			// readinessProbe
			//
			// # Readiness and liveness probes for default backend
			// # Ref:
			// https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/
			readinessProbe?: close({
				// failureThreshold
				//
				// Minimum consecutive failures for the [probe] to be considered
				// failed after having succeeded
				failureThreshold?: int | *3

				// initialDelaySeconds
				//
				// Number of seconds after the container has started before
				// [probe] is initiated
				initialDelaySeconds?: int | *10

				// periodSeconds
				//
				// How often (in seconds) to perform the [probe]
				periodSeconds?: int | *10

				// successThreshold
				//
				// Minimum consecutive successes for the [probe] to be considered
				// successful after having failed
				successThreshold?: int | *1

				// timeoutSeconds
				//
				// Number of seconds after which the [probe] times out
				timeoutSeconds?: int | *1
			})

			// replicas
			//
			// The number of server pods to run
			replicas?: int | *1

			// resources
			//
			// Resource limits and requests for the Argo CD server
			resources?: close({})

			// route
			//
			// Create a OpenShift Route with SSL passthrough for UI and CLI
			// Consider setting 'hostname' e.g.
			// https://argocd.apps-crc.testing/ using your Default Ingress
			// Controller Domain
			// Find your domain with: kubectl describe
			// --namespace=openshift-ingress-operator
			// ingresscontroller/default | grep Domain:
			// If 'hostname' is an empty string "" OpenShift will create a
			// hostname for you.
			route?: close({
				// annotations
				//
				// Openshift Route annotations
				annotations?: close({})

				// enabled
				//
				// Enable an OpenShift Route for the Argo CD server
				enabled?: bool | *false

				// hostname
				//
				// Hostname of OpenShift Route
				hostname?: string | *""

				// termination_policy
				//
				// Termination policy of Openshift Route
				termination_policy?: string | *"None"

				// termination_type
				//
				// Termination type of Openshift Route
				termination_type?: string | *"passthrough"
			})

			// runtimeClassName
			//
			// Runtime class name for the Argo CD server
			runtimeClassName?: string | *""

			// service
			//
			// # Server service configuration
			service?: close({
				// annotations
				//
				// Server service annotations
				annotations?: close({})

				// externalIPs
				//
				// Server service external IPs
				externalIPs?: [...null | bool | number | string | [...] | {
					...
				}]

				// externalTrafficPolicy
				//
				// Denotes if this Service desires to route external traffic to
				// node-local or cluster-wide endpoints
				// # Ref:
				// https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/#preserving-the-client-source-ip
				externalTrafficPolicy?: string | *"Cluster"

				// labels
				//
				// Server service labels
				labels?: close({})

				// loadBalancerClass
				//
				// The class of the load balancer implementation
				loadBalancerClass?: string | *""

				// loadBalancerIP
				//
				// LoadBalancer will get created with the IP specified in this
				// field
				loadBalancerIP?: string | *""

				// loadBalancerSourceRanges
				//
				// Source IP ranges to allow access to service from
				// # Ref:
				// https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/#restrict-access-for-loadbalancer-service
				loadBalancerSourceRanges?: [...null | bool | number | string | [...] | {
					...
				}]

				// nodePortHttp
				//
				// Server service http port for NodePort service type (only if
				// `server.service.type` is set to "NodePort")
				nodePortHttp?: int | *30080

				// nodePortHttps
				//
				// Server service https port for NodePort service type (only if
				// `server.service.type` is set to "NodePort")
				nodePortHttps?: int | *30443

				// servicePortHttp
				//
				// Server service http port
				servicePortHttp?: int | *80

				// servicePortHttpName
				//
				// Server service http port name, can be used to route traffic via
				// istio
				servicePortHttpName?: string | *"http"

				// servicePortHttps
				//
				// Server service https port
				servicePortHttps?: int | *443

				// servicePortHttpsAppProtocol
				//
				// Server service https port appProtocol
				// # Ref:
				// https://kubernetes.io/docs/concepts/services-networking/service/#application-protocol
				servicePortHttpsAppProtocol?: string | *""

				// servicePortHttpsName
				//
				// Server service https port name, can be used to route traffic
				// via istio
				servicePortHttpsName?: string | *"https"

				// sessionAffinity
				//
				// Used to maintain session affinity. Supports `ClientIP` and
				// `None`
				// # Ref:
				// https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
				sessionAffinity?: string | *"None"

				// type
				//
				// Server service type
				type?: string | *"ClusterIP"
			})

			// serviceAccount
			serviceAccount?: close({
				// annotations
				//
				// Annotations applied to created service account
				annotations?: close({})

				// automountServiceAccountToken
				//
				// Automount API credentials for the Service Account
				automountServiceAccountToken?: bool | *true

				// create
				//
				// Create server service account
				create?: bool | *true

				// labels
				//
				// Labels applied to created service account
				labels?: close({})

				// name
				//
				// Server service account name
				name?: string | *"argocd-server"
			})

			// terminationGracePeriodSeconds
			//
			// terminationGracePeriodSeconds for container lifecycle hook
			terminationGracePeriodSeconds?: int | *30

			// tolerations
			//
			// [Tolerations] for use with node taints
			tolerations?: [...null | bool | number | string | [...] | {
				...
			}]

			// topologySpreadConstraints
			//
			// Assign custom [TopologySpreadConstraints] rules to the Argo CD
			// server
			// # Ref:
			// https://kubernetes.io/docs/concepts/workloads/pods/pod-topology-spread-constraints/
			// # If labelSelector is left out, it will default to the
			// labelSelector configuration of the deployment
			topologySpreadConstraints?: [...null | bool | number | string | [...] | {
				...
			}]

			// volumeMounts
			//
			// Additional volumeMounts to the server main container
			volumeMounts?: [...null | bool | number | string | [...] | {
				...
			}]

			// volumes
			//
			// Additional volumes to the server pod
			volumes?: [...null | bool | number | string | [...] | {
				...
			}]
		})
	})
}
