variable "env" {}
variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}
variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "allowed_cidrs" {
  type = list(string)
}