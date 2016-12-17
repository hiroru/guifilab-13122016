variable "hosted_zone_id" {
  description = "ID for the domain hosted zone"
}

variable "domain_name" {
  description = "name of the domain where record(s) need to create"
}

variable shared_credentials_file {
  description = "aws credentials file on your local workstation"
}

variable profile {
  description = "aws credentials profile to use"
}

variable region {
  default = "eu-central-1"
}

variable zone {
  default = "eu-central-1a"
}

variable name {
  description = "Customer name"
  default = "sbarroso"
}

variable owner {
  default = "sbarroso"
}

variable vpc_cidr {
  default = "10.1.0.0/16"
}

variable keypair_name {
  default = "sbarroso-kp-eu-central-1"
}

variable instance_type {
  default = "t2.micro"
}

variable ansibleFilter {
  description = "`ansibleFilter` tag value added to all instances, to enable instance filtering in Ansible dynamic inventory"
  default = "sbarroso01" # IF YOU CHANGE THIS YOU HAVE TO CHANGE instance_filters = tag:ansibleFilter=sbarroso01 in ./ansible/hosts/ec2.ini
}

variable amis {
  description = "Default AMIs to use for nodes depending on the region"
  type = "map"
  default = {
    eu-central-1 = "ami-f9619996" # Amazon Linux AMI 2016.09.0 (HVM), SSD Volume Type
  }
}
variable default_instance_user {
  default = "ec2-user"
}
