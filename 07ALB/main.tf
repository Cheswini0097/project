module "ingress_alb" {
    source = "terraform-aws-modules/alb/aws"

    internal = false
    name = "${local.resource_name}-ingres_alb"
    vpc_id = local.vpc_id
    subnets = local.public_subnet_ids
    security_groups = [data.aws_ssm_parameter.ingress_alb_sg_id]
    create_security_group = false
    enable_deletion_protection = false
    tags = merge(
        var.common_tags,
        var.ingress_alb_tags,
    )
  
}
resource "aws_lb_listener" "https" {
    load_balancer_arn = module.ingress_alb.arn
    port = "80"
    protocol = "HTTP"

    default_action {
      type = "fixed-response"

      fixed_response {
        content_type = "text/html"
        message_body = "<h1>Hello, I am from Web ALB HTTPS</h1>"
        status_code = "200"

      }
    }
  
}
module "records" {
    source = "terraform-aws-modules/route53/aws//modules/records"

    zone_name = var.zone_name
    records = [
        {
            name = "micro-${var.environemnt}"
            type = "A"
            alias = {
                name = module.ingres_alb.dns_name
                zone_id = module.ingres_alb.zone_id
            }
            allow_overwrite = true

        }
    ]
  
}
resource "aws_lb_target_group" "micro" {
    name = local.resource_name
    port = 80
    protocol = "HTTP"
    vpc_id = local.vpc_id
    target_type = "ip"

    health_check {
      healthy_threshold = 2
      unhealthy_threshold = 2
      interval = 5
      matcher = "200-299"
      path = "/"
      port = 8080
      protocol = "HTTP"
      timeout = 4

    }
  
}
resource "aws_lb_listener_rule" "frontend" {
  listener_arn = aws_lb_listener.https.arn
  priority     = 100 # low priority will be evaluated first

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.expense.arn
  }

  condition {
    host_header {
      values = ["expense-${var.environemnt}.${var.zone_name}"] #expense-dev.daws81s.online
    }
  }
}