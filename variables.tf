variable "services" {
  description = "Consul services monitored by Consul Terraform Sync"
  type = map(
    object({
      id        = string
      name      = string
      address   = string
      port      = number
      meta      = map(string)
      tags      = list(string)
      namespace = string
      status    = string

      node                  = string
      node_id               = string
      node_address          = string
      node_datacenter       = string
      node_tagged_addresses = map(string)
      node_meta             = map(string)
    })
  )
}

variable "ultradns_username" {
  description = "UltraDNS username"
  type        = string
}

variable "ultradns_password" {
  description = "UltraDNS password"
  type        = string
  sensitive   = true
}

variable "ultradns_host_url" {
  description = "UltraDNS hosturl"
  type        = string
}

variable "zone_name" {
  description = "Name of the zone."
  type = string
}

variable "owner_name" {
  description = "The domain name of the owner of the RRSet."
  type = string
}

variable "record_type" {
  description = "Record type of the RRSet.Supported values are: A,AAAA,1,28. Defaults to A"
  type = string
  default = "A"
}

variable "record_data" {
  description = "The data for the record."
  type = list
  default = []
}

variable "ttl" {
  description = "The time to live (in seconds) for the record."
  type = number
  default = 120
}
