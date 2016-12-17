############
## Outputs
############

output "web_servers_public_ip" {
  value = "${join(",", aws_instance.webserver.*.public_ip)}"
}

output "sql_servers_public_ip" {
  value = "${join(",", aws_instance.sqlserver.*.public_ip)}"
}
