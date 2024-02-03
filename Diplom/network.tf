resource "yandex_vpc_network" "net" { 
  name = "network1"
}

resource "yandex_vpc_subnet" "in-subnet" { 
  name           = "subnet-bastion"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.net.id}" 
  v4_cidr_blocks = ["10.1.10.0/24"]
}

resource "yandex_vpc_subnet" "subnet-nginx1" { 
  name           = "subnet-nginx1"
  zone           = "ru-central1-a" 
  network_id     = "${yandex_vpc_network.net.id}" 
  v4_cidr_blocks = ["10.1.11.0/24"]
}

resource "yandex_vpc_subnet" "subnet-nginx2" { 
  name           = "subnet-nginx2"
  zone           = "ru-central1-b"
  network_id     = "${yandex_vpc_network.net.id}" 
  v4_cidr_blocks = ["10.1.12.0/24"] 
}

###security_group####

resource "yandex_vpc_default_security_group" "sg-bastion" {
  network_id  = "${yandex_vpc_network.net.id}"

  ingress {
    protocol       = "TCP"
    description    = "allow ssh"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 22
  }

  ingress {
    protocol       = "TCP"
    description    = "proxy"
    v4_cidr_blocks = ["10.1.10.0/24","10.1.11.0/24","10.1.12.0/24"]
    port           = 3128
  }
  
  egress {
    protocol       = "ANY"
    description    = "allow ping"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  } 
}

resource "yandex_vpc_security_group" "in-sg" {
  name        = "in-sg"
  network_id  = "${yandex_vpc_network.net.id}"

 ingress {
    protocol       = "TCP"
    description    = "allow ssh"
    v4_cidr_blocks = ["10.1.10.0/24","10.1.11.0/24","10.1.12.0/24"]
    port           = 22
  }

 ingress {
    protocol       = "TCP"
    description    = "http"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 80
  }
    
  ingress {
    protocol       = "TCP"
    description    = "https"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 443
  } 
  
   egress {
    protocol       = "ANY"
    description    = "ANY"
    v4_cidr_blocks= ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }

  egress {
    protocol       = "TCP"
    description    = "proxy"
    v4_cidr_blocks = ["10.1.10.254/32"]
    port           = 3128
  }
}

resource "yandex_vpc_security_group" "sg-balancer" {
  name        = "sg-balancer"
  network_id  = "${yandex_vpc_network.net.id}"

  ingress {
    protocol       = "ANY"
    description    = "balancer"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  } 
  
  egress {
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }
}

resource "yandex_vpc_security_group" "sg-elastic" {
  name        = "sg-elastic"
  network_id  = "${yandex_vpc_network.net.id}"

  ingress {
    protocol       = "TCP"
    description    = "elastic"
    v4_cidr_blocks = ["10.1.10.0/24","10.1.11.0/24","10.1.12.0/24" ]
    port           = 9200
  } 
  
   egress {
   protocol        = "TCP"    
    description    = "elastic"
    v4_cidr_blocks = ["10.1.10.0/24","10.1.11.0/24","10.1.12.0/24"]
    port           = 5601
  } 
}

resource "yandex_vpc_security_group" "sg-kibana" {
  name        = "sg-kibana"
  network_id  = "${yandex_vpc_network.net.id}"

  ingress {
    protocol       = "TCP"
    description    = "kibana"
    v4_cidr_blocks = ["10.1.10.0/24","10.1.11.0/24","10.1.12.0/24" ]
    port           = 5601
  } 
  
   egress {
    protocol = "TCP"
    description    = "kibana"
    v4_cidr_blocks= ["10.1.10.0/24","10.1.11.0/24","10.1.12.0/24"]
    port           = 9201
  } 
}

resource "yandex_vpc_security_group" "sg-zabbix" {
  name        = "zabbix"
  network_id  = "${yandex_vpc_network.net.id}"

  ingress {
    protocol       = "TCP"
    description    = "zabbix"
    v4_cidr_blocks = ["10.1.10.0/24","10.1.11.0/24","10.1.12.0/24" ]
    port           = 10050
  } 
  
   egress {
    protocol       = "TCP"
    description    = "zabbix"
    v4_cidr_blocks = ["10.1.10.0/24","10.1.11.0/24","10.1.12.0/24"]
    port           = 10050
  }  
}
