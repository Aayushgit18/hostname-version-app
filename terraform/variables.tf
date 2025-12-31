# ===============================
# APPLICATION VARIABLES
# ===============================

variable "app_name" {
  description = "Application name"
  type        = string
  default     = "hostname-version-app"
}

variable "image" {
  description = "Docker image URI stored in ECR"
  type        = string
  default     = "035466343132.dkr.ecr.ap-south-1.amazonaws.com/hostname-version-app:1.0"
}

variable "image_tag" {
  description = "Docker image tag"
  type        = string
  default     = "1.0"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}
