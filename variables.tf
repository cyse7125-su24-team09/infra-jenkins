variable "aws_profile" {
  type        = string
  description = "Aws Profile Name"
}

variable "region" {
  type        = string
  description = "AWS Region Name"
}


variable "vpc_tag" {
  type = string

}

variable "subnet_tag" {
  type = string

}

variable "vpc_cidr" {
  type = string


}

variable "subnet_cidr" {
  type = string


}

variable "ig_tag" {
  type = string

}

variable "route_cidr_range" {
  type = string

}
variable "route_table_tag" {
  type = string

}

variable "security_group_name" {
  type = string

}

variable "security_group_tag" {
  type = string

}

variable "allow_http_protocol" {
  type = string

}

variable "allow_http_cidr" {
  type = string

}

variable "allow_http_port" {
  type = string

}

variable "allow_https_protocol" {
  type = string

}

variable "allow_https_cidr" {
  type = string

}

variable "allow_https_port" {
  type = string

}

variable "egress_cidr" {
  type = string

}
variable "egress_protocol" {
  type = string

}

variable "eip_tag" {
  type = string
}

variable "jenkins_ami_id" {
  description = "The AMI ID for the Jenkins instance"
  type        = string
}

variable "instance_tag" {
  description = "Tag for the Jenkins instance"
  type        = string
}


variable "instance_type" {

  type = string

}


variable "volume_size" {
  type = string
}

variable "volume_type" {
  type = string
}