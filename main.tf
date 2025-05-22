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
  ssh_key            = var.ssh_key
  ssh_host           = var.ssh_host
  ssh_identity       = var.ssh_identity
  ssh_user           = var.ssh_user
  vpc_name           = var.vpc_name
  vpc_region         = var.vpc_region
}

module "openshift-tools" {
  source = "./modules/openshift-tools"

  openshift_release  = var.openshift_release
  ssh_host           = var.ssh_host
  ssh_identity       = var.ssh_identity
  ssh_user           = var.ssh_user
}

module "manifests" {
  source = "./modules/manifests"
  api_key     = var.api_key
  cluster_dir = local.cluster_dir
  cluster_name   = var.cluster_name
  openshift_release  = var.openshift_release
  resource_group = var.resource_group
  ssh_host           = var.ssh_host
  ssh_identity       = var.ssh_identity
  ssh_user           = var.ssh_user

  depends_on = [
    module.openshift-tools,
    module.install-config
  ]
}

module "cluster" {
  source = "./modules/cluster"

  api_key            = var.api_key
  cluster_dir        = local.cluster_dir
  ssh_host           = var.ssh_host
  ssh_identity       = var.ssh_identity
  ssh_user           = var.ssh_user
  depends_on = [
    module.dns,
    module.install-config,
    module.openshift-tools,
    module.manifests
  ]
}
