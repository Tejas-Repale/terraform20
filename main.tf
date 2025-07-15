module "vpc" {
  source                = "./modules/vpc"
  vpc_cidr              = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                   = var.azs
  env                   = var.env
}

module "alb" {
  source         = "./modules/alb"
  vpc_id         = module.vpc.vpc_id
  subnet_ids     = module.vpc.public_subnet_ids
  allowed_cidrs  = var.allowed_cidrs
  env            = var.env
}

module "ec2" {
  source         = "./modules/ec2"
  vpc_id         = module.vpc.vpc_id
  subnet_ids     = module.vpc.public_subnet_ids
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  key_name       = var.key_name
  allowed_cidrs  = var.allowed_cidrs
  env            = var.env
}

module "rds" {
  source         = "./modules/rds"
  vpc_id         = module.vpc.vpc_id
  subnet_ids     = module.vpc.private_subnet_ids
  instance_class = var.rds_instance_class
  db_name        = var.db_name
  db_username    = var.db_username
  db_password    = var.db_password
  allowed_cidrs  = var.allowed_cidrs
  env            = var.env
}

module "ecs" {
  source                = "./modules/ecs"
  vpc_id                = module.vpc.vpc_id
  subnet_ids            = module.vpc.private_subnet_ids
  allowed_cidrs         = var.allowed_cidrs
  container_definitions = var.container_definitions
  env                   = var.env
}