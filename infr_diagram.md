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