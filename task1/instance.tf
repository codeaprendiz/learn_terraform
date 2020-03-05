//provider "aws" {
//  access_key = ""
//  secret_key = ""
//  region     = "eu-west-1"
//}
//
////https://cloud-images.ubuntu.com/locator/ec2/
//resource "aws_instance" "example" {
//  ami           = "ami-035df3cfe31bdea3b"
//  instance_type = "t2.micro"
//}

provider "aws" {
  region = "eu-west-1"
}

data "aws_ami" "ubuntu-bionic-latest" {
  most_recent = true

  filter {
    name = "name"
    values = [
      "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"
    ]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu-bionic-latest.id
  instance_type = "t2.micro"

  tags = {
    Name = "DroneCI"
  }
}



