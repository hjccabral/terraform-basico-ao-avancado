variable "region_aws" {
  description = "Region of AWS"
  type        = string
}

variable "region_azure" {
  description = "Region of Azure"
  type        = string
}

variable "resource_group_azure" {
  description = "Resource Group - Azure"
  type        = string
}

variable "storage_account_azure" {
  description = "Storage Account - Azure"
  type        = string
}

variable "storage_container_azure" {
  description = "Storage Container - Azure"
  type        = string
}

variable "account_tier_azure" {
  description = "Account tier - Azure"
  type        = string
}

variable "account_replication_type" {
  description = "Account Replication Type"
  type        = string
}