check "nsg_rules" {
  data "azurerm_network_security_group" "rules" {
    name                = azurerm_network_security_group.security_group.name
    resource_group_name = var.resource_group_azure
  }

  assert {
    condition     = sort([for rule in data.azurerm_network_security_group.rules.security_rule : rule.destination_port_range]) == sort(local.nsg_ports)
    error_message = "Existem regras de NSG diferentes do arquivo do terraform!"
  }
}