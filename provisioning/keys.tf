resource "vault_transit_secret_backend_key" "key" {
  backend = vault_mount.transit.path
  name    = "my_key"

  allow_plaintext_backup = true
  deletion_allowed       = true
  derived                = false
  exportable             = true
}

resource "vault_generic_endpoint" "my_backup_key" {
  path                 = format("%s/%s/%s", vault_mount.transit.path, "restore", "my_backup_key")
  ignore_absent_fields = true
  disable_read         = true
  disable_delete       = true

  data_json = jsonencode({
    "backup" : var.backup_key
  })
}
