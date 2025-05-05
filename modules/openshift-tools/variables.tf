variable "openshift_release" {
  type        = string
  description = "The openshift release (ie: 4.18.5) to be used."
}

variable "remote_private_key" {
  type        = string
  description = "The location of the private key that will be used to deploy VM."
}
