#!/bin/bash

#resize the disk from 20 GB to 50 GB

growpart /dev/nvme0n1 4

lvextend -L +10G /dev/mapper/RootVG-homeVol
lvextend -L +10G /dev/mapper/RootVG-varvol
lvextend -l +100%FREE /dev/mapper/RootVG-varTmpVol


xfs_growfs /home
xfs_growfs /var/tmp
xfs_growfs /var

sudo yum install fontconfig java-21-openjdk
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform
sudo dnf module disable nodejs -y
sudo dnf module enable nodejs:20 -y
sudo dnf install nodejs -y
yum install zip -y


#Docker instalation
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user


#helm chart configuration file
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh


# Maven for Java projects

sudo dnf install maven -y

# Python for python projects

dnf install python3.11 gcc python3-devel -y





