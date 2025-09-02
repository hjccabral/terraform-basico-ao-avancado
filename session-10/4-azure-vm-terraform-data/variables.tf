variable "region_azure" {
  description = "Region of Azure"
  type        = string
}

variable "resource_group_azure" {
  description = "Resource Group - Azure"
  type        = string
}

variable "infra_version" {
  description = "Infrastructure Version"
  type        = number
  default     = 2
}