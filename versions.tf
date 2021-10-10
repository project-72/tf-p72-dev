terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.80.0"    }

    random = {
      source  = "hashicorp/random"
      version = "3.0.0"
    }
    backend "remote" {
      organization = "project72"

      workspaces {
        name = "tf-p72-dev"
      }
    }

  }

  required_version = ">= 0.14.0"
}
