# kaskada-canary

![Version: 0.0.2](https://img.shields.io/badge/Version-0.0.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Kaskada is a query engine for event-based (timestamped) data.

This helm chart installs a persistant version of the kaskada service in the simplest configuration possible.
This chart is primarily for initial testing and should not be used in production scenarios.

In this setup, the kaskada service runs as two containers in a single pod, and persists its database
as a file on attached storage. It also requires access to an object store.

**Homepage:** <https://github.com/kaskada-ai/kaskada>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| ericpinzur | <eric.pinzur@datastax.com> |  |

## Source Code

* <https://github.com/kaskada-ai/kaskada/>
* <https://github.com/kaskada-ai/helm-charts>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| auth.aws | object | `{"accessKeyId":null,"region":null,"secretAccessKey":null}` | Instead, consider using IRSA authenication via the `auth.serviceAccount` values below. |
| auth.aws.accessKeyId | string | `nil` | An AWS access key id that has permisison to write to the bucket & path |
| auth.aws.region | string | `nil` | The region where the S3 bucket exists |
| auth.aws.secretAccessKey | string | `nil` | An AWS secret access key that has permisison to write to the bucket & prefix |
| auth.serviceAccount.annotations | object | `{}` | Annotations for the service account |
| auth.serviceAccount.create | bool | `false` | Specifies whether a ServiceAccount should be created |
| auth.serviceAccount.imagePullSecrets | list | `[]` | Image pull secrets for the service account |
| auth.serviceAccount.name | string | `nil` | The name of the ServiceAccount to use. If not set and create is true, a name is generated using the fullname template |
| commonLabels | object | `{}` | Labels to apply to all resources |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| image.pullPolicy | string | `"IfNotPresent"` | Docker image pull policy |
| image.repository | string | `"ghcr.io/kaskada-ai/kaskada/engine"` | Docker image repository |
| image.tag | string | `"latest"` | Overrides the image tag whose |
| imagePullSecrets | list | `[]` | Image pull secrets for Docker images |
| logging | object | `{"format":"json","level":"info"}` | Configures logging output for the pod. |
| logging.format | string | `"json"` | Either `json` or `console` |
| logging.level | string | `"info"` | Note that sensitive information may exist in logs if the `debug` level is used |
| nameOverride | string | `""` | Overrides the chart's name |
| namespace | string | `nil` | The name of the Namespace to deploy into. If not set, `.Release.Namespace` is used |
| nodeSelector | object | `{}` | Node selector for the pod |
| podAnnotations | object | `{}` | Annotations to add to the pod |
| podLabels | object | `{}` | Labels to add to the pod |
| resources.engine | object | `{}` | Resource requests and limits for the engine container |
| resources.manager | object | `{}` | Resource requests and limits for the manager container |
| service.annotations | object | `{}` | Annotations to add to the service |
| service.appProtocol | string | `""` | Adds the appProtocol field to the service. This allows to work with istio protocol selection. Ex: "http" or "tcp" |
| service.create | bool | `true` | Specifies whether a Service should be created |
| service.grpcPort | int | `50051` | The port for exposing the gRPC service |
| service.labels | object | `{}` | Labels to add to the service |
| service.restPort | int | `3365` | The port for exposing the REST service |
| service.type | string | `"ClusterIP"` | The type of service to create |
| storage.dbData | object | `{"storage":"1Gi","storageClassName":null}` | Configures the database storage for the kaskada service |
| storage.dbData.storage | string | `"1Gi"` | The size of the database volume |
| storage.dbData.storageClassName | string | `nil` | The type of storage used to provision the persisted database volume |
| storage.objectStore | object | `{"bucket":null,"local":{"storage":"100Gi","storageClassName":null},"path":"/data/","type":"local"}` | Configures the primary storage for the kaskada service |
| storage.objectStore.bucket | string | `nil` | The name of the bucket or container to use for storing data |
| storage.objectStore.local.storage | string | `"100Gi"` | The size of the data storage volume when using local storage. |
| storage.objectStore.local.storageClassName | string | `nil` | The type of storage used to provision the local data volume. |
| storage.objectStore.path | string | `"/data/"` | The bucket path prefix to use for storing data |
| storage.objectStore.type | string | `"local"` | If `s3`, configure authentication to s3 in the `auth` section below |
| storage.tmpData | object | `{"storage":"10Gi","storageClassName":null}` | Configures temporary storage for the kaskada service |
| storage.tmpData.storage | string | `"10Gi"` | The size of the temporary volume |
| storage.tmpData.storageClassName | string | `nil` | The type of storage used to provision the temporary volume |
| tolerations | list | `[]` | Tolerations for the pod |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
