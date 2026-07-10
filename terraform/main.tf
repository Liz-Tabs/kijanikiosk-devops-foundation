module "app_servers" {
  for_each = var.servers

  source = "./modules/app_server"

  name = each.key
  env  = each.value.env

  ssh_key = file(pathexpand("~/.ssh/id_ed25519.pub"))
}

