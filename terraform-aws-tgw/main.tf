##################
# Transit Gateway
##################

resource "aws_ec2_transit_gateway" "tgw" {
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"

  tags = merge(
    {
      Name = var.tgw_name
    },
    var.tgw_tags,
  )
}

#####################
# TGW Routing Tables
#####################

##################################
# Spoke RT (All -> Inspection VPC)
##################################
resource "aws_ec2_transit_gateway_route_table" "spoke" {
  count = var.create_inspection ? 1 : 0

  transit_gateway_id = aws_ec2_transit_gateway.tgw.id

  #  tags = var.spoke_rt_tags

  tags = merge(
    {
      Name = var.spoke_rt_name
    },
    var.spoke_rt_tags,
  )
}

#####################################################################
# Hub RT [Traffic after inspection (in Inspection VPC) -> target VPC]
#####################################################################
resource "aws_ec2_transit_gateway_route_table" "hub" {
  count = var.create_inspection ? 1 : 0

  transit_gateway_id = aws_ec2_transit_gateway.tgw.id

  #  tags = var.hub_rt_tags
  tags = merge(
    {
      Name = var.hub_rt_name
    },
    var.hub_rt_tags,
  )
}

##################################
# Single RT
##################################
resource "aws_ec2_transit_gateway_route_table" "selected" {
  count              = var.create_inspection ? 0 : 1
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id

  #  tags = var.tgw_rt_tags
  tags = merge(
    {
      Name = var.tgw_rt_name
    },
    var.tgw_rt_tags,
  )
}

##################################
# RT Segmentation
##################################
#resource "aws_ec2_transit_gateway_route_table" "selected" {
#  for_each = toset([
#    for v in var.environments : v
#    if var.create_inspection == false
#  ])
#  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
#
#  tags = merge(
#    { "Name" = each.value },
#    var.rt_seg_tags,
#    )
#}

###############################
## Resource Access Share (RAM)
###############################
#
#data "aws_organizations_organization" "this" {}
#
#resource "aws_ram_resource_share" "tgw" {
#  name                      = var.tgw_name
#  allow_external_principals = false #true
#
#  tags = var.tgw_tags
#}
#
#resource "aws_ram_principal_association" "tgw" {
#  principal          = data.aws_organizations_organization.this.arn # var.org_arn
#  resource_share_arn = aws_ram_resource_share.tgw.arn
#}
#
#resource "aws_ram_resource_association" "tgw" {
#  resource_arn       = aws_ec2_transit_gateway.tgw.arn
#  resource_share_arn = aws_ram_resource_share.tgw.arn
#}