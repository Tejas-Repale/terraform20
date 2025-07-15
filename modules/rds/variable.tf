variable "env" {}
variable "instance_class" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}
variable "allowed_cidrs" {
  type = list(string)
}