module "jenkins_master" {
    source = "terraform-aws-modules/ec2-instance/aws"
    name = "jenkins"
    instance_type = "t3.small"
    vpc_security_group_ids = ["sg-0fea5e49e962e81c9"]
    subnet_id = "subnet-0ea509ad4cba242d7"
    ami = data.aws_ami.micro.id
    user_data = file("jenkins-master.sh")
    tags = {
        Name = "jenkins_master"
    }

    #we need to define root volume size and type,
    root_block_device = [
        {
            volume_size = 50
            volume_type = "gp3"
            delete_on_termination = true

        }
    ]

  
}


module "jenkins_agent" {
    source = "terraform-aws-modules/ec2-instance/aws"
    name = "jenkins_agent"
    ami = data.aws_ami.micro.id
    user_data = file("jenkins-agent.sh")
    vpc_security_group_ids = ["sg-0fea5e49e962e81c9"]
    subnet_id = "subnet-0ea509ad4cba242d7"
    instance_type = "t3.micro"
    tags = {
        Name = "jenkins-agent"
    }


    root_block_device = [
        {
        volume_size = 50
        volume_type = "gp3"
        delete_on_termination = true
        }
    ]
  
}

module "micro_records" {
    source = "terraform-aws-modules/route53/aws//modules/records"
    version = "~> 2.0"

    zone_name = var.zone_name

    records = [
        {
            name = "jenkins_master"
            type = "A"
            ttl = 1
            records = [
                module.jenkins_master.public_ip
            ]
            allow_overwrite = true


        },
        {
            name = "jenkins_agent"
            type = "A"
            ttl = 1
            records = [
                module.jenkins_agent.public_ip
            ]
            allow_overwrite = true
        }
    ]
  
}