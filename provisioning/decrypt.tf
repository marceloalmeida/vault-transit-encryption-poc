resource "vault_generic_endpoint" "decrypt_secret" {
  path                 = format("%s/%s/%s", vault_mount.transit.path, "decrypt", vault_transit_secret_backend_key.key.name)
  ignore_absent_fields = true
  disable_read         = true
  disable_delete       = true
  write_fields         = ["plaintext"]

  data_json = vault_generic_endpoint.encrypt_secret.write_data_json
}

resource "vault_generic_endpoint" "decrypt_secret_backup_key" {
  path                 = format("%s/%s/%s", vault_mount.transit.path, "decrypt", "my_backup_key")
  ignore_absent_fields = true
  disable_read         = true
  disable_delete       = true
  write_fields         = ["plaintext"]

  data_json = jsonencode({
    "ciphertext" : var.ciphertext_backup_key
  })

  depends_on = [vault_generic_endpoint.my_backup_key]
}
