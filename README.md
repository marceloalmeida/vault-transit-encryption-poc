# Encrypt on Transit PoC

PoC and testing Vault transit encryption mechanism

## Usage

### Bring up Vault
```sh
docker-compose up -d
```

### Provision Transit mount and keys
```sh
cd provisioning
terraform init
terraform apply
```

## Usefull commands

### Create backup of the key
```sh
curl -s -H "X-Vault-Request: true" -H "X-Vault-Token: $(vault print token)" http://localhost:8200/v1/transit/backup/my_key | jq -r .data.backup | base64 -d | jq .
```

### Restore backup of the key
```sh
curl -X PUT -H "X-Vault-Token: $(vault print token)" -H "X-Vault-Request: true" -d '{"backup":"eyJwb2xpY3kiOnsibmFtZSI6Im15X2tleSIsImtleXMiOnsiMSI6eyJrZXkiOiJOVkJXWjVDUzczeDFlM1QzZlZkcFVTdXBCakpYMDZyQzlWUWs1Z1dDVzhzPSIsImhtYWNfa2V5IjoiQVN5eUgvalpQOEptdlFndGhpRVFuQ3AxY0tNY1hEV3ZkU1p3RXZtQWhIRT0iLCJ0aW1lIjoiMjAyMC0xMC0xM1QxNzoxODoxNC4yMDI0MzY2WiIsImVjX3giOm51bGwsImVjX3kiOm51bGwsImVjX2QiOm51bGwsInJzYV9rZXkiOm51bGwsInB1YmxpY19rZXkiOiIiLCJjb252ZXJnZW50X3ZlcnNpb24iOjAsImNyZWF0aW9uX3RpbWUiOjE2MDI2MDk0OTR9fSwiZGVyaXZlZCI6ZmFsc2UsImtkZiI6MCwiY29udmVyZ2VudF9lbmNyeXB0aW9uIjpmYWxzZSwiZXhwb3J0YWJsZSI6dHJ1ZSwibWluX2RlY3J5cHRpb25fdmVyc2lvbiI6MSwibWluX2VuY3J5cHRpb25fdmVyc2lvbiI6MCwibGF0ZXN0X3ZlcnNpb24iOjEsImFyY2hpdmVfdmVyc2lvbiI6MSwiYXJjaGl2ZV9taW5fdmVyc2lvbiI6MCwibWluX2F2YWlsYWJsZV92ZXJzaW9uIjowLCJkZWxldGlvbl9hbGxvd2VkIjp0cnVlLCJjb252ZXJnZW50X3ZlcnNpb24iOjAsInR5cGUiOjAsImJhY2t1cF9pbmZvIjp7InRpbWUiOiIyMDIwLTEwLTEzVDE3OjMyOjAxLjUxMjUxMzRaIiwidmVyc2lvbiI6MX0sInJlc3RvcmVfaW5mbyI6bnVsbCwiYWxsb3dfcGxhaW50ZXh0X2JhY2t1cCI6dHJ1ZSwidmVyc2lvbl90ZW1wbGF0ZSI6IiIsInN0b3JhZ2VfcHJlZml4IjoiIn0sImFyY2hpdmVkX2tleXMiOnsia2V5cyI6W3sia2V5IjpudWxsLCJobWFjX2tleSI6bnVsbCwidGltZSI6IjAwMDEtMDEtMDFUMDA6MDA6MDBaIiwiZWNfeCI6bnVsbCwiZWNfeSI6bnVsbCwiZWNfZCI6bnVsbCwicnNhX2tleSI6bnVsbCwicHVibGljX2tleSI6IiIsImNvbnZlcmdlbnRfdmVyc2lvbiI6MCwiY3JlYXRpb25fdGltZSI6MH0seyJrZXkiOiJOVkJXWjVDUzczeDFlM1QzZlZkcFVTdXBCakpYMDZyQzlWUWs1Z1dDVzhzPSIsImhtYWNfa2V5IjoiQVN5eUgvalpQOEptdlFndGhpRVFuQ3AxY0tNY1hEV3ZkU1p3RXZtQWhIRT0iLCJ0aW1lIjoiMjAyMC0xMC0xM1QxNzoxODoxNC4yMDI0MzY2WiIsImVjX3giOm51bGwsImVjX3kiOm51bGwsImVjX2QiOm51bGwsInJzYV9rZXkiOm51bGwsInB1YmxpY19rZXkiOiIiLCJjb252ZXJnZW50X3ZlcnNpb24iOjAsImNyZWF0aW9uX3RpbWUiOjE2MDI2MDk0OTR9XX19Cg==\n"}' http://localhost:8200/v1/transit/restore/my_key
```

## Requirements
* Docker ~> 19.03.13
* Docker-compose ~> 1.27
* Terraform ~> 0.13
