resource "local_file" "ansible-inventory" {
  content  = <<-EOT

    [bastion]
    ${yandex_compute_instance.bastion.network_interface.0.ip_address} public_ip=${yandex_compute_instance.bastion.network_interface.0.nat_ip_address} 

    [balancer]
    ${yandex_alb_load_balancer.lb.listener.0.endpoint.0.address.0.external_ipv4_address.0.address}

    [webserver]
    webserver1
    webserver2 

    [zabbix]
    zabbix-server

    [elastic]
    elastic1 

    [kibana]
    kibana1 

    [all:vars]
    ansible_python_interpreter=/usr/bin/python3
    EOT
  filename = "./ansible/inventory.ini"
}
