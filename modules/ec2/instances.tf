resource "aws_instance" "app" {
  count         = "${var.ec2_count}"  
  ami           = "${var.ami_id}"
  instance_type = "${var.ec2_type}"
  subnet_id     = "${var.subnet_id}"

  tags = {
    Name = "${var.ec2_tag}"
  }  
}
