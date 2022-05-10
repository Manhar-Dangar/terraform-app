variable "ec2_count"{
    default = "1"
}

variable "ami_id"{
    default = "ami-0756a1c858554433e"
}

variable "ec2_type"{
    default = "t2.micro"
}

variable "ec2_tag"{
    default = "ec2app"
}

variable "subnet_id" {}
