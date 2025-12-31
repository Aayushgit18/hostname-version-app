data "aws_ami" "ecs" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-*-x86_64-ebs"]
  }
}

resource "aws_launch_template" "ecs_lt" {
  name_prefix   = "ecs-lt-"
  image_id      = data.aws_ami.ecs.id
  instance_type = "t3.micro"

  iam_instance_profile {
    name = aws_iam_instance_profile.ecs_profile.name
  }

  user_data = base64encode(<<EOF2
#!/bin/bash
echo ECS_CLUSTER=hostname-cluster >> /etc/ecs/ecs.config
EOF2
  )

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.ecs_sg.id]
  }
}

resource "aws_autoscaling_group" "ecs_asg" {
  desired_capacity = 3
  max_size         = 3
  min_size         = 3

  vpc_zone_identifier = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]

  launch_template {
    id      = aws_launch_template.ecs_lt.id
    version = "$Latest"
  }
}
