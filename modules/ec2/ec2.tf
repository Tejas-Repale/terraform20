# Get latest Amazon Linux 2 AMI (example)
data "aws_ami" "latest" {
  most_recent = true
  owners      = [var.ami_owner] # "amazon"

  filter {
    name   = "name"
    values = [var.ami_name]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.latest.id
  instance_type          = var.instance_type
  subnet_id              = element(var.subnet_ids, 0)
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = var.key_name
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name

  tags = var.instance_tags
}

