resource "local_file" "manifest" {
  for_each = fileset("${path.module}/templates/", "*")
  content  = templatefile("${path.module}/templates/${each.value}",
             {
               api_key: var.api_key
             })
  filename = trimsuffix("${var.cluster_dir}/manifests/${each.value}", ".tpl")
}
