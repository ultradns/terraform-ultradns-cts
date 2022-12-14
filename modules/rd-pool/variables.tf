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
  description = "Zone name of the RD pool."
  type = string
}

variable "owner_name" {
  description = "The domain name of the owner of the RRSet."
  type = string
}

variable "record_type" {
  description = "Record type of the RD pool.Supported values are: A,AAAA,1,28. Defaults to A."
  type = string
  default = "A"
}

variable "record_data" {
  description = "Record data of the RD pool."
  type = list
  default = []
}

variable "order" {
  description = "Indicates the order of the records returned by the resolver for the RD pool. Supported values are: FIXED, RANDOM, ROUND_ROBIN. Defaults to ROUND_ROBIN."
  type = string
  default = "ROUND_ROBIN"
}

variable "ttl" {
  description = "The time to live (in seconds) for the pool."
  type = number
  default = 120
}

variable "description" {
  description = "Description for RD pool data."
  type = string
  default = "RD pool created or updated by consul cts."
}
