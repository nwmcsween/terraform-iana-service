variable "service" {
  description = "The service name to look up. e.g. 'http'"
  type        = string
  default     = null
}

variable "port" {
  description = "The port number to look up. e.g. 80"
  type        = number
  default     = null
}
