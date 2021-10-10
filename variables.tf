
variable "project_name" {
  type        = map
  description = "Name of the project."
  default     = {
    dev  = "p72-dev"
    prod = "p72-prod"
  }
}

variable "location" {
    description = "Azure region"

}

variable "env" {
  description = "env: dev or prod"
}
