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
%{ if powervs_workspace_guid != "" }
    serviceInstanceGUID: "${powervs_workspace_guid}"
%{ endif }
%{ if tg_name != "" }
    tgName: "${tg_name}"
%{ endif }
    region: ${powervs_region}
    vpcName: ${vpc_name}
    vpcRegion: ${vpc_region}
    zone: ${powervs_zone}
publish: External
pullSecret: '${pull_secret}'
sshKey: |
  ${ssh_key}
