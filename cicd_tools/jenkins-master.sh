#!/bin/bash

sudo curl -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key


sudo yum install fontconfig java-21-
sudo yum install jenkins -y



#resize the disk from 20GB 

growpart /dev/nvme0n1 4
lvextend -L +10G /dev/RootVG/rootVol
lvextend -L +10G /dev/mapper/RootVG-varVol
lvextend -l +100%FREE /dev/mapper/RootVG-varTmpVol

xfs_growfs /
xfs_growfs /var/tmp
xfs_growfs /var

systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins
