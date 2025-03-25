terraform {
  required_providers {
    ibm = {
      source  = "ibm-cloud/ibm"
      version = "~> 1.54.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.4"
    }
  }
  required_version = ">= 1.2.0"
}
