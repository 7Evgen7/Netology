terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.95"
}

provider "yandex" {
  token     = "y0_AgAAAAAmc0a9AATuwQ"
  cloud_id  = "b1gbmmfunajo"
  folder_id = "b1g2oala3k7fb"
}

