apiVersion: v1
baseDomain: "${basedomain}"
compute:
- architecture: ppc64le
  hyperthreading: Enabled
  name: worker
  platform: {}
  replicas: 3
controlPlane:
  architecture: ppc64le
  hyperthreading: Enabled
  name: master
  platform:
    powervs:
      processors: "0.5"
  replicas: 3
metadata:
  creationTimestamp: null
  name: "${cluster_name}"
networking:
  clusterNetwork:
  - cidr: 10.128.0.0/14
    hostPrefix: 23
  networkType: OVNKubernetes
  serviceNetwork:
  - 172.30.0.0/16
platform:
  powervs:
    userID: ${ibm_id}
    powervsResourceGroup: "${resource_group}"
    region: ${powervs_region}
    vpcName: rdr-ipi-mjturek-eu-de-vpc
    zone: ${powervs_zone}
publish: Internal
pullSecret: '${pull_secret}'
sshKey: |
  ${ssh_key}
