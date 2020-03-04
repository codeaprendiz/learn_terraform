provider "aws" {
  access_key = "ACCESS_KEY_HERE"
  secret_key = "SECRET_KEY_HERE"
  region     = "us-east-1"
}

//https://cloud-images.ubuntu.com/locator/ec2/
resource "aws_instance" "example" {
  ami           = "ami-035df3cfe31bdea3b"
  instance_type = "t2.micro"
}

