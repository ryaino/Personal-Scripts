terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.9.0"
    }
  }
}

resource "docker_image" "traefik" {
  name         = "traefik:v3.6"
  keep_locally = true
}

resource "docker_container" "traefik" {
  image = docker_image.traefik.image_id
  name  = "traefik"
  restart = "unless-stopped"
  command = [
    "--api.insecure=true",
    "--providers.docker=true",
    "--entrypoints.web.address=:80",
    "--api.dashboard=true"
  ]
  ports {
    internal = 80
    external = 80
  }
  ports {
    internal = 8080
    external = 8080
  }
    volumes {
        host_path = "/var/run/docker.sock"
        container_path = "/var/run/docker.sock"
  }
    labels {
    label = "traefik.http.routers.traefik.rule"
    value = "Host(`traefik.localhost`)"
  }
}
