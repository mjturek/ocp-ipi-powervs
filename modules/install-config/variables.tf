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

variable "remote_private_key" {
  type        = string
  description = "The location of the private key that will be used to deploy VM."
}

variable "powervs_region" {
  type        = string
  description = "The PowerVS region you want to deploy to."
}

variable "powervs_zone" {
  type        = string
  description = "The PowerVS zone you want to deploy to."
}

variable "pull_secret_file" {
  type        = string
  description = "The pull secret that will be used to pull openshift."
}

variable "ssh_key" {
  type        = string
  description = "The pull secret that will be used to pull openshift."
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC that you will be deploying from."
}
