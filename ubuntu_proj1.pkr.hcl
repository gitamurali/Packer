
packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  access_key = "***************"
  secret_key = "***********************"
  ami_name      = "aws-ubuntu"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami    = "ami-0574da719dca65348"
  ssh_username  = "ubuntu"
}

build {
  name = "aws_ubuntu_image"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
}
