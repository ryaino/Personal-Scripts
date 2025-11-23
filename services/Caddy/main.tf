terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.9.0"
    }
  }
}

resource "docker_image" "caddy" {
  name         = "caddy:2.10.2"
  keep_locally = false
}

resource "docker_network" "caddy" {
  name = "caddy"
  internal = false
}

resource "docker_container" "caddy" {
  image = docker_image.caddy.image_id
  restart = "unless-stopped"
  name  = "caddy"
  ports {
    internal = 80
    external = 80
  }
  ports {
    internal = 443
    external = 443
  }
  ports {
    internal = 443
    external = 443
    protocol = "udp"
  }

  ports {
    internal = 2080
    external = 2080
  }
  volumes {
    host_path = "${abspath(path.root)}/services/Caddy/conf"
    container_path = "/etc/caddy"
  }
  volumes {
    host_path = "${abspath(path.root)}services/Caddy/site"
    container_path = "/srv"
  }
  volumes {
    volume_name = "caddy_data"
    container_path = "/data"
  }
  volumes {
    volume_name = "caddy_config"
    container_path = "/config"
  }
  networks_advanced {
    name = "caddy"
  }
}
