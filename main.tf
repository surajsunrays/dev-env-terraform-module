# This is sample configuration file for testing various elements of terraform resources and modules

provider "aws" {
  region = "ap-south-1"
  shared_credentials_file = "/home/zadmin/.aws/credentials"
  profile = "devops"
}

module "simple-s3-bucket" {
  source = "./modules/child"
  tags {
    version = "1.0.0"
    owner = "sunrays"
    environment = "dev"
  }
}
