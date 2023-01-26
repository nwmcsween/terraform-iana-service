terraform {
  required_providers {
    http = {
      source  = "hashicorp/http"
      version = "~> 3"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2"
    }
  }
}

provider "http" {}
provider "local" {}
