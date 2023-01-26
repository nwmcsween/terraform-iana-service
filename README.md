# terraform-iana-service

This module provides the service name or service port output according to [IANA service-names-port-numbers](https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml) csv file.

## Example

```hcl
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
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_port"></a> [port](#input\_port) | The port number to look up. e.g. 80 | `number` | `null` | no |
| <a name="input_service"></a> [service](#input\_service) | The service name to look up. e.g. 'http' | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_port"></a> [port](#output\_port) | n/a |
| <a name="output_service"></a> [service](#output\_service) | n/a |
