variable "project_name" {
    default = "micro"
  
}
variable "environment" {
    default = "dev"
  
}
variable "common_tags" {
    default = {
        project = "micro"
        environment = "dev"

    }
  
}
variable "bastion_tags" {
    default = {
        Component = "bastion"
    }
  
}