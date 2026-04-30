data "aws_ami" "rhel_8" {
  most_recent = true
  owners      = ["309956199498"] # Official Red Hat Owner account id

  filter {
    name   = "name"
    values = ["RHEL-8.*-x86_64-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_security_group" "salt_connection"{
    name        = "Salt ec2"
    description = "Allow salt stack to communicate"
    vpc_id      = aws_vpc.lab.id
}

resource "aws_vpc_security_group_ingress_rule" "salt_publish" {
    security_group_id = aws_security_group.salt_connection.id
    cidr_ipv6         = "aws_vpc.main.ipv6_cidr_block"
    from_port         = 4505
    to_port           = 4506
    ip_protocol       = "tcp"

}

# Allow all traffic out
resource "aws_vpc_security_group_egress_rule" "allow_outbound_connection" {
    security_group_id = aws_security_group.allow_tls.td
    cidr_ipv6         = "0.0.0.0/0"
    ip_protocol       = "-1"
}


resource "aws_instance" "salt_master" {
    ami                    = data.aws_ami.rhel_8
    instance_type          = "t3.micro"
    subnet_id              = aws_subnet.public.id
    vpc_security_group_ids = [aws_security_group.salt.id]
    key_name               = var.key_name
    user_data              = file("/scripts/bootstrap_master.sh")

    tags = {
        Name       = "salt-master"
        SaltRole   = "master"
    }
}

resource "aws_instance" "salt_minion" {
    count                  = 2
    ami                    = data.aws_ami.rhel_8
    instance_type          = "t3.micro"
    subnet_id              = aws_subnet_public.id
    vpc_security_group_ids = [aws_security_group.salt.id]

    user_data = templatefile("/scripts/bootstrap_minion.sh", {
        master_ip = aws_instances.salt_master.private_ip
    })

    tags = {
        Name     = "salt-minion-${count.index}"
        SaltRole = "minion"
    }
}