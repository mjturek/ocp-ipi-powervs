module "install-config" {
  source = "./modules/install-config"

  basedomain     = var.basedomain
  cluster_dir    = pathexpand("~/${var.cluster_dir}")
  cluster_name   = var.cluster_name
  ibm_id         = var.ibm_id
  resource_group = var.resource_group
  powervs_region = var.powervs_region
  powervs_zone   = var.powervs_zone
  pull_secret    = var.pull_secret
  ssh_key        = var.ssh_key
}
