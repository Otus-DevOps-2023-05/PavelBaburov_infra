output "external_ip_addres_app" {
  value = yandex_compute_instance.app.network_interface.0.nat_ip_address
}
output "external_ip_addres_app2" {
  value = yandex_compute_instance.app2.network_interface.0.nat_ip_address
}
output "external_address_yandex_lb_network_load_balancer_lb-app" {
  value = yandex_lb_network_load_balancer.lb-app.listener[*].external_address_spec[*].address

}

# output "load_balancer_target_group_id" {
#   value = yandex_lb_target_group.reddit-app.id
# }
