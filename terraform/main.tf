module "app_servers" {
  for_each = var.servers
  source   = "./modules/app_server"

  name = each.key
  env  = var.environment
}
