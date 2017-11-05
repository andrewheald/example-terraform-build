resource "aws_security_group" "build" {
  vpc_id = "${aws_vpc.build.id}"
  tags = "${var.tags}"
}

resource "aws_security_group_rule" "ssh_ingress" {
  security_group_id = "${aws_security_group.build.id}"
  type = "ingress"
  protocol = "tcp"
  from_port = 22
  to_port = 22
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https_egress" {
  security_group_id = "${aws_security_group.build.id}"
  type = "egress"
  protocol = "tcp"
  from_port = 443
  to_port = 443
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "http_egress" {
  security_group_id = "${aws_security_group.build.id}"
  type = "egress"
  protocol = "tcp"
  from_port = 80
  to_port = 80
  cidr_blocks = ["0.0.0.0/0"]
}
