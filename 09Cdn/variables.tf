variable "project_name" {
    default = "micro"
  
}
variable "environment" {
    default = "dev"
  
}
variable "common_tags" {
    default = {
        project = "micro"
        terraform = "true"
        environment = "dev"
    }
  
}
variable "frontend_tags" {
    default = {
        Component = "frontend"
    }
  
}
variable "zone_name" {
    default = "cheswini.shop"
  
}