variable "env" {}
variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}
variable "allowed_cidrs" {
  type = list(string)
}
variable "container_definitions" {
  type = string
}
