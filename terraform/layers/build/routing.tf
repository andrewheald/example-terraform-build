resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.build.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.build.id}"
  }
  tags = "${var.tags}"
}

resource "aws_route_table_association" "public" {
  subnet_id = "${aws_subnet.build.id}"
  route_table_id = "${aws_route_table.public.id}"
}
