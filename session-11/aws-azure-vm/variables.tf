variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-west-1"
}

variable "aws_profile" {
  description = "Profile for AWS CLI"
  type        = string
  default     = "curso-terraform"
}

variable "aws_pub_key" {
  description = "Public key to access the AWS EC2 instance"
  type        = string
}

variable "azure_pub_key" {
  description = "Public key to access the Azure VM Instance"
  type        = string
}

variable "azure_region" {
  description = "The Azure region to deploy resources in"
  type        = string
  default     = "eastus"
}