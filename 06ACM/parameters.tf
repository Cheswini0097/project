resource "aws_ssm_parameter" "https_certificate_arn" {
    name = "/${var.project_name}/${var.environemnt}/https_certificate_arn"
    type = "String"
    value = aws_acm_certificate.micro.arn
  
}
