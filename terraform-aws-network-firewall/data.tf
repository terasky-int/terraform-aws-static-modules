################################################################################
# Get VPC
################################################################################
data "aws_vpc" "inspection_vpc" {
  filter {
    name   = "cidr"
    values = [var.inspection_vpc_cidr]
  }
}

data "aws_subnets" "firewall_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.inspection_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["*Inspection-VPC-firewall*"]
  }
}

data "aws_route_tables" "inspection_tgw_rts" {
  vpc_id = data.aws_vpc.inspection_vpc.id
  filter {
    name   = "tag:Name"
    values = ["*Inspection-VPC-tgw*"]
  }
}

data "aws_route_tables" "inspection_public_rts" {
  vpc_id = data.aws_vpc.inspection_vpc.id
  filter {
    name   = "tag:Name"
    values = ["*Inspection-VPC-public*"]
  }
}

data "aws_internet_gateway" "inspection_vpc_igw" {
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.inspection_vpc.id]
  }
}
