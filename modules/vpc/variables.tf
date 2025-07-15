variable "vpc_cidr" {
  description = " CIDR for the VPC."
  type        = string
}

variable "availability_zones" {
  description = "A list of AZ'S the subnets."
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "A list of CIDR the public subnets."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "A list of CIDR blocks the private subnets."
  type        = list(string)
}