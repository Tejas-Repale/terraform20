resource "aws_ecs_cluster" "main" {
  name = "${var.env}-ecs-cluster"
}

resource "aws_ecs_service" "main" {
  name            = "${var.env}-ecs-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = 2
  launch_type     = "EC2"
  network_configuration {
    subnets          = var.subnet_ids
    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = false
  }
  depends_on = [aws_iam_role.ecs_service]
}

resource "aws_ecs_task_definition" "app" {
  family                   = "${var.env}-task"
  requires_compatibilities = ["EC2"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_execution.arn
  container_definitions    = var.container_definitions
}