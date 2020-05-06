
- Generate the keys (the ones commited are for sample only)
```bash
$ ssh-keygen -f mykey
```


```bash
$ terraform get        
Downloading github.com/wardviaene/terraform-consul-module.git?ref=terraform-0.12 for consul...
- consul in .terraform/modules/consul
```


- Module that will get downloaded after this would be
```bash
$ cd .terraform
$ tree                 
.
└── modules
    ├── consul
    │   ├── README.md
    │   ├── consul.tf
    │   ├── outputs.tf
    │   ├── shared
    │   │   └── scripts
    │   │       ├── debian_consul.service
    │   │       ├── debian_upstart.conf
    │   │       ├── install.sh
    │   │       ├── ip_tables.sh
    │   │       ├── rhel_consul.service
    │   │       ├── rhel_upstart.conf
    │   │       └── service.sh
    │   └── variables.tf
    └── modules.json

```


- Plan
```bash
terraform plan -var-file=../../terraform.tfvars

```

- Apply
```bash
terraform apply -var-file=../../terraform.tfvars
```

- You can login into the instance using mykey
```bash
$ ssh -i mykey ubuntu@54.87.20.78                                                        
.
.
.
ubuntu@ip-172-31-39-91:~$ 
```


- Destroy