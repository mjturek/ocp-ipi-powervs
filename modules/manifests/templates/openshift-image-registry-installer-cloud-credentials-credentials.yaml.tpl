apiVersion: v1
kind: Secret
metadata:
  creationTimestamp: null
  name: installer-cloud-credentials
  namespace: openshift-image-registry
stringData:
  ibm-credentials.env: |-
    IBMCLOUD_AUTHTYPE=iam
    IBMCLOUD_APIKEY=${api_key}
  ibmcloud_api_key: ${api_key}
type: Opaque
