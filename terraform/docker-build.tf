resource "null_resource" "docker_build_push" {

  provisioner "local-exec" {
    interpreter = ["PowerShell", "-Command"]

    command = <<EOT
aws ecr get-login-password --region ap-south-1 `
| docker login --username AWS --password-stdin 035466343132.dkr.ecr.ap-south-1.amazonaws.com

docker build -t hostname-version-app:latest ..

docker tag hostname-version-app:latest 035466343132.dkr.ecr.ap-south-1.amazonaws.com/hostname-version-app:1.0

docker push 035466343132.dkr.ecr.ap-south-1.amazonaws.com/hostname-version-app:1.0
EOT
  }

  depends_on = [
    aws_ecr_repository.app
  ]
}
