/**
 * # terraform-iana-service
 *
 * This module provides the service name or service port output according to [IANA service-names-port-numbers](https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml) csv file.
 *
 */

locals {
  port_info    = var.port != null ? jsondecode(file("${path.module}/data/port_to_service.json"))[var.port] : null
  service_info = var.service != null ? jsondecode(file("${path.module}/data/service_to_port.json"))[var.service] : null
}
