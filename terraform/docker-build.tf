resource "null_resource" "docker_build_push" {

  depends_on = [aws_ecr_repository.app]

  provisioner "local-exec" {
    command = <<EOT
aws ecr get-login-password --region ap-south-1 |
docker login --username AWS --password-stdin ${aws_ecr_repository.app.repository_url}

docker build -t ${var.app_name}:latest ..

docker tag ${var.app_name}:latest ${aws_ecr_repository.app.repository_url}:${var.image_tag}

docker push ${aws_ecr_repository.app.repository_url}:${var.image_tag}
EOT
  }
}

