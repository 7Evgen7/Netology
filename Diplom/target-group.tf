#target_group

resource "yandex_alb_target_group" "targetg" {
  name = "group1"

  target {
    subnet_id    = "${yandex_vpc_subnet.subnet-nginx1.id}"
    ip_address   = "${yandex_compute_instance.nginx1.network_interface.0.ip_address}"
  }

  target {
    subnet_id    = "${yandex_vpc_subnet.subnet-nginx2.id}"
    ip_address   = "${yandex_compute_instance.nginx2.network_interface.0.ip_address}"
  }
}

#backend_group

resource "yandex_alb_backend_group" "backend-group" {
  name = "backend-group1"

  http_backend {
    name             = "http-backend"
    weight           = 1
    port             = 80
    target_group_ids = ["${yandex_alb_target_group.targetg.id}"]

    healthcheck {
      timeout             = "1s"
      interval            = "1s"
      http_healthcheck {
        path              = "/"
      }
    }
  }
}

#HTTP router

resource "yandex_alb_http_router" "router" {
  name          = "http-router1"
  labels        = {
    tf-label    = "router-value"
    empty-label = ""
  }
}

resource "yandex_alb_virtual_host" "vh" {
  name           = "virtual-host"
  http_router_id = yandex_alb_http_router.router.id
  route {
    name = "route1"
    http_route {
      http_route_action {
        backend_group_id = yandex_alb_backend_group.backend-group.id
        timeout          = "3s"
      }
    }
  }
}

#Balancer

resource "yandex_alb_load_balancer" "lb" {
  name               = "load-balancer"
  network_id         = yandex_vpc_network.net.id
  security_group_ids = [yandex_vpc_security_group.sg-balancer.id]

  allocation_policy {
    location {
      zone_id   = "ru-central1-a"
      subnet_id = yandex_vpc_subnet.subnet-nginx1.id
    }

    location {
      zone_id   = "ru-central1-b"
      subnet_id = yandex_vpc_subnet.subnet-nginx2.id
    }
  }

  listener {
    name = "listener1"
    endpoint {
      address {
        external_ipv4_address {
        }
      }
      ports = [80]
    }
    http {
      handler {
        http_router_id = yandex_alb_http_router.router.id
      }
    }
  }
}
