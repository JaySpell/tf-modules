variable "local_dock_image" {
    description = "Local Docker image to start up for test."
    type = "string"
}

variable "local_dock_port_int" {
    description = "Internal docker port to use."
    type = number
}

variable "local_dock_port_ext" {
    description = "External docker port to use."
    type = number
}
