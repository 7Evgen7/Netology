output "nginx1" {
  value = yandex_compute_instance.nginx1.network_interface.0.ip_address
}

output "nginx2" {
  value = yandex_compute_instance.nginx2.network_interface.0.ip_address
}

output "bastion" {
  value = yandex_compute_instance.bastion.network_interface.0.nat_ip_address
}

output "lb" {
  value = yandex_alb_load_balancer.lb.listener.0.endpoint.0.address.0.external_ipv4_address.0.address
}

output "zabbix" {
  value = yandex_compute_instance.zabbix.network_interface.0.nat_ip_address
}

output "kibana" {
  value = yandex_compute_instance.kibana.network_interface.0.nat_ip_address
}

output "elastic" {
  value = yandex_compute_instance.elastic.network_interface.0.ip_address
}

