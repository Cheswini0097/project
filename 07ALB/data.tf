data "aws_ssm_parameter" "vpc_id" {
    name = "/${var.project_name}/${var.environemnt}/vpc_id"
  
}
data "aws_ssm_parameter" "public_subnet_ids" {
    name = "{var.project_name}/${var.environemnt}/public_subnet_ids"
  
}
data "aws_ssm_parameter" "ingress_alb_sg_id" {
    name = "{var.project_name}/${var.environemnt}/ingress_alb_sg_id"
  
}
data "aws_ssm_certificate" "https_certificate_arn" {
    name = "{var.project_name}/${var.environemnt}/https_certificate_arn"
  
}