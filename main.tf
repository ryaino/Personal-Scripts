terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.9.0"
    }
  }
}

provider "docker" {
  # Configuration options
}

module "homepage" {
  source = "./services/Homepage"
}

# module "caddy" {
#   source = "./services/Caddy"
# }

module "actual" {
  source = "./services/Actual"
}

module "traefik" {
    source = "./services/Traefik"
}