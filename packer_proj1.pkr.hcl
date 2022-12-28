packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "secondimage" {
  access_key    = "AKIAVIBYHL3KFDB3WTGR"
  secret_key    = "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"
  ami_name      = "my_secondimage"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami   =  "ami-0b5eea76982371e91"
  ssh_username = "ec2-user"
}

build {

  sources = [
    "source.amazon-ebs.secondimage"
  ]
  provisioner "ansible"{
    playbook_file = "./ansible_playbook.yml"},
   {
}
}
