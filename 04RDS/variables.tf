variable "project_name" {
    default = "micro"

  
}
variable "environment" {
    default = "dev"
  
}
variable "common_tags" {
    default = {
        project = "micro"
        environemnt = "dev"
        terraform = "true"
    }
  
}
variable "rds_tags" {
    default = {
        Component = "RDS"
    }
  
}
variable "zone_name" {
    default = "cheswini.shop"
  
}
