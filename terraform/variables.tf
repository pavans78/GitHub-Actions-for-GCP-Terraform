variable "main" {
  type = object({
    project = string
    region  = string
    zone    = string
    env     = string
  })
}

