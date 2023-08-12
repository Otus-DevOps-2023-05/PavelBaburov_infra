output "external_ip_addres_app" {
  value = [for ip in yandex_compute_instance.app.*.network_interface.0.nat_ip_address : ip]
}
# output "external_ip_addres_app2" {
#   value = yandex_compute_instance.app2.network_interface.0.nat_ip_address
# }
output "external_address_yandex_lb_network_load_balancer_lb-app" {
  value = yandex_lb_network_load_balancer.lb-app.listener[*].external_address_spec[*].address

}
