terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.9.0"
    }
  }
}

resource "docker_image" "homepage" {
  name         = "ghcr.io/gethomepage/homepage:latest"
  keep_locally = false
}

resource "docker_container" "homepage" {
  image = docker_image.homepage.image_id
  name  = "homepage"
  ports {
    internal = 3000
    external = 3000
  }
  volumes {
    host_path = "${abspath(path.root)}/services/Homepage/config"
    container_path = "/app/config"
  }
    volumes {
        host_path = "/var/run/docker.sock"
        container_path = "/var/run/docker.sock"
  }
  env = [
    "HOMEPAGE_ALLOWED_HOSTS=*",
  ]
  networks_advanced {
    name = "caddy"
  }
}
