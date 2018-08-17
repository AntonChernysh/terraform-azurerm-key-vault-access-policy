variable "access_policy_count" {}

variable "policy_object_list_map" {
  type = "string"
}

# variable "key_permissions" {
#   type = "list"

#   default = [
#     "get",
#     "list",
#   ]
# }

# variable "secret_permissions" {
#   type = "list"

#   default = [
#     "get",
#     "list",
#   ]
# }

# variable "certificate_permissions" {
#   type = "list"

#   default = [
#     "get",
#     "list",
#   ]
# }

variable "key_vault_name" {}
variable "key_vault_resource_group_name" {}
