terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 2.14"
    }
  }
  required_version = "~> 0.13"
}
