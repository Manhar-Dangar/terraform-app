resource "aws_instance" "app" {
  count         = "${var.ec2_count}"  
  ami           = "${var.ami_id}"
  instance_type = "${var.ec2_type}"
  subnet_id     = "${var.subnet_id}"
  key_name      = "${var.keyname}"
 user_data = <<EOF
    #! /bin/bash
                sudo yum update -y
    sudo yum install -y httpd
    sudo service httpd start
    sudo service httpd enable
    echo "<h1>Hello World</h1>" | sudo tee /var/www/html/index.html
  EOF
  tags = {
    Name = "${var.ec2_tag}"
  }  
}
