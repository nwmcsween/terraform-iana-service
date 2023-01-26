module "impl" {
  source = "../"

  service = "http"
  port    = 80
}

output "service" {
  value = module.impl.service
}

output "port" {
  value = module.impl.port
}
