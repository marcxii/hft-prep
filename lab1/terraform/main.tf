provider "aws" {
    region = var.region
}


resource "aws_vpc" "lab" {
    cidr_block  = "10.0.0.0/16"
    enable_dns_hostnames = true
    tags = { Name = "salt-lab-vpc "}
}


resource "aws_subnet" "public" {
    vpc_id = aws_vpc.lab.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    tags = { Name = "salt-lab-public" }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.lab.id
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.lab.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gatewat.igw.id
    }
}

resource "aws_route_table_association" "pub" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public.id
}