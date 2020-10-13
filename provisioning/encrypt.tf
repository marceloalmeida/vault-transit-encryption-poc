resource "vault_generic_endpoint" "encrypt_secret" {
  path                 = format("%s/%s/%s", vault_mount.transit.path, "encrypt", vault_transit_secret_backend_key.key.name)
  ignore_absent_fields = true
  disable_read         = true
  disable_delete       = true
  write_fields         = ["ciphertext"]

  data_json = jsonencode({
    "plaintext" : base64encode(var.plaintext)
  })
}
