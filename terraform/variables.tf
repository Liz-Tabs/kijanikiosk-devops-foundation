variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "staging"
}

variable "servers" {
  description = "List of application servers"

  type = map(object({
    name = string
    env  = string
  }))

  default = {
    api = {
      name = "api"
      env  = "prod"
    }

    payments = {
      name = "payments"
      env  = "prod"
    }

    logs = {
      name = "logs"
      env  = "prod"
    }
  }
}
