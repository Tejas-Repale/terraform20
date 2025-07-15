resource "aws_security_group" "ec2_sg" {
  name        = "${var.env}-ec2-sg"
  description = "Allow EC2 access"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ec2_ingress_rules
    content {
      description = lookup(ingress.value, "description", null)
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.ec2_egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = var.ec2_sg_tags
}