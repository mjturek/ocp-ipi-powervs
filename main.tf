provider "ibm" {
  ibmcloud_api_key = var.api_key
  region           = var.vpc_region
  zone             = var.vpc_zone
}

locals {
  cluster_dir = pathexpand("${var.cluster_dir}")
}

module "dns" {
  source = "./modules/dns"
  basedomain     = var.basedomain
  cluster_name   = var.cluster_name
  resource_group = var.resource_group
}

module "install-config" {
  source = "./modules/install-config"

  basedomain         = var.basedomain
  cluster_dir        = local.cluster_dir
  cluster_name       = var.cluster_name
  ibm_id             = var.ibm_id
  powervs_region     = var.powervs_region
  powervs_zone       = var.powervs_zone
  pull_secret_file   = var.pull_secret_file
  resource_group     = var.resource_group
  remote_private_key = var.remote_private_key
  ssh_key            = var.ssh_key
  vpc_name           = var.vpc_name
}

module "openshift-tools" {
  source = "./modules/openshift-tools"

  openshift_release  = var.openshift_release
  remote_private_key = var.remote_private_key
}

module "manifests" {
  source = "./modules/manifests"
  api_key     = var.api_key
  cluster_dir = local.cluster_dir
  cluster_name   = var.cluster_name
  openshift_release  = var.openshift_release
  remote_private_key = var.remote_private_key
  resource_group = var.resource_group

  depends_on = [
    module.openshift-tools,
    module.install-config
  ]
}

resource "null_resource" "create-cluster" {
  provisioner "local-exec" {
    environment = {
      IBMCLOUD_API_KEY = var.api_key
    }
    command = "openshift-install create cluster --dir=${local.cluster_dir} --log-level=debug"
  }

  depends_on = [
    module.dns,
    module.install-config,
    module.openshift-tools,
    module.manifests
  ]
}
