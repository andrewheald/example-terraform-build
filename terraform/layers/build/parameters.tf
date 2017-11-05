data "aws_ssm_parameter" "availability_zone" {
  name = "build-availability-zone"
}

data "aws_ssm_parameter" "cidr_block" {
  name = "build-cidr-block"
}

data "aws_ssm_parameter" "ssh_public_key" {
  name = "build-ssh-public-key"
}
