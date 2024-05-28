resource "aws_vpc" "jenkins_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_tag
  }
}

resource "aws_subnet" "jenkins_subnet" {
  vpc_id     = aws_vpc.jenkins_vpc.id
  cidr_block = var.subnet_cidr

  tags = {
    Name = var.subnet_tag
  }
}

data "aws_eip" "by_tags" {
  tags = {
    Name = "jenkins_ip"
  }
}


resource "aws_internet_gateway" "jenkins_igw" {
  vpc_id = aws_vpc.jenkins_vpc.id

  tags = {
    Name = var.ig_tag
  }
}

resource "aws_route_table" "jenkins_route_table" {
  vpc_id = aws_vpc.jenkins_vpc.id
   route {
    cidr_block = var.route_cidr_range
    gateway_id = aws_internet_gateway.jenkins_igw.id
  }
  tags = {
    Name = var.route_table_tag
  }
}

resource "aws_route_table_association" "jenkins_route_table_association" {
  subnet_id      = aws_subnet.jenkins_subnet.id
  route_table_id = aws_route_table.jenkins_route_table.id
} 

resource "aws_security_group" "jenkins_security_group" {
  name   = var.security_group_name
  vpc_id = aws_vpc.jenkins_vpc.id

  tags = {
    Name = var.security_group_tag
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  ip_protocol       = var.allow_http_protocol
  cidr_ipv4         = var.allow_http_cidr
  security_group_id = aws_security_group.jenkins_security_group.id
  from_port         = var.allow_http_port
  to_port           = var.allow_http_port
}
resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  ip_protocol       = var.allow_https_protocol
  cidr_ipv4         = var.allow_https_cidr
  security_group_id = aws_security_group.jenkins_security_group.id
  from_port         = var.allow_https_port
  to_port           = var.allow_https_port
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.jenkins_security_group.id
  cidr_ipv4         = var.egress_cidr
  ip_protocol       = var.egress_protocol
}


