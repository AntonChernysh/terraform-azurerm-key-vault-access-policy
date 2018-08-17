data "azurerm_client_config" "default" {}

data "azurerm_resource_group" "default" {
  name = "${var.key_vault_resource_group_name}"
}

data "azurerm_key_vault" "default" {
  name                = "${var.key_vault_name}"
  resource_group_name = "${data.azurerm_resource_group.default.name}"
}

resource "azurerm_key_vault_access_policy" "default" {
  count               = "${var.access_policy_count}"
  vault_name          = "${data.azurerm_key_vault.default.name}"
  resource_group_name = "${data.azurerm_key_vault.default.resource_group_name}"

  tenant_id = "${data.azurerm_client_config.default.tenant_id}"
  object_id = "${lookup(var.policy_object_list_map[count.index],"object_id")}"

  key_permissions         = "${split(",",lookup(var.policy_object_list_map[count.index],"key_permissions"))}"
  secret_permissions      = "${split(",",lookup(var.policy_object_list_map[count.index],"secret_permissions"))}"
  certificate_permissions = "${split(",",lookup(var.policy_object_list_map[count.index],"certificate_permissions"))}"
}
