resource "aws_ssm_parameter" "web_alb_listener_arn" {
  # /expense/dev/mysql_sg_id
  name  = "/${var.project_name}/${var.environemnt}/web_alb_listener_arn"
  type  = "String"
  value = aws_lb_listener.https.arn
}
