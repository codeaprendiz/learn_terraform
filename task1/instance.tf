////https://cloud-images.ubuntu.com/locator/ec2/

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
  key_name   = "deployer-key"

  tags = {
    Name = "DroneCI"
  }
}



