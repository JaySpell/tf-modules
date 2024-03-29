terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "2.15.0"
    }
  }
}

provider "docker" {
    host = var.local_dock_host
}

resource "docker_container" "websrv-dock" {
    name = "websrv-dock"
    image = var.local_dock_image
    ports {
        internal = var.local_dock_port_int
        external = var.local_dock_port_ext
    }
    start = true
}

variable "local_dock_image" {
    description = "Local Docker image to start up for test."
    
}

variable "local_dock_port_int" {
    description = "Internal docker port to use."
    
}

variable "local_dock_port_ext" {
    description = "External docker port to use."
    
}

variable "local_dock_host" {
    description = "Local Docker host connection"
    default = "unix:///var/run/docker.sock"
}
