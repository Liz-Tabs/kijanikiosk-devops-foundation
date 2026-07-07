output "server_ips" {
  value = {
    for name, server in module.app_servers :
    name => server.ip_address
  }
}

output "ssh_commands" {
  value = {
    for name, server in module.app_servers :
    name => "ssh ubuntu@${server.ip_address}"
  }
}
