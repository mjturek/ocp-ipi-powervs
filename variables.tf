variable "basedomain" {
  type        = string
  description = "The base domain name that will be used by the cluster. (ie: example.com) "
}

variable "cluster_dir" {
  type        = string
  description = "The name of the cluster."
  default     = "ocp-powervs-deploy"
}

variable "cluster_name" {
  type        = string
  description = "The name of the cluster."
}

variable "ibm_id" {
  type        = string
  description = "The email of the IBM Cloud user deploying the cluster."
}

variable "resource_group" {
  type        = string
  description = "The IBM Cloud resource group name that will hold the created resources."
  default     = "Default"
}

variable "powervs_region" {
  type        = string
  description = "The PowerVS region you want to deploy to."
  default     = "dal"
}

variable "powervs_zone" {
  type        = string
  description = "The PowerVS zone you want to deploy to."
  default     = "dal10"
}

variable "pull_secret" {
  type        = string
  description = "The pull secret that will be used to pull openshift."
}

variable "ssh_key" {
  type        = string
  description = "The public key that will be used to reach the cluster."
}

variable "api_key" {
  type        = string
  description = "The IBM Cloud API key used to deploy the cluster."
}
