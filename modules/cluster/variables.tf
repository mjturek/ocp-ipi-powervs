variable "api_key" {
  type        = string
  description = "The API key with privledges to make all resouces used by an IPI cluster."
}

variable "cluster_dir" {
  type        = string
  description = "The directory that holds the artifacts of the cluster create."
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
