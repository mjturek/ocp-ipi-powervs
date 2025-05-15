locals {
    date = formatdate("YYYY-MM-DD-hh-mm", timestamp())
}

resource "null_resource" "cluster" {
  triggers = {
    api_key       = "${var.api_key}"
    cluster_dir    = "${var.cluster_dir}"
    private_key = "${file("${var.remote_private_key}")}"
  }

  connection {
    type = "ssh"
    user = "root"
    host = "localhost"
    private_key = "${self.triggers.private_key}"
  }

  provisioner "remote-exec" {
    inline = [
      "IBMCLOUD_API_KEY=${self.triggers.api_key} openshift-install create cluster --dir=${self.triggers.cluster_dir} --log-level=debug",
    ]
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [
      "IBMCLOUD_API_KEY=${self.triggers.api_key} openshift-install destroy cluster --dir=${self.triggers.cluster_dir} --log-level=debug",
    ]
  }
}
