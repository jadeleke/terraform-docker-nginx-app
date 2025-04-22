terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host = "npipe:////.//pipe//docker_engine"
}

resource "docker_network" "tutorial_net" {
  name = "tutorial-net"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  name  = "tutorial"
  image = docker_image.nginx.image_id

  networks_advanced {
    name = docker_network.tutorial_net.name
  }

  ports {
    internal = 80
    external = 8000
  }

  restart = "unless-stopped"

  healthcheck {
    test         = ["CMD-SHELL", "curl -f http://localhost/ || exit 1"]
    interval     = "30s"
    timeout      = "5s"
    retries      = 3
    start_period = "10s"
  }

  mounts {
    target    = "/usr/share/nginx/html"
    # ensure this resolves to C:\Users\Admin\Pictures\...\site-content
    source    = abspath("${path.module}/site-content")
    type      = "bind"
    read_only = false
  }
}
