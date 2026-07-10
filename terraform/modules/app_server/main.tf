resource "local_file" "cloudinit" {
  filename = "${path.module}/${var.name}-cloudinit.yaml"

  content = templatefile(
    "${path.module}/cloud-init.yaml",
    {
      ssh_key = var.ssh_key
    }
  )
}

resource "multipass_instance" "server" {
  name   = "kijanikiosk-${var.name}"
  cpus   = 1
  memory = "1G"
  disk   = "5G"
  image  = "22.04"

  cloudinit_file = local_file.cloudinit.filename
}
