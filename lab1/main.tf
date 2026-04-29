data "aws_ami" "rhel_8" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["RHEL-8"]
    }
}
resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_instance" "instance_1" {
    instance_type = "t2.micro"
    ami = data.aws_ami.rhel_8

    tags = {
        Name = "instance_1_master"
    }
}

resource "aws_instance" "instance_2" {
    instance_type = "t2.micro"
    ami = data.aws_ami.rhel_8

    tags = {
        Name = "instance_2_minion"
    }
}

resource "aws_instance" "instance_3" {
    instance_type = "t2.micro"
    ami = data.aws_ami.rhel_8

    tags = {
        Name = "instance_3_minion"
    }
}