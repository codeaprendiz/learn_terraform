## Objective 

> NOT WORKING AT THE MOMENT

1) To create A record using resource type aws_route53_record in terraform. The record should resolve to your public IP.


- Find you public IP address. Add this to 10-route53.tf. We will create a record that will resolve to your public IP.
```bash
$ curl ifconfig.me
92.97.88.125
```

- Init

```bash
$ terraform init   
```

- Plan

```                                 
$ terraform plan -var-file=../../terraform.tfvars
.
.
.
An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_route53_record.server1-record will be created
  + resource "aws_route53_record" "server1-record" {
      + allow_overwrite = (known after apply)
      + fqdn            = (known after apply)
      + id              = (known after apply)
      + name            = "server1.newtech.academy"
      + records         = [
          + "92.97.88.125",
        ]
      + ttl             = 300
      + type            = "A"
      + zone_id         = (known after apply)
    }

  # aws_route53_zone.devops-academy will be created
  + resource "aws_route53_zone" "devops-academy" {
      + comment       = "Managed by Terraform"
      + force_destroy = false
      + id            = (known after apply)
      + name          = "devops.academy"
      + name_servers  = (known after apply)
      + vpc_id        = (known after apply)
      + vpc_region    = (known after apply)
      + zone_id       = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.
.
.
.
```


- Apply
```bash
$ terraform apply -var-file=../../terraform.tfvars
.
.
.
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

ns-servers = [
  "ns-1187.awsdns-20.org",
  "ns-1902.awsdns-45.co.uk",
  "ns-212.awsdns-26.com",
  "ns-548.awsdns-04.net",
]
```


- try dig command to check if its taken effect

```bash
$ dig server1.devops.academy

; <<>> DiG 9.10.6 <<>> server1.devops.academy
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NXDOMAIN, id: 52071
;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 1, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;server1.devops.academy.                IN      A

;; AUTHORITY SECTION:
devops.academy.         839     IN      SOA     ns-1155.awsdns-16.org. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400

;; Query time: 5 msec
;; SERVER: 192.168.1.1#53(192.168.1.1)
;; WHEN: Sat May 16 14:10:01 +04 2020
;; MSG SIZE  rcvd: 136

```