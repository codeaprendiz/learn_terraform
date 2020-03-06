## OBJECTIVE : 
- To set up a custom VPC with given CIDR with attached internet gateway. 
- Associate a subnet (with subset CIDR) to the VPC.
- Create route-tables to make the subnet public
- Create security group (for ssh) and keypair (for ssh)
- Start EC2 instance in public subnet and login into the instance.

#### Before executing you should have created AWS_ACCESS_KEY_ID AND AWS_SECRET_ACCESS_KEY with administrative privileges.

- Export the keys in your current shell by using following commands

```bash
export AWS_ACCESS_KEY_ID=YOUR_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=YOUR_SECRET_ACCESS_KEY
```

#### The following sequence of commands will be executed.
> terraform init

```bash
$ terraform init

Initializing the backend...

Initializing provider plugins...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.aws: version = "~> 2.52"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```


> terraform plan

```bash
$ terraform plan
provider.aws.region
  The region where AWS operations will take place. Examples
  are us-east-1, us-west-2, etc.

  Enter a value: us-east-2

Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.testInstance will be created
  + resource "aws_instance" "testInstance" {
      + ami                          = "ami-0cf31d971a3ca20d6"
      + arn                          = (known after apply)
      + associate_public_ip_address  = (known after apply)
      + availability_zone            = (known after apply)
      + cpu_core_count               = (known after apply)
      + cpu_threads_per_core         = (known after apply)
      + get_password_data            = false
      + host_id                      = (known after apply)
      + id                           = (known after apply)
      + instance_state               = (known after apply)
      + instance_type                = "t2.micro"
      + ipv6_address_count           = (known after apply)
      + ipv6_addresses               = (known after apply)
      + key_name                     = "publicKey"
      + network_interface_id         = (known after apply)
      + password_data                = (known after apply)
      + placement_group              = (known after apply)
      + primary_network_interface_id = (known after apply)
      + private_dns                  = (known after apply)
      + private_ip                   = (known after apply)
      + public_dns                   = (known after apply)
      + public_ip                    = (known after apply)
      + security_groups              = (known after apply)
      + source_dest_check            = true
      + subnet_id                    = (known after apply)
      + tags                         = {
          + "Environment" = "Production"
        }
      + tenancy                      = (known after apply)
      + volume_tags                  = (known after apply)
      + vpc_security_group_ids       = (known after apply)

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

  # aws_internet_gateway.igw will be created
  + resource "aws_internet_gateway" "igw" {
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Environment" = "Production"
        }
      + vpc_id   = (known after apply)
    }

  # aws_key_pair.ec2key will be created
  + resource "aws_key_pair" "ec2key" {
      + fingerprint = (known after apply)
      + id          = (known after apply)
      + key_name    = "publicKey"
      + key_pair_id = (known after apply)
      + public_key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDLmviSRpF6tvGLpMExQZ94I9mqhVtINyjH1rEeDwSPB+1v00P608klF++uhRvREUyNID/i2w1cwjOi9H1isoZNoVaSKdiVIqEIp2HaIhTtKTo+NqVCdIeQXnwK2bS/OeIVScYn6YZjPAcWgMk0GH1q9zIn+sz1own3QxD4qysvoqN5bD9BxsDboLxKw803jJlcjRiSrdWbmEOoIXrEbv9t99ZxsYLIDIDZJskiAcvqKEywt+dRpvM/49c3pJ5JVluNNJypTObM2GI4piC1TcOL6xMgs+UsbDgEsHPYHXZnYENX/GGXYJcdDITCtMHap8O33EvOh5piIXHF6kQEgXDRCE61AEWnHQeGERJtTqlCiBAUUDNzAHt9UjZJVmioLJ+vLeW9M3KjUCh5MWxZ7hIJ7xvLxermNlRahzTlaGLhvkiyoaUyuh+qhpBIfCv7lioLaagv9jegc6AErMqDGFgPieJh479z+QqagPODwP0UB0jt07b7V/3csImEiy1aKY2wOQriXCkcAnSvKuAuiT2a2gOfPMJlzVd8hLrA2f5YuLWLm8p8rLXvkNSJ8YKNbQx1z5pII9R54YEOixjgp9bDNJL39ekrxlzLj72gpWg+AF+FFVNJ4gfZDjBSxUbkPhox7jhIV4DOCvc6W5uLkCXe62R9aNn1/Hkxcq99eoen1w== codeaprendiz@gmail.com"
    }

  # aws_route_table.rtb_public will be created
  + resource "aws_route_table" "rtb_public" {
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + cidr_block                = "0.0.0.0/0"
              + egress_only_gateway_id    = ""
              + gateway_id                = (known after apply)
              + instance_id               = ""
              + ipv6_cidr_block           = ""
              + nat_gateway_id            = ""
              + network_interface_id      = ""
              + transit_gateway_id        = ""
              + vpc_peering_connection_id = ""
            },
        ]
      + tags             = {
          + "Environment" = "Production"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table_association.rta_subnet_public will be created
  + resource "aws_route_table_association" "rta_subnet_public" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_security_group.sg_22 will be created
  + resource "aws_security_group" "sg_22" {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
        ]
      + name                   = "sg_22"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Environment" = "Production"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_subnet.subnet_public will be created
  + resource "aws_subnet" "subnet_public" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-east-2a"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.1.0.0/24"
      + id                              = (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = true
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Environment" = "Production"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_vpc.vpc will be created
  + resource "aws_vpc" "vpc" {
      + arn                              = (known after apply)
      + assign_generated_ipv6_cidr_block = false
      + cidr_block                       = "10.1.0.0/16"
      + default_network_acl_id           = (known after apply)
      + default_route_table_id           = (known after apply)
      + default_security_group_id        = (known after apply)
      + dhcp_options_id                  = (known after apply)
      + enable_classiclink               = (known after apply)
      + enable_classiclink_dns_support   = (known after apply)
      + enable_dns_hostnames             = true
      + enable_dns_support               = true
      + id                               = (known after apply)
      + instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      + main_route_table_id              = (known after apply)
      + owner_id                         = (known after apply)
      + tags                             = {
          + "Environment" = "Production"
        }
    }

Plan: 8 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

> terraform apply

```bash
$ terraform apply
provider.aws.region
  The region where AWS operations will take place. Examples
  are us-east-1, us-west-2, etc.

  Enter a value: us-east-2


