<a href="https://terraform.io">
    <img src=".github/terraform_logo.svg" alt="Terraform logo" title="Terraform" align="right" height="50" />
</a>

# UltraDNS Consul-Terraform-Sync module

## Dependencies

- [Terraform](https://www.terraform.io/downloads.html)
- [Consul](https://www.consul.io/docs/install)
- [Consul-Terraform-Sync](https://www.consul.io/docs/nia/installation/install)
- [UltraDNS Provider](https://registry.terraform.io/providers/ultradns/ultradns/latest/docs)

## Usage

### Using Consul client meta

Sample service block of Consul client HCL config:

```hcl
# Service Block
service {
  name = "client"
  id = "client-host-1"
  meta = {
    zone_name = "zone.com"
    owner_name = "www"
    record_type = "A"
    ttl = "120"
  }
}
```

### Using CTS task

Sample task block of CTS HCL config:

```hcl
# Task Block
task {
    name        = "sample_task"
    module      = "ultradns/cts/ultradns"
    variable_files = ["/var/lib/consul/terraform.tfvars"]
    condition "services" {
        names = ["client"]
    }
}
```

Sample terraform.tfvars file for a CTS task:

```terraform
ultradns_username="username"
ultradns_password="password"
ultradns_host_url="https://api.ultradns.com/"

zone_name="zone.com"
owner_name="www"
record_type="A"
ttl=120
```

## Requirements

| Name                                                                   | Version   |
| ---------------------------------------------------------------------- | --------- |
| [Terraform](https://developer.hashicorp.com/terraform/downloads)       | >= 0.13.1 |

## Providers

| Name                                                                              | Version   |
| --------------------------------------------------------------------------------- | --------- |
| [UltraDNS](https://registry.terraform.io/providers/ultradns/ultradns/latest/docs) | >= 1.6.1  |

## Modules

No modules.

## Resources

| Name                                                                                                                          	| Type     |
| --------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [ultradns_record.A/ultradns_record.AAAA](https://registry.terraform.io/providers/ultradns/ultradns/latest/docs/resources/record)  | resource |

## Inputs

| Name                                                                                 | Description                             | Type                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | Default | Required |
| ------------------------------------------------------------------------------------ | --------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | :------: |
| [ultradns_username](#)		| UltraDNS username 															| `string` 		| n/a 	|   yes    |
| [ultradns_password](#)  		| UltraDNS password 															| `string` 		| n/a   |   yes    |
| [ultradns_host_url](#) 		| UltraDNS hosturl 																| `string` 		| n/a   |   yes    |
| [zone_name](#) 				| Name of the zone. 															| `string` 		| n/a   |   yes    |
| [owner_name](#) 				| The domain name of the owner of the RRSet. 									| `string` 		| n/a   |   yes    |
| [record_type](#)  			| Record type of the RRSet.Supported values are: A,AAAA,1,28.				 	| `string` 		| A		|   no     |
| [record_data](#)				| The data for the record. 														| `list(string)`| n/a   |   yes    |
| [ttl](#) 						| The time to live (in seconds) for the record.	 								| `number` 		| 120   |   no     |
| [services](#) 				| Consul services monitored by Consul Terraform Sync 							| <pre>map(<br>    object({<br>      id        = string<br>      name      = string<br>      address   = string<br>      port      = number<br>      meta      = map(string)<br>      tags      = list(string)<br>      namespace = string<br>      status    = string<br><br>      node                  = string<br>      node_id               = string<br>      node_address          = string<br>      node_datacenter       = string<br>      node_tagged_addresses = map(string)<br>      node_meta             = map(string)<br>    })<br>  )</pre> | n/a | yes |


## Outputs

| Name                                                                                 | Description                             | Type                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| ------------------------------------------------------------------------------------ | --------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [services](#)		| Services record details | <pre>map(<br>    object({<br>      id          = string<br>      owner_name  = string<br>      zone_name   = string<br>      ttl         = number<br>      record_type = string<br>      record_data = list(string)<br>    })<br>  )</pre> |
