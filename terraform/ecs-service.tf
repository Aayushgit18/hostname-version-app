# ---------- Service 01 ----------
resource "aws_ecs_service" "service_01" {
  name            = "hostname-service-01"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.task.arn
  desired_count   = 1
  launch_type     = "EC2"

  load_balancer {
    target_group_arn = aws_lb_target_group.tg.arn
    container_name   = "app"
    container_port   = 3000
  }

  network_configuration {
    subnets         = [aws_subnet.public_1.id, aws_subnet.public_2.id]
    security_groups = [aws_security_group.ecs_sg.id]
  }

  deployment_controller {
    type = "ECS"
  }

  enable_execute_command = true

  overrides = jsonencode({
    containerOverrides = [{
      name = "app"
      environment = [
        { name = "NODE_NUMBER", value = "01" },
        { name = "APP_VERSION", value = "1.0" }
      ]
    }]
  })
}

# ---------- Service 02 ----------
resource "aws_ecs_service" "service_02" {
  name            = "hostname-service-02"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.task.arn
  desired_count   = 1
  launch_type     = "EC2"

  load_balancer {
    target_group_arn = aws_lb_target_group.tg.arn
    container_name   = "app"
    container_port   = 3000
  }

  network_configuration {
    subnets         = [aws_subnet.public_1.id, aws_subnet.public_2.id]
    security_groups = [aws_security_group.ecs_sg.id]
  }

  enable_execute_command = true

  overrides = jsonencode({
    containerOverrides = [{
      name = "app"
      environment = [
        { name = "NODE_NUMBER", value = "02" },
        { name = "APP_VERSION", value = "2.0" }
      ]
    }]
  })
}

# ---------- Service 03 ----------
resource "aws_ecs_service" "service_03" {
  name            = "hostname-service-03"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.task.arn
  desired_count   = 1
  launch_type     = "EC2"

  load_balancer {
    target_group_arn = aws_lb_target_group.tg.arn
    container_name   = "app"
    container_port   = 3000
  }

  network_configuration {
    subnets         = [aws_subnet.public_1.id, aws_subnet.public_2.id]
    security_groups = [aws_security_group.ecs_sg.id]
  }

  enable_execute_command = true

  overrides = jsonencode({
    containerOverrides = [{
      name = "app"
      environment = [
        { name = "NODE_NUMBER", value = "03" },
        { name = "APP_VERSION", value = "3.0" }
      ]
    }]
  })
}
