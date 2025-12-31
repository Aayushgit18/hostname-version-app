resource "aws_ecs_task_definition" "task" {
  family                   = "hostname-task"
  requires_compatibilities = ["EC2"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn

  container_definitions = jsonencode([{
    name      = "app"
    image     = var.image
    essential = true

    portMappings = [{
      containerPort = 3000
      hostPort      = 3000
    }]
  }])
}
