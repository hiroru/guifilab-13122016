############
## VPC
############

resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags {
    Name = "${var.name}-vpc"
    Owner = "${var.owner}"
  }
}

resource "aws_vpc_dhcp_options" "dns_resolver" {
  domain_name_servers = ["AmazonProvidedDNS"]
  tags {
    Name = "${var.name}-dns"
    Owner = "${var.owner}"
  }
}

resource "aws_vpc_dhcp_options_association" "dns_resolver" {
  vpc_id ="${aws_vpc.vpc.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.dns_resolver.id}"
}

############
## Subnets
############

# Subnet (public)
resource "aws_subnet" "subnet" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.vpc_cidr}"
  availability_zone = "${var.zone}"
  tags {
    Name = "${var.name}-sub"
    Owner = "${var.owner}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
    Name = "${var.name}-gw"
    Owner = "${var.owner}"
  }
}

############
## Routing
############

resource "aws_route_table" "routetable" {
    vpc_id = "${aws_vpc.vpc.id}"

    # Default route through Internet Gateway
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.gw.id}"
    }

    tags {
      Name = "${var.name}-rt"
      Owner = "${var.owner}"
    }
}

resource "aws_route_table_association" "rtassociation" {
  subnet_id = "${aws_subnet.subnet.id}"
  route_table_id = "${aws_route_table.routetable.id}"
}


############
## Security
############

resource "aws_security_group" "sg" {
  vpc_id = "${aws_vpc.vpc.id}"
  name = "${var.name}-sg"

  # Allow all outbound
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all internal
  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["${var.vpc_cidr}"]
  }

  tags {
    Owner = "${var.owner}"
    Name = "${var.name}-sg"
  }
}
