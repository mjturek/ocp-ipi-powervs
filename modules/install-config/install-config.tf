resource "local_file" "install_config" {
  file_permission = "0640"
  content         = templatefile("${path.module}/templates/install-config.yaml.tpl",
                    {
                      basedomain : var.basedomain,
                      cluster_dir : var.cluster_dir,
                      cluster_name : var.cluster_name,
                      ibm_id : var.ibm_id,
                      resource_group : var.resource_group,
                      powervs_region : var.powervs_region,
                      powervs_zone : var.powervs_zone,
                      pull_secret : file(var.pull_secret_file),
                      powervs_workspace_guid: var.powervs_workspace_guid,
                      ssh_key : var.ssh_key,
                      tg_name: var.tg_name,
                      vpc_name: var.vpc_name,
                      vpc_region: var.vpc_region,
                    })
  filename        = "install-config.yaml"
}

resource "null_resource" "install_config" {
  connection {
    agent       = "true"
    agent_identity = "${var.ssh_identity}"
    type        = "ssh"
    user        = "${var.ssh_user}"
    host        = "${var.ssh_host}"
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir -p ${var.cluster_dir}"
    ]
  }

  provisioner "file" {
    source = "install-config.yaml"
    destination = "${var.cluster_dir}/install-config.yaml"
  }

  depends_on = [
    resource.local_file.install_config
  ]
}
