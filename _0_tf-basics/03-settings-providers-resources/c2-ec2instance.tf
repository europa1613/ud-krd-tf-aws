resource "aws_instance" "myec2_w_userdata" {
    ami = "ami-079db87dc4c10ac91"
    instance_type = "t2.micro"
    user_data = file("${path.module}/app1-install.sh")

    tags = {
      Name = "myec2_w_userdata"
    }
  
}