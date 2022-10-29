# Provider configuration
provider "aws" {
region = "ap-southeast-2"
}
# Resource configuration
resource "aws_instance" "CentOSEC2" {
ami = "ami-000a59677875221a3"
instance_type = "t2.micro"
key_name = "linuxec2"
}