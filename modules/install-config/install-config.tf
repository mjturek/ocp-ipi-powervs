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
                      ssh_key : var.ssh_key,
                      vpc_name: var.vpc_name,
                    })
  filename        = "install-config.yaml"
}

resource "null_resource" "install_config" {
  connection {
    agent       = "false"
    type        = "ssh"
    user        = "root"
    host        = "localhost"
    private_key = "${file("${var.remote_private_key}")}"
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
