## Terraform Security Group Architecture

```mermaid
graph TD
  Internet([Internet])
  VPC([VPC 10.0.0.0/16])

  Bastion[Bastion SG]
  Node[Node SG]
  MySQL[MySQL SG]
  EKS[EKS Control Plane SG]
  ALB[Ingress ALB SG]

  Internet -->|22/tcp| Bastion
  Internet -->|443/tcp| ALB

  Bastion -->|22/tcp| Node
  Bastion -->|3306/tcp| MySQL
  Bastion -->|443/tcp| EKS

  ALB -->|30000-32767/tcp| Node

  Node -->|3306/tcp| MySQL
  Node -->|All| EKS
  EKS -->|All| Node

  VPC -->|All| Node
