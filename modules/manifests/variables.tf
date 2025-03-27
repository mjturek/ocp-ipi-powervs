variable "api_key" {
  type        = string
  description = "The API key with privledges to make all resouces used by an IPI cluster."
}

variable "cluster_dir" {
  type        = string
  description = "The directory that holds the artifacts of the cluster create."
}
