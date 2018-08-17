# terraform-azurerm-app-service-key-vault-access-policy
Terraform module designed to add key vault access policy from list of Object Ids

## Usage

### Sample
Include this repository as a module in your existing terraform code:

```hcl
data "azurerm_key_vault" "test" {
  name                = "mykeyvault"
  resource_group_name = "some-resource-group"
}

# Add KeyVault Policies from a list of Object_Ids
module "eg_key_vault_access_policies" {
  source     = "git::https://github.com/transactiveltd/terraform-azurerm-key-vault-access-policy.git?ref=master"

  access_policy_count = 2

  object_id              = ["00000000-0000-0000-0000-000000000000","00000000-0000-0000-0000-000000000001"]
  key_permissions         = ["get","list"]
  secret_permissions      = ["get","list"]
  certificate_permissions = ["get","list"]

  key_vault_name   = "${data.azurerm_key_vault.test.name}"
  key_vault_resource_group_name = "${data.azurerm_key_vault.test.resource_group_name}"
}
```

This will create Key Vault access policies for the number of object ids provided.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| access_policy_count | Count, must equal the length of `policy_object_list_map` | number | - | yes |
| policy_object_list_map | list of maps:<br> - `object_id`,`key_permissions`,`secret_permissions`,`certificate_permissions`  permissions csv strings | list <map>  | - | yes |
| key_vault_name | Key Vault name| string | - | yes |
| key_vault_resource_group_name | Key Vault Resource Group name, e.g. `testing-service-rg` | string | - | yes |
