locals {
  services = {for val in var.services :
    "${val.name}-${lookup(val.meta,"record_type",var.record_type)}" => {
      "zone_name": "${lookup(val.meta,"zone_name",var.zone_name)}",
      "owner_name":"${lookup(val.meta,"owner_name",var.owner_name)}",
      "record_type":"${lookup(val.meta,"record_type",var.record_type)}",
      "record_data":"${val.address}",
      "ttl":"${lookup(val.meta,"ttl",var.ttl)}",
      "order":"${lookup(val.meta,"order",var.order)}",
      "description":"${lookup(val.meta,"description",var.description)}"
    }...
  }
}

resource "ultradns_rdpool" "rd_pool" {
  for_each = local.services
  zone_name = each.value.0.zone_name
  owner_name = each.value.0.owner_name
  record_type = each.value.0.record_type
  record_data = toset([for val in each.value : val.record_data])
  ttl = each.value.0.ttl
  order = each.value.0.order
  description = each.value.0.description
}
