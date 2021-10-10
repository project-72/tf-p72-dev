
variable "project_name" {
  type        = map
  description = "Name of the project."
  default     = {
    dev  = "p72dev"
    prod = "p72prod"
  }
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
