variable "ami_owner" {
  description = "Owner ID or name ('amazon') for AMI lookup"
  default     = "amazon"
}

variable "ami_name" {
  description = "Name pattern of the AMI"
  default     = "amzn2-ami-hvm-*-x86_64-gp2" # Update this if using Ubuntu, etc.
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "subnet_ids" {
  type = list(string)
  description = "List of subnet IDs"
}

variable "key_name" {
  description = "EC2 key pair name"
}

variable "instance_tags" {
  type        = map(string)
  description = "Tags for EC2 instance"
  default = {
    Name = "default-web"
  }
}
