variable "project_id" {
  description = "devops-challenge-344619"
  type        = string
}

variable "name" {
  description = "nttdata"
  type        = string
}

variable "image" {
  description = "gcr.io/devops-challenge-344619/nttdata-service"
  default     = "gcr.io/devops-challenge-344619/nttdata-service"
}
