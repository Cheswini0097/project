variable "project_name" {
    default = "micro"
  
}
variable "environemnt" {
    default = "dev"
  
}
variable "common_tags" {
    default = {
        project = "micro"
        environemnt = "dev"
        terraform = "true"
    }
  
}
variable "ingress_alb_tags" {
    default = {
        Component = "Web_alb"
    }
  
}
variable "zone_name" {
    default = "cheswini.shop"
  
}