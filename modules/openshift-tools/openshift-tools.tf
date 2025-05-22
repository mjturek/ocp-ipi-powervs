
locals {
  base_path   = "/tmp"
  base_url    = "https://mirror.openshift.com/pub/openshift-v4"
  tools       = {
    oc = {
      release_arch = "amd64",
      file         = "openshift-client-linux-${var.openshift_release}.tar.gz",
    },
    openshift-install = {
      release_arch = "ppc64le",
      file         = "openshift-install-linux-amd64-${var.openshift_release}.tar.gz",
    },
    ccoctl = {
      release_arch = "amd64",
      file         = "ccoctl-linux-${var.openshift_release}.tar.gz",
    }
  }
}

resource "null_resource" "install-tool" {
  for_each = local.tools
  connection {
    agent = "true"
    agent_identity = "root@bluemarine1.fyre.ibm.com"
    type  = "ssh"
    user  = "root"
    host  = "localhost"
  }
  provisioner "remote-exec" {
    inline = [
      "curl ${local.base_url}/${each.value.release_arch}/clients/ocp/${var.openshift_release}/${each.value.file} > ${local.base_path}/${each.value.file}",
      "tar xvf ${local.base_path}/${each.value.file} -C /usr/bin/ ${each.key}"
    ]
  }
}
