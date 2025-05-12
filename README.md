Here is how you can integrate the content of the `infrdiagram.mmd` file into your README file:

```markdown
# Infrastructure Diagram

This repository's infrastructure is visualized using a **Mermaid** diagram. Below is an overview of the infrastructure components and their relationships:

```mermaid
flowchart TD
    A[Terraform Configuration] --> B[VPC Module]
    B --> C[Public Subnets]
    B --> D[Private Subnets]
    B --> E[Database Subnets]
    A --> F[Security Groups]
    F --> G[MySQL SG]
    F --> H[Node SG]
    F --> I[Bastion SG]
    F --> J[EKS Control Plane SG]
    F --> K[Ingress Rules]
    F --> L[Egress Rules]
    A --> M[SSM Parameters]
    M --> N[Resource IDs]

    subgraph Shell Script Setup
        O[Bastion Setup]
        O --> P[Docker Installation]
        O --> Q[EKSCTL Installation]
        O --> R[Kubectl Installation]
        O --> S[Helm Installation]
        O --> T[K9S Installation]
    end

    A --> O
    O --> U[Kubernetes Cluster Management]

    style A fill:#f9f,stroke:#333,stroke-width:2px
    style Shell fill:#ccf,stroke:#333,stroke-width:2px
```

## Diagram Description

1. **Terraform Configuration**:
   - Sets up VPC, Security Groups, and other cloud resources.
   - Includes various modules like public subnets, private subnets, database subnets, and SSM parameters.

2. **Security Groups**:
   - Configured for MySQL, Nodes, Bastion, and EKS Control Plane.
   - Includes Ingress and Egress rules for controlling network traffic.

3. **Shell Script Setup**:
   - Automates the installation of tools on the bastion host:
     - Docker
     - `eksctl`
     - `kubectl`
     - Helm
     - k9s

4. **Kubernetes Cluster Management**:
   - Managed using tools installed on the bastion host.

Use the above diagram as a reference for understanding the infrastructure layout and its dependencies.
