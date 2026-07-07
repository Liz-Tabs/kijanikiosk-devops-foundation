resource "local_file" "config" {
  filename = "/tmp/kijanikiosk-${var.env}-${var.name}.conf"

  content = <<EOT
server: ${var.name}
env: ${var.env}
EOT
}
