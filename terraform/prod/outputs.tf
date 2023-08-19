# output "external_ip_addres_app" {
#   value = [for ip in yandex_compute_instance.app.*.network_interface.0.nat_ip_address : ip]
# }
output "external_ip_address_app" {
  value = module.app.external_ip_address_app
}
output "external_ip_address_db" {
  value = module.db.external_ip_address_db
}
