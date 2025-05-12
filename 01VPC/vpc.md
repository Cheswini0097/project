graph TD
    %% VPC Block
    VPC[VPC<br/>10.0.0.0/16]

    %% Subnets Subgraph
    subgraph Subnets [Subnets in VPC]
      Public[Public Subnets<br/>10.0.1.0/24<br/>10.0.2.0/24]
      Private[Private Subnets<br/>10.0.11.0/24<br/>10.0.12.0/24]
      Database[Database Subnets<br/>10.0.21.0/24<br/>10.0.22.0/24]
    end

    %% Connect VPC to its Subnets
    VPC --> Public
    VPC --> Private
    VPC --> Database

    %% Optional Peering
    Peer[Peering Connection<br/>(if required)]
    VPC --- Peer

    %% SSM Parameters Block
    subgraph SSM [AWS SSM Parameter Store]
        VPCID["vpc_id<br/><code>/micro/dev/vpc_id</code>"]
        PublicSSM["public_subnet_ids<br/><code>/micro/dev/public_subnet_ids</code>"]
        PrivateSSM["private_subnet_ids<br/><code>/micro/dev/private_subnet_ids</code>"]
        DatabaseSSM["database_subnet_ids<br/><code>/micro/dev/database_subnet_ids</code>"]
        DBSubnetGrp["database_subnet_group_name<br/><code>/micro/dev/database_subnet_group_name</code>"]
    end

    %% Connect VPC Module outputs to SSM Parameters
    VPC --> VPCID
    Public --> PublicSSM
    Private --> PrivateSSM
    Database --> DatabaseSSM
    Database --> DBSubnetGrp
