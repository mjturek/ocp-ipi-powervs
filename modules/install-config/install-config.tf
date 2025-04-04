resource "local_file" "install-config" {
  content  = templatefile("${path.module}/templates/install-config.yaml.tpl",
             {
               basedomain : var.basedomain,
               cluster_dir : var.cluster_dir,
               cluster_name : var.cluster_name,
               ibm_id : var.ibm_id,
               resource_group : var.resource_group,
               powervs_region : var.powervs_region,
               powervs_zone : var.powervs_zone,
               pull_secret : var.pull_secret,
               ssh_key : var.ssh_key,
               vpc_name: var.vpc_name,
             })
  filename = "${var.cluster_dir}/install-config.yaml"
}
