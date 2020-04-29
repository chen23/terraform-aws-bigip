# output "bigip_private_eni" {
#   description = "Export of BIG-IP ENI information"
#   value = [
#     for id, nic in local.
#     private_network_interfaces :
#     aws_network_interface.bigip[id]
#   ]
# }

output "private_nic_enis" {
  description = "List of BIG-IP public network interface"
  value = [
    for id, nic in local.public_network_interfaces :
    id
#    aws_network_interface.bigip[id]
  ]
}
output "instances" {
  description = "dump local"
  value = [ for id in range(length(var.bigip_map)):
   aws_instance.f5_bigip[id]
  ]
}

output "enis" {
  description = "dump local"
  value = [ for nic in local.network_subnets :
  nic
#   aws_network_interface.bigip[nic.id]
#   aws_instance.f5_bigip[id].network_interface
  ]
}

