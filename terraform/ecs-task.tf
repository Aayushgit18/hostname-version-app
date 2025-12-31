resource "aws_ecs_task_definition" "task_01" {
  family                   = "hostname-task-01"
  requires_compatibilities = ["EC2"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"

  execution_role_arn = aws_iam_role.ecs_task_execution.arn
  task_role_arn      = aws_iam_role.ecs_task_role.arn   # ✅ REQUIRED

  container_definitions = jsonencode([{
    name  = "app"
    image = var.image

    environment = [
      { name = "NODE_NUMBER", value = "01" },
      { name = "APP_VERSION", value = "1.0" }
    ]

    portMappings = [{
      containerPort = 3000
      hostPort      = 3000
    }]
  }])
}

resource "aws_ecs_task_definition" "task_02" {
  family                   = "hostname-task-02"
  requires_compatibilities = ["EC2"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"

  execution_role_arn = aws_iam_role.ecs_task_execution.arn
  task_role_arn      = aws_iam_role.ecs_task_role.arn

  container_definitions = jsonencode([{
    name  = "app"
    image = var.image

    environment = [
      { name = "NODE_NUMBER", value = "02" },
      { name = "APP_VERSION", value = "2.0" }
    ]

    portMappings = [{
      containerPort = 3000
      hostPort      = 3000
    }]
  }])
}

resource "aws_ecs_task_definition" "task_03" {
  family                   = "hostname-task-03"
  requires_compatibilities = ["EC2"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"

  execution_role_arn = aws_iam_role.ecs_task_execution.arn
  task_role_arn      = aws_iam_role.ecs_task_role.arn

  container_definitions = jsonencode([{
    name  = "app"
    image = var.image

    environment = [
      { name = "NODE_NUMBER", value = "03" },
      { name = "APP_VERSION", value = "3.0" }
    ]

    portMappings = [{
      containerPort = 3000
      hostPort      = 3000
    }]
  }])
}

