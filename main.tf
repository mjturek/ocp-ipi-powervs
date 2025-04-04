module "install-config" {
  source = "./modules/install-config"

  basedomain       = var.basedomain
  cluster_dir      = pathexpand("~/${var.cluster_dir}")
  cluster_name     = var.cluster_name
  ibm_id           = var.ibm_id
  resource_group   = var.resource_group
  powervs_region   = var.powervs_region
  powervs_zone     = var.powervs_zone
  pull_secret_file = var.pull_secret_file
  ssh_key          = var.ssh_key
  vpc_name         = var.vpc_name
}

module "manifests" {
  source = "./modules/manifests"
  api_key     = var.api_key
  cluster_dir = pathexpand("~/${var.cluster_dir}")
}
