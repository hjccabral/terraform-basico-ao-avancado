variable "location" {
  description = "Variable for Region location of Azure"
  type        = map(string)
  default = {
    "eua"    = "eastus",
    "europe" = "westeurope",
    "asia"   = "southeastasia",
    "brasil" = "brazilsouth"
  }
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