# Jenkins Infrastructure Setup with Terraform

## Overview

This repository contains Terraform scripts to set up a Jenkins server on AWS. The infrastructure includes a VPC, subnet, security group, route table, EC2 instance, and an Elastic IP association with ec2. 

## Requirements
- **Terraform**: Installed and configured.
- **AWS CLI**: Installed and configured with appropriate permissions.
- **Jenkins AMI**: Available AMI ID for Jenkins.
- **Domain** with an Elastic IP set as an A record
- **Elastic IP**

## Features
1. AWS VPC: Creates a Virtual Private Cloud (VPC) for Jenkins.
2. Subnet: Provisions a subnet within the VPC.
3. Internet Gateway: Sets up an Internet Gateway for internet access.
4. Route Table: Configures a route table with a route to the Internet Gateway.
5. Security Group: Defines security group rules for HTTP and HTTPS
6. EC2 Instance: Launches an EC2 instance to host Jenkins.
7. Elastic IP: Associates an Elastic IP with the EC2 instance.


## Setup Instructions
- **Initialize Terraform**: Set up Terraform and download required providers.
- **Configure Variables**: Fill in the terraform.tfvars file with your specific values, such as AWS profile, region, VPC CIDR, etc.
- **Provision Infrastructure**: Use Terraform to plan and apply the infrastructure configuration.
- **Domain Configuration**: Ensure your domain's DNS settings include an A record pointing to the Elastic IP of your Jenkins server.

## Sample terraform.tfvars

```hcl
aws_profile          = "your_aws_profile"
region               = "your_aws_region"
vpc_tag              = "jenkins-vpc"
subnet_tag           = "jenkins-subnet"
vpc_cidr             = "10.0.0.0/16"
subnet_cidr          = "10.0.1.0/24"
ig_tag               = "jenkins-igw"
route_cidr_range     = "0.0.0.0/0"
route_table_tag      = "jenkins-route-table"
security_group_name  = "jenkins-security-group"
security_group_tag   = "jenkins-sg"
allow_http_protocol  = "tcp"
allow_http_cidr      = "0.0.0.0/0"
allow_http_port      = 80
allow_https_protocol = "tcp"
allow_https_cidr     = "0.0.0.0/0"
allow_https_port     = 443
egress_cidr          = "0.0.0.0/0"
egress_protocol      = "-1"
eip_tag              = "jenkins-eip"
jenkins_ami_id       = "your_jenkins_ami_id"
instance_tag         = "jenkins-instance"
instance_type        = "t2.micro"
volume_size          = 20
volume_type          = "gp2"
```
