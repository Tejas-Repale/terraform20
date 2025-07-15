output "vpc_id" {
  value = module.vpc.vpc_id
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "ec2_public_ip" {
  value = module.ec2.ec2_public_ip
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "ecs_cluster_id" {
  value = module.ecs.ecs_cluster_id
}
