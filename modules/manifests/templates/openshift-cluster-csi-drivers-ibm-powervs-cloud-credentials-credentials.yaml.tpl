apiVersion: v1
kind: Secret
metadata:
  creationTimestamp: null
  name: ibm-powervs-cloud-credentials
  namespace: openshift-cluster-csi-drivers
stringData:
  ibm-credentials.env: |-
    IBMCLOUD_AUTHTYPE=iam
    IBMCLOUD_APIKEY=${api_key}
  ibmcloud_api_key: ${api_key}
type: Opaque
