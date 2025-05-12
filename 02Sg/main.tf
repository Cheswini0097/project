module "mysql_sg" {
  source       = "git::https://github.com/Cheswini0097/terraform_sg_module.git?ref=main"
  project_name = var.project_name
  environment  = var.environment
  vpc_id       = local.vpc_id
  common_tags  = var.common_tags
  sg_tags      = var.mysql_sg_tags
  sg_name      = "mysql"


}

module "node_sg" {
  source       = "git::https://github.com/Cheswini0097/terraform_sg_module.git?ref=main"
  project_name = var.project_name
  sg_tags      = var.node_sg_tags
  sg_name      = "node_sg"
  common_tags  = var.common_tags
  environment  = var.environment
  vpc_id       = local.vpc_id


}

module "bastion_sg" {
  project_name = var.project_name
  source       = "git::https://github.com/Cheswini0097/terraform_sg_module.git?ref=main"
  vpc_id       = local.vpc_id
  environment  = var.environment
  sg_name      = "bastion_sg"
  common_tags  = var.common_tags
  sg_tags      = var.backend_sg_tags


}



resource "aws_security_group_rule" "ingress_alb_https" {
  type              = "ingress"
  from_port         = "443"
  to_port           = "443"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.ingress_alb_sg.id


}
resource "aws_security_group_rule" "node_ingress_alb" {
  type                     = "ingress"
  from_port                = 30000
  to_port                  = 32767
  protocol                 = "tcp"
  security_group_id        = module.node_sg.id
  source_security_group_id = module.ingress_alb_sg.id

}
resource "aws_security_group_rule" "node_eks_control_plane" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = module.node_sg.id
  source_security_group_id = module.eks_control_plane_sg.id

}
resource "aws_security_group_rule" "eks_control_plane_node" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = module.node_sg.id
  source_security_group_id = module.eks_control_plane_sg.id

}
resource "aws_security_group_rule" "eks_control_plane_bastion" {
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = module.bastion_sg.id
  source_security_group_id = module.eks_control_plane_sg.id

}
resource "aws_security_group_rule" "node_vpc" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.bastion_sg.id
  cidr_blocks       = ["10.0.0.0/16"]

}
resource "aws_security_group_rule" "node_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = module.bastion_sg.id
  security_group_id        = module.node_sg.id
}
resource "aws_security_group_rule" "mysql_bastion" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = module.bastion_sg.id
  security_group_id        = module.mysql_sg.id
}
resource "aws_security_group_rule" "bastion_public" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.bastion_sg.id
}
resource "aws_security_group_rule" "mysql_node" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = module.node_sg.id
  security_group_id        = module.mysql_sg.id
}
module "eks_control_plane_sg" {
    source = "git::https://github.com/Cheswini0097/terraform_sg_module.git?ref=main"
    environment = var.environment
    project_name = var.project_name
    sg_name = "eks_control_plane"
    vpc_id = local.vpc_id
    common_tags = var.common_tags
    sg_tags = var.eks_control_plane_sg_tags


  
}
module "ingress_alb_sg" {
    source = "git::https://github.com/Cheswini0097/terraform_sg_module.git?ref=main"
    project_name = var.project_name
    environment = var.environment
    vpc_id = local.vpc_id
    sg_name = "ingress_alb"
    common_tags = var.common_tags
    sg_tags = var.ingress_alb_sg_tags
  
}
module "ansible_sg" {
    source = "git::https://github.com/Cheswini0097/terraform_sg_module.git?ref=main"
    sg_name = "ansible_sg"
    vpc_id = local.vpc_id
    environment = var.environment
    project_name = var.project_name
    common_tags = var.common_tags
    sg_tags = var.ansible_sg_tags
  
}
