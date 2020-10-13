output "data" {
  value = {
    encrypted            = vault_generic_endpoint.encrypt_secret.write_data.ciphertext
    decrypted            = base64decode(vault_generic_endpoint.decrypt_secret.write_data.plaintext)
    decrypted_backup_key = base64decode(vault_generic_endpoint.decrypt_secret_backup_key.write_data.plaintext)
  }
}
