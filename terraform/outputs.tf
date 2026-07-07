output "config_files" {
  value = {
    for k, v in module.app_servers :
    k => v.config_path
  }
}
