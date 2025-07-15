variable "env" {}
variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}
variable "allowed_cidrs" {
  type = list(string)
}
