locals {
  normalized = [
    for o in csvdecode(data.http.main.response_body) : {
      name = lower(o["Service Name"])
      port = tonumber(o["Port Number"])
      tcp  = lower(o["Transport Protocol"]) == "tcp"
      udp  = lower(o["Transport Protocol"]) == "udp"
    } if lower(o["Description"]) != "reserved" && lower(o["Description"]) != "unassigned"
    && length(regexall(".*(being|been) removed on.*", lower(o["Assignment Notes"]))) == 0
    && length(regexall("^This is a duplicate.*", lower(o["Assignment Notes"]))) == 0
    && length(o["Service Name"]) > 0 && can(tonumber(o["Port Number"]))
  ]
  service_to_port = {
    for k, v in { for o in local.normalized : o.name => o... } : k => {
      port = v.0.port
      tcp  = anytrue(v.*.tcp)
      udp  = anytrue(v.*.udp)
    }
  }
  port_to_service = {
    for k, v in { for o in local.normalized : o.port => o... } : k => {
      name = v.0.name
      tcp  = anytrue(v.*.tcp)
      udp  = anytrue(v.*.udp)
    }
  }
}

data "http" "main" {
  url = "https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.csv"

  request_headers = {
    Accept = "text/csv"
  }
}

resource "local_file" "services" {
  content  = jsonencode(local.service_to_port)
  filename = "${var.output_directory}/service_to_port.json"
}

resource "local_file" "ports" {
  content  = jsonencode(local.port_to_service)
  filename = "${var.output_directory}/port_to_service.json"
}
