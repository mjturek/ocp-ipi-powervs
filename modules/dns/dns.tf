data "ibm_resource_group" "resource_group" {
  name = var.resource_group
}

resource "ibm_resource_instance" "ibm_dns_instance" {
  name              = "${var.cluster_name}-dns"
  resource_group_id = data.ibm_resource_group.resource_group.id
  location          = "global"
  service           = "dns-svcs"
  plan              = "standard-dns"
}

resource "ibm_dns_zone" "dns_zone" {
  name        = "${var.basedomain}"
  instance_id = ibm_resource_instance.ibm_dns_instance.guid
  description = "IBM DNS instance created by deployable architecture for OpenShift IPI on Power Virtual Server"
  label       = "${var.cluster_name}"
}
