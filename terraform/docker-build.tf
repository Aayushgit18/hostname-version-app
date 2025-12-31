resource "null_resource" "docker_build_push" {

  provisioner "local-exec" {
    interpreter = ["PowerShell", "-Command"]

    command = <<EOT
aws ecr get-login-password --region ap-south-1 `
| docker login --username AWS --password-stdin 035466343132.dkr.ecr.ap-south-1.amazonaws.com

docker build -t ${var.app_name}:latest ..

docker tag ${var.app_name}:latest ${aws_ecr_repository.app.repository_url}:${var.image_tag}

docker push ${aws_ecr_repository.app.repository_url}:${var.image_tag}
EOT
  }

  depends_on = [
    aws_ecr_repository.app
  ]
}
