terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.9.0"
    }
  }
}

resource "docker_image" "actual" {
  name         = "docker.io/actualbudget/actual-server:latest"
  keep_locally = true
}

resource "docker_container" "actual" {
  image = docker_image.actual.image_id
  name  = "actual"
  restart = "unless-stopped"
  ports {
    internal = 5006
    external = 5006
  }
  volumes {
    host_path = "${abspath(path.root)}/services/Actual/actual-data"
    container_path = "/data"
  }

  labels {
    label = "traefik.http.routers.actual.rule"
    value = "Host(`actual.localhost`)"
  }
}
