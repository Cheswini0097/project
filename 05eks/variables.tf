variable "project_name" {
  default = "micro"

}
variable "environemnt" {
  default = "dev"

}
variable "common_tags" {
  default = {
    project     = "micro"
    environment = "dev"
    terraform   = "true"
  }

}
variable "pub_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCpwRCIt1VFUAeoad2DO+cT7cPsW4K9YqbkvCIdlBj8KEL6IOR2zzFQth3fdMvUnoMpfgAg5d625RCZW7RbNoiDBsAHxXNCkUlFUp/yNedSBEt0kOlr4dH+re+hoC/Cr6WJdYwBy5EmNvBWFHGfyrBVdheOfvDQri/o/RGIRrj/vjbxYPSyYGTurnAzRD6gIoU1T5tHLzmCXq1LDlBuEYuFpMK5r0g3NsiLKVLBIJTg2QCMozJkCytGchn3XAB7sKeW3CRBbLoxayTKQCgmnI7HqBWgeSGuZ6A+g77G5VTbmWt/XCofQxXLJGO7THL4S6HDEEO8OqeqObjMIGZd+HBHJmBMoZq6etXdd4diLX+/CKENq2ZGHTsHeof+5fadvxhugv+WzZ+ucmMQzU4cWFiWOJaMXjdSYmNrj9+pkMjbA/XLk6J3s235yvAgZanSdttFLtQXf19LAZfPUpaXCCt1RiLFCYgCfqq3x8DGVtoseyxY79N06xrTsYuPV2UFVFGGqcowc5QUqRWU+n88Y/1mwK+p3f6Hs2P6nswzYteS+kpyIwhenPOQWA6S7pMn+OvAYa2booF24jKa19KkU6BeJuB8bAcTNucharyynvBlkdWt4Juh0pl2QVc0nUVObY5x7Zq6N8jW25ZbFm+SxULW6Ij7E7rTwT7iUKOZlEhYKQ== eks-key"

}