An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.testInstance will be created
  + resource "aws_instance" "testInstance" {
      + ami                          = "ami-0cf31d971a3ca20d6"
      + arn                          = (known after apply)
      + associate_public_ip_address  = (known after apply)
      + availability_zone            = (known after apply)
      + cpu_core_count               = (known after apply)
      + cpu_threads_per_core         = (known after apply)
      + get_password_data            = false
      + host_id                      = (known after apply)
      + id                           = (known after apply)
      + instance_state               = (known after apply)
      + instance_type                = "t2.micro"
      + ipv6_address_count           = (known after apply)
      + ipv6_addresses               = (known after apply)
      + key_name                     = "publicKey"
      + network_interface_id         = (known after apply)
      + password_data                = (known after apply)
      + placement_group              = (known after apply)
      + primary_network_interface_id = (known after apply)
      + private_dns                  = (known after apply)
      + private_ip                   = (known after apply)
      + public_dns                   = (known after apply)
      + public_ip                    = (known after apply)
      + security_groups              = (known after apply)
      + source_dest_check            = true
      + subnet_id                    = (known after apply)
      + tags                         = {
          + "Environment" = "Production"
        }
      + tenancy                      = (known after apply)
      + volume_tags                  = (known after apply)
      + vpc_security_group_ids       = (known after apply)

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

  # aws_internet_gateway.igw will be created
  + resource "aws_internet_gateway" "igw" {
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Environment" = "Production"
        }
      + vpc_id   = (known after apply)
    }

  # aws_key_pair.ec2key will be created
  + resource "aws_key_pair" "ec2key" {
      + fingerprint = (known after apply)
      + id          = (known after apply)
      + key_name    = "publicKey"
      + key_pair_id = (known after apply)
      + public_key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDLmviSRpF6tvGLpMExQZ94I9mqhVtINyjH1rEeDwSPB+1v00P608klF++uhRvREUyNID/i2w1cwjOi9H1isoZNoVaSKdiVIqEIp2HaIhTtKTo+NqVCdIeQXnwK2bS/OeIVScYn6YZjPAcWgMk0GH1q9zIn+sz1own3QxD4qysvoqN5bD9BxsDboLxKw803jJlcjRiSrdWbmEOoIXrEbv9t99ZxsYLIDIDZJskiAcvqKEywt+dRpvM/49c3pJ5JVluNNJypTObM2GI4piC1TcOL6xMgs+UsbDgEsHPYHXZnYENX/GGXYJcdDITCtMHap8O33EvOh5piIXHF6kQEgXDRCE61AEWnHQeGERJtTqlCiBAUUDNzAHt9UjZJVmioLJ+vLeW9M3KjUCh5MWxZ7hIJ7xvLxermNlRahzTlaGLhvkiyoaUyuh+qhpBIfCv7lioLaagv9jegc6AErMqDGFgPieJh479z+QqagPODwP0UB0jt07b7V/3csImEiy1aKY2wOQriXCkcAnSvKuAuiT2a2gOfPMJlzVd8hLrA2f5YuLWLm8p8rLXvkNSJ8YKNbQx1z5pII9R54YEOixjgp9bDNJL39ekrxlzLj72gpWg+AF+FFVNJ4gfZDjBSxUbkPhox7jhIV4DOCvc6W5uLkCXe62R9aNn1/Hkxcq99eoen1w== codeaprendiz@gmail.com"
    }

  # aws_route_table.rtb_public will be created
  + resource "aws_route_table" "rtb_public" {
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + cidr_block                = "0.0.0.0/0"
              + egress_only_gateway_id    = ""
              + gateway_id                = (known after apply)
              + instance_id               = ""
              + ipv6_cidr_block           = ""
              + nat_gateway_id            = ""
              + network_interface_id      = ""
              + transit_gateway_id        = ""
              + vpc_peering_connection_id = ""
            },
        ]
      + tags             = {
          + "Environment" = "Production"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table_association.rta_subnet_public will be created
  + resource "aws_route_table_association" "rta_subnet_public" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_security_group.sg_22 will be created
  + resource "aws_security_group" "sg_22" {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
        ]
      + name                   = "sg_22"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Environment" = "Production"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_subnet.subnet_public will be created
  + resource "aws_subnet" "subnet_public" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-east-2a"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.1.0.0/24"
      + id                              = (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = true
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Environment" = "Production"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_vpc.vpc will be created
  + resource "aws_vpc" "vpc" {
      + arn                              = (known after apply)
      + assign_generated_ipv6_cidr_block = false
      + cidr_block                       = "10.1.0.0/16"
      + default_network_acl_id           = (known after apply)
      + default_route_table_id           = (known after apply)
      + default_security_group_id        = (known after apply)
      + dhcp_options_id                  = (known after apply)
      + enable_classiclink               = (known after apply)
      + enable_classiclink_dns_support   = (known after apply)
      + enable_dns_hostnames             = true
      + enable_dns_support               = true
      + id                               = (known after apply)
      + instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      + main_route_table_id              = (known after apply)
      + owner_id                         = (known after apply)
      + tags                             = {
          + "Environment" = "Production"
        }
    }

Plan: 8 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_key_pair.ec2key: Creating...
aws_vpc.vpc: Creating...
aws_key_pair.ec2key: Creation complete after 2s [id=publicKey]
aws_vpc.vpc: Still creating... [10s elapsed]
aws_vpc.vpc: Creation complete after 13s [id=vpc-031e7cd73a5022c84]
aws_internet_gateway.igw: Creating...
aws_subnet.subnet_public: Creating...
aws_security_group.sg_22: Creating...
aws_subnet.subnet_public: Creation complete after 4s [id=subnet-0d5b8d6e42ff72e6b]
aws_internet_gateway.igw: Creation complete after 5s [id=igw-008411173de344dff]
aws_route_table.rtb_public: Creating...
aws_security_group.sg_22: Creation complete after 8s [id=sg-03532570f79bedd04]
aws_instance.testInstance: Creating...
aws_route_table.rtb_public: Creation complete after 5s [id=rtb-0153cb123baca35e7]
aws_route_table_association.rta_subnet_public: Creating...
aws_route_table_association.rta_subnet_public: Creation complete after 1s [id=rtbassoc-03a6c01841e11f82f]
aws_instance.testInstance: Still creating... [10s elapsed]
aws_instance.testInstance: Still creating... [20s elapsed]
aws_instance.testInstance: Still creating... [30s elapsed]
aws_instance.testInstance: Creation complete after 31s [id=i-0eb8623ba7580e86d]

Apply complete! Resources: 8 added, 0 changed, 0 destroyed.
```



- Now login into the instance

```bash
$ ssh ec2-user@3.14.246.44                        
The authenticity of host '3.14.246.44 (3.14.246.44)' can't be established.
ECDSA key fingerprint is SHA256:B0bvqitocFpOItQbzZkFCXBrZV9xdb3b0VRwb/Ked0s.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '3.14.246.44' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
48 package(s) needed for security, out of 336 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-10-1-0-247 ~]$ 
```

#### Now let's login into the console and check

- VPC screen

![](.README_images/vpc_screen.png)

- CIDR in VPC

![](.README_images/CIDR_created_VPC.png)

- Internet Gateways

![](.README_images/internet_gateway_screen.png)

- Subnet created

![](.README_images/subnet_screen.png)

- Route table association

![](.README_images/route_table_association.png)

- Network ACLs

![](.README_images/network_acl_screen.png)

- Route Tables

![](.README_images/route_table_screen.png)

- Login EC2 dashboard

![](.README_images/login_ec2_dashboard.png)

- EC2 instance screen

![](.README_images/ec2_instance_screen.png)

- Instance Tag

![](.README_images/instance_tag_screen.png)

- Security groups

![](.README_images/security_groups_screen.png)

- Volumes Screen

![](.README_images/volumes_screen.png)


- Finally Resources Screen

![](.README_images/resources_screen.png)

