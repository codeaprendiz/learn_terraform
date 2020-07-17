## Objective: To create a kubernetes cluster using typhoon (IN PROGRESS)

[Link Referred](https://typhoon.psdn.io/flatcar-linux/aws/)
[Git Repo](https://github.com/poseidon/typhoon/)

### Steps

- Create a DNS zone using task-011-route53 and get the zone name and zone_id
- Assign those values in the variables file in this task

- init
```bash
$ terraform init
```

- plan
```bash
$ terraform plan
```

- apply
```bash
$ terraform apply
```

ERROR :( keeps on continuing
```bash
Typhoon kubernetes Error :  module.tempest.null_resource.bootstrap: Still creating... [22m0s elapsed]
```