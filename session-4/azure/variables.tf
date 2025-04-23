variable "location" {
  description = "Variable for Region location of Azure"
  type        = string
  default     = "East US"
}

variable "account_tier" {
  description = "Tier for Storage account Azure"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Application type of storage account"
  type        = string
  default     = "LRS"
}

variable "hjcc_resource_group_name" {
    description = "Name of resource group"
    type = string
}

variable "hjcc_storage_account_name" {
    description = "Name of storage account"
    type = string
    default = "hjccstorageaccount"
}

variable "hjcc_storage_container" {
    description = "Name of storage container"
    type = string
    default = "hjcc-storage-container"
  
}