data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]

  filter {   			 
    name   = "name"
    values = ["amzn2-ami-hvm*"]   
  }

}


variable "insta_type"{
default = { 
instance_type="t2.micro" }
}

resource "aws_instance" "myec2" {
   ami = data.aws_ami.app_ami.id
   instance_type = var.insta_type
   key_name = "cwdemo"
 }
