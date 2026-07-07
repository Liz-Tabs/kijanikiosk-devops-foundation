resource "multipass_instance" "server" {
  name = "kijanikiosk-${var.name}"

  cpus = 1
  memory = "1G"
  disk = "5G"

  image = "22.04"
}
