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