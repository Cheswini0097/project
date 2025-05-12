variable "mysql_sg_tags" {
  default = {
    Component = "mysql"
  }

}
variable "project_name" {
  default = "micro"

}
variable "environment" {
  default = "dev"

}
variable "common_tags" {
  default = {
    terraform   = "true"
    project     = "micro"
    environment = "dev"
  }

}
variable "backend_sg_tags" {
  default = {
    Component = "backend_sg"
  }

}
variable "node_sg_tags" {
  default = {
    Component = "node_sg"
  }

}
variable "ansible_sg_tags" {
  default = {
    Component = "ansible_sg"
  }

}
variable "sg_tags" {
  default = {
    Component = "bastion_sg"
  }

}
variable "eks_control_plane_sg_tags" {
  default = {
    Component = "eks_control_plane"
  }

}
variable "ingress_alb_sg_tags" {
  default = {
    Component = "ingress_alb"
  }

}



