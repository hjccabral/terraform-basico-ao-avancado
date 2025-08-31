variable "region_aws" {
  description = "Region of AWS"
  type        = string
}

variable "ports" {
  description = "List of ports to be opened in the security group"
  type = map(object({
    description = string
    cidr_blocks = list(string)
  }))
  default = {
    22 = {
      description = "SSH"
      cidr_blocks = ["100.100.100.100/32"]
    }
    80 = {
      description = "HTTP"
      cidr_blocks = ["0.0.0.0/0"]
    }
    443 = {
      description = "HTTPS"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}