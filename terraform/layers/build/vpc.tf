resource "aws_vpc" "build" {
  cidr_block = "${data.aws_ssm_parameter.cidr_block.value}"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = "${var.tags}"
}

resource "aws_subnet" "build" {
  vpc_id = "${aws_vpc.build.id}"
  availability_zone = "${data.aws_region.region.name}${data.aws_ssm_parameter.availability_zone.value}"
  cidr_block = "${cidrsubnet(aws_vpc.build.cidr_block, 8, 1)}"
  map_public_ip_on_launch = true
  tags = "${var.tags}"
}

resource "aws_internet_gateway" "build" {
  vpc_id = "${aws_vpc.build.id}"
  tags = "${var.tags}"
}
