provider "docker" {
    host = "unix:///var/run/docker.sock"

}

resource "docker_container" "websrv-dock" {
    name = "websrv-dock"
    image = ${var.local_dock_image}
    ports {
        internal = ${var.local_dock_port_int}
        external = ${var.local_dock_port_ext}
    }
    start = true
}