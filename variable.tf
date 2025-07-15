variable "region" {}
variable "profile" {}
variable "env" {}
variable "vpc_cidr" {}
variable "public_subnet_cidrs" {
  type = list(string)
}
variable "private_subnet_cidrs" {
  type = list(string)
}
variable "azs" {
  type = list(string)
}
variable "allowed_cidrs" {
  type = list(string)
}
variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "rds_instance_class" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
variable "container_definitions" {
  type = string
}
variable "s3_bucket" {}
variable "dynamodb_table" {}
