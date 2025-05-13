variable "api_key" {
  type        = string
  description = "The API key with privledges to make all resouces used by an IPI cluster."
}

variable "cluster_dir" {
  type        = string
  description = "The directory that holds the artifacts of the cluster create."
}

variable "openshift_release" {
  type        = string
  description = "The openshift release (ie: 4.18.5) to be used."
}

variable "cluster_name" {
  type        = string
  description = "The name of the cluster."
}

variable "resource_group" {
  type        = string
  description = "The IBM Cloud resource group name that will hold the created resources."
}

variable "remote_private_key" {
  type        = string
  description = "The location of the private key that will be used to deploy VM."
}
