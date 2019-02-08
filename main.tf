# This is sample configuration file for testing various elements of terraform resources and modules

provider "aws" {
  region = "ap-south-1"
  shared_credentials_file = "/home/zadmin/.aws/credentials"
  profile = "devops"
}
module "ec2_cluster" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "1.12.0"

  name                   = "my-cluster"
  instance_count         = "2"
  ami                    = "ami-04ea996e7a3e7ad6b" # UBUNTU 16.04
  instance_type          = "t2.micro"
  key_name               = "sunrays_aws_terraform"
  vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = "subnet-eddcdzz4"

  tags {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_instance" "sunrays_test_instance" {
    ami = "ami-04ea996e7a3e7ad6b"
    instance_type = "t2.micro"

    provisioner "remote-exec" {
      script = "test.sh"
    }
}

resource "aws_sns_topic" "development" {
    name = "development"
}

module "child" {
  source = "./child"
  version = "1.0.0"
}
