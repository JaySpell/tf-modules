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
    type = string
}

variable "local_dock_port_int" {
    description = "Internal docker port to use."
    type = number
}

variable "local_dock_port_ext" {
    description = "External docker port to use."
    type = number
}

variable "local_dock_host" {
    description = "Local Docker host connection"
    default = "unix:///var/run/docker.sock"
}