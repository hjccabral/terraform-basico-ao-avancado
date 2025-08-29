variable "region_azure" {
  description = "Region of Azure"
  type        = string
}

variable "resource_group_azure" {
  description = "Resource Group - Azure"
  type        = string
}

variable "vnet_name" {
  description = "VNet Name"
  type        = string

}

variable "subnet_names" {
  description = "Subnet Names"
  type        = list(string)

}

variable "environment" {
  description = "Environment"
  type        = string

}