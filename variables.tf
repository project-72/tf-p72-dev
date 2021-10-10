
variable "project_name" {
  type        = map
  description = "Name of the project."
  default     = {
    dev  = "p72-dev"
    prod = "p72-prod"
  }
}

variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  type = string
  default = "UK South"
}

variable "env" {
  description = "env: dev or prod"
  type = string
  default = "dev"
}
