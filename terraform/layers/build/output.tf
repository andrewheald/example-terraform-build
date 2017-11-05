output "subnet_id" {
  value = "${aws_subnet.build.id}"
}

output "security_group_id" {
  value = "${aws_security_group.build.id}"
}
