locals {
    date = formatdate("YYYY-MM-DD-hh-mm", timestamp())
}

resource "null_resource" "service_accounts" {
  triggers = {
    account_name  = "${var.cluster_name}-${local.date}"
    api_key       = "${var.api_key}"
    output_dir    = "${var.cluster_dir}"
    cluster_name  = "${var.cluster_name}"
    requests_dir  = "${var.cluster_dir}/credreqs"
    release_image = "quay.io/openshift-release-dev/ocp-release:${var.openshift_release}-multi"
    resource_group = "${var.resource_group}"
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
      "oc adm release extract --cloud=powervs --credentials-requests ${self.triggers.release_image} --to=${self.triggers.requests_dir}",
      "IBMCLOUD_API_KEY=${self.triggers.api_key} ccoctl ibmcloud create-service-id --credentials-requests-dir ${self.triggers.requests_dir} --name ${self.triggers.account_name} --output-dir ${self.triggers.output_dir} --resource-group-name ${self.triggers.resource_group}",
    ]
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [
      "IBMCLOUD_API_KEY=${self.triggers.api_key} ccoctl ibmcloud delete-service-id --credentials-requests-dir ${self.triggers.requests_dir} --name ${self.triggers.account_name}",
    ]
  }
}
