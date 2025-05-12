resource "aws_ecr_repository" "backend" {
    name = "/${var.project_name}/${var.environemnt}/backend"
    image_tag_mutability = "MUTTABLE"
    force_delete = true
    image_scanning_configuration {
      scan_on_push = true
    }
  
}
resource "aws_ecr_repository" "frontend" {
    name = "/${var.project_name}/${var.environemnt}/frontend"
    image_tag_mutability = "MUTTABLE"
    force_delete = true
    image_scanning_configuration {
      scan_on_push = true
    }
  
}