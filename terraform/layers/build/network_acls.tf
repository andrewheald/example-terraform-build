resource "aws_network_acl" "public" {
  vpc_id = "${aws_vpc.build.id}"
  subnet_ids = ["${aws_subnet.build.*.id}"]
  tags = "${var.tags}"
}

resource "aws_network_acl_rule" "public_egress" {
  network_acl_id = "${aws_network_acl.public.id}"
  rule_number = 1
  egress = true
  protocol = "all"
  rule_action = "allow"
  cidr_block = "0.0.0.0/0"
  from_port = 0
  to_port = 0
}

resource "aws_network_acl_rule" "public_ingress" {
  network_acl_id = "${aws_network_acl.public.id}"
  rule_number = 1
  egress = false
  protocol = "all"
  rule_action = "allow"
  cidr_block = "0.0.0.0/0"
  from_port = 0
  to_port = 0
}
