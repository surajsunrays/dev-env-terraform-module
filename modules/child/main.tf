resource "aws_s3_bucket" "sunrays_aws_terraform" {
    bucket = "sunrays-aws-terraform-bucket"
}

resource "aws_eip" "test_eip" {
    name = "custom_ip_address"
}
