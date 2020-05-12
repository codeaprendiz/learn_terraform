## Objective 

1) To create a custom VPC with CIDR block 10.0.0.0/16
2) To create 3 public subnets (main-public-1, main-public-2, main-public-3). Accordingly choose their CIDR blocks.
3) To create 3 private subnets (main-private-1, main-private-2, main-private-3). Accordingly choose their CIDR blocks.
4) To create an internet gateway resource
5) To create a main-public route table to have a route to internet (0.0.0.0/0) via the internet gateway and associate this route table to all the 3 public subnets.
6) To create an elastic IP, NAT gateway and associate that elastic IP with NAT gateway
7) To create a private route table to have a route to internet (0.0.0.0/0) via the NAT gateway. Associate this private route table to all the 3 private subnets.
8) To launch an EC2 instance in the main-public-1 subnet. To login into this instance, check its private IP and routes.


## Lets Begin



- init
```bash
terraform init
```

- plan
```bash
$ terraform plan -var-file=../../terraform.tfvars
.
.
.
Plan: 21 to add, 0 to change, 0 to destroy.
```


- apply
```bash
$ terraform apply -var-file=../../terraform.tfvars
.
.
.
Apply complete! Resources: 21 added, 0 changed, 0 destroyed.
```


- login into the instance so created. Note the private IP after login.
```bash
$ ssh -i ~/.ssh/id_rsa ubuntu@3.94.171.138                                                
.
.
.
ubuntu@ip-10-0-1-132:~$
```

- private IP of logged in instance
```bash
ubuntu@ip-10-0-1-132:~$ ifconfig | egrep inet
          inet addr:10.0.1.132  Bcast:10.0.1.255  Mask:255.255.255.0
```

- routes inside the logged in instance
```bash
ubuntu@ip-10-0-1-132:~$ route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         10.0.1.1        0.0.0.0         UG    0      0        0 eth0
10.0.1.0        0.0.0.0         255.255.255.0   U     0      0        0 eth0
```

- destroy
```bash
$ terraform destroy -var-file=../../terraform.tfvars

Destroy complete! Resources: 21 destroyed.
```