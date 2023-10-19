locals {   
    network_security_group = {for network_security_group in var.network_security_group_list: network_security_group.name => network_security_group }
}