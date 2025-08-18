##################################################
# route_table_association - Spoke RT Association
##################################################

resource "aws_ec2_transit_gateway_route_table_association" "spoke_rt" {
  count = var.create_inspection == true && var.is_inspection == false ? 1 : 0

  transit_gateway_attachment_id  = var.tgw_attach_id
  transit_gateway_route_table_id = var.tgw_spoke_route_table_id
}

############################################################################################
# Update routes - on the Hub RT [Traffic after inspection (in Inspection VPC) -> target VPC]
############################################################################################

resource "aws_ec2_transit_gateway_route" "spoke_vpc_cidr" {
  count = var.create_inspection == true && var.is_inspection == false ? 1 : 0

  destination_cidr_block         = var.vpc_cidr
  transit_gateway_attachment_id  = var.tgw_attach_id
  transit_gateway_route_table_id = var.tgw_hub_route_table_id

  # need to check whether this depends_on is necessary or not
  depends_on = [aws_ec2_transit_gateway_route_table_association.spoke_rt]
}

##################################################
# route_table_association - Hub RT Association
##################################################

resource "aws_ec2_transit_gateway_route_table_association" "hub_rt" {
  count = var.create_inspection && var.is_inspection ? 1 : 0

  transit_gateway_attachment_id  = var.tgw_attach_id
  transit_gateway_route_table_id = var.tgw_hub_route_table_id
}

############################################################################################
# Update routes - on the TGW Spoke RT [All traffic go to Inspection VPC]
############################################################################################

resource "aws_ec2_transit_gateway_route" "all_to_inspection_vpc" {
  count = var.create_inspection && var.is_inspection ? 1 : 0

  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = var.tgw_attach_id
  transit_gateway_route_table_id = var.tgw_spoke_route_table_id

  # need to check whether this depends_on is necessary or not
  depends_on = [aws_ec2_transit_gateway_route_table_association.hub_rt]
}

####
##################################
# Single RT
##################################
resource "aws_ec2_transit_gateway_route_table_association" "selected" {
  count = var.create_inspection == false && var.is_inspection == false ? 1 : 0

  transit_gateway_attachment_id  = var.tgw_attach_id
  transit_gateway_route_table_id = var.tgw_route_table_id
}

resource "aws_ec2_transit_gateway_route" "selected" {
  count = var.create_inspection == false && var.is_inspection == false ? 1 : 0

  destination_cidr_block         = var.vpc_cidr
  transit_gateway_attachment_id  = var.tgw_attach_id
  transit_gateway_route_table_id = var.tgw_route_table_id

  # need to check whether this depends_on is necessary or not
  depends_on = [aws_ec2_transit_gateway_route_table_association.selected]
}

##################################
# RT Segmentation
##################################

#resource "aws_ec2_transit_gateway_route_table_association" "selected" {
#  for_each = tomap({
#    for k, v in var.tgw_rts : k => v
#      if var.create_inspection == false && var.is_inspection == false && var.environment == k
#  })
#
#  transit_gateway_attachment_id  = var.tgw_attach_id
#  transit_gateway_route_table_id = each.value.id
#
##  depends_on = [aws_ec2_transit_gateway_vpc_attachment_accepter.vpc]
#}
#
#resource "aws_ec2_transit_gateway_route" "selected" {
#  for_each = tomap({
#    for k, v in var.tgw_rts : k => v
#      if var.create_inspection == false && var.is_inspection == false && var.environment != k
#  })
#
#  destination_cidr_block         = contains(split("-", var.vpc_name), "Egress") ? "0.0.0.0/0" : var.vpc_cidr
#  transit_gateway_attachment_id  = var.tgw_attach_id
#  transit_gateway_route_table_id = each.value.id
#
##  # need to check whether this depends_on is necessary or not
##  depends_on = [aws_ec2_transit_gateway_route_table_association.spoke_rt]
#}
