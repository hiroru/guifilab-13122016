############################
# Webserver host instances
############################

resource "aws_instance" "webserver" {
    count = 1
    ami = "${lookup(var.amis, var.region)}"
    instance_type = "${var.instance_type}"

    iam_instance_profile = "${aws_iam_instance_profile.iamprofile.id}"

    subnet_id = "${aws_subnet.subnet.id}"
    private_ip = "${cidrhost(var.vpc_cidr, 20 + count.index)}"
    associate_public_ip_address = true # Instances have public, dynamic IP
    source_dest_check = true

    availability_zone = "${var.zone}"
    vpc_security_group_ids = ["${aws_security_group.sg-web.id}"]
    key_name = "${var.keypair_name}"

    tags {
      Owner = "${var.owner}"
      Name = "${var.name}-web${count.index}"
      ansibleFilter = "${var.ansibleFilter}"
      ansibleNodeType = "web"
      ansibleNodeName = "web${count.index}"
    }
}

############
## Security
############

resource "aws_security_group" "sg-web" {
  vpc_id = "${aws_vpc.vpc.id}"
  name = "${var.name}-sg-web"

  # Allow inbound traffic to the port used by SSH
  ingress {
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound traffic to the port used by HTTP
  ingress {
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Owner = "${var.owner}"
    Name = "${var.name}-sg-web"
  }
}
