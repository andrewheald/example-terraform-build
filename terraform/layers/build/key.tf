resource "aws_key_pair" "build" {
  key_name = "build"
  public_key = "${data.aws_ssm_parameter.ssh_public_key.value}"
}
