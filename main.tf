locals {
  services = {for key, val in var.services :
    key => {
      "zone_name": "${lookup(val.meta,"zone_name",var.zone_name)}",
      "owner_name":"${lookup(val.meta,"owner_name",var.owner_name)}",
      "record_type":"${lookup(val.meta,"record_type",var.record_type)}",
      "record_data": ["${val.address}"],
      "ttl":"${lookup(val.meta,"ttl",var.ttl)}"
    }
  }
}

resource "ultradns_record" "record" {
  for_each = local.services
  zone_name = each.value.zone_name
  owner_name = each.value.owner_name
  record_type = each.value.record_type
  record_data = each.value.record_data
  ttl = each.value.ttl
}