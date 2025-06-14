variable "basedomain" {
  type        = string
  description = "The base domain name that will be used by the cluster. (ie: example.com) "
}

variable "cluster_dir" {
  type        = string
  description = "The directory that holds the artifacts of the cluster create."
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
}

variable "powervs_region" {
  type        = string
  description = "The PowerVS region you want to deploy to."
}

variable "powervs_zone" {
  type        = string
  description = "The PowerVS zone you want to deploy to."
}

variable "powervs_workspace_guid" {
  type        = string
  description = "The PowerVS workspace you want to use. Default will have the installer create one."
  default     = ""
}

variable "pull_secret_file" {
  type        = string
  description = "The pull secret that will be used to pull openshift."
}

variable "ssh_key" {
  type        = string
  description = "The pull secret that will be used to pull openshift."
}

variable "ssh_identity" {
  type        = string
  description = "Agent comment to prioritize when authenticating to remote host."
  default     = ""
}

variable "ssh_host" {
  type        = string
  description = "The public key that will be used to reach the cluster."
  default     = "localhost"
}

variable "ssh_user" {
  type        = string
  description = "The public key that will be used to reach the cluster."
  default     = "root"
}

variable "tg_name" {
  type        = string
  description = "The Transit Gateway you want to use. Default will have the installer create one."
  default     = ""
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC that you will be deploying from."
}

variable "vpc_region" {
  type        = string
  description = "Region where the VPC specified by vpc_name resides."
  default     = "us-south"
}
