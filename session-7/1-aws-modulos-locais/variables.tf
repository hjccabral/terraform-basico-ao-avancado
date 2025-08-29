variable "region_aws" {
  description = "Region of AWS"
  type        = string
}

variable "cidr_vpc" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "cidr_subnet" {
  description = "CIDR block for the Subnet"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string

}