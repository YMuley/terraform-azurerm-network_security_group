

# --------- NetworkSecurityGroup ------------
resource "azurerm_network_security_group" "network_security_group" {
    for_each            = local.network_security_group
    name                = each.value.name
    resource_group_name = var.resource_group_output[each.value.resource_group_name].name
    location            = each.value.location == null ? var.default_values.location : each.value.location
    tags                = each.value.tags == null ? var.default_values.tags : each.value.tags

    dynamic "security_rule" {
        for_each = each.value.security_rule
        content {
            name                       = security_rule.value.name
            priority                   = security_rule.value.priority
            direction                  = security_rule.value.direction
            access                     = security_rule.value.access
            protocol                   = security_rule.value.protocol
            source_port_range          = security_rule.value.source_port_range
            destination_port_range     = security_rule.value.destination_port_range
            source_address_prefix      = security_rule.value.source_address_prefix
            destination_address_prefix = security_rule.value.destination_address_prefix
        }    
    }
}