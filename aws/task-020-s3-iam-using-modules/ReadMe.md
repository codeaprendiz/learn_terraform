## Objective 


1) To create S3 bucket using an S3 git module `git::https://github.com/cloudposse/terraform-aws-s3-bucket.git?ref=master`
2) Create one admin user using this module. The admin user should have all access priviledges to the S3 bucket.
3) Get the `data` of the created bucket to create a `bucket` object
4) Create one DEV IAM user with limited access priviledges to the S3 bucket. You can use the following
module for the same `git::https://github.com/cloudposse/terraform-aws-iam-s3-user.git?ref=master`
5) Print the access keys and the name of the bucket at the end.
- Init

```bash
$ terraform init 
Initializing modules...
Downloading git::https://github.com/cloudposse/terraform-aws-iam-s3-user.git?ref=master for data-backup-bucket-user...
- data-backup-bucket-user in .terraform/modules/data-backup-bucket-user
.
.
.

```

- Plan

```                                 
$ terraform plan 
provider.aws.region
  The region where AWS operations will take place. Examples
  are us-east-1, us-west-2, etc.

  Enter a value: us-east-1
.
.
.
Plan: 8 to add, 0 to change, 0 to destroy.
```


- Apply
```bash
$ terraform apply 
.
.
.
Apply complete! Resources: 8 added, 0 changed, 0 destroyed.

Outputs:

aws-admin-data-access-key = ****************
aws-admin-data-secret-key = *****************
aws-developer-data-access-key = ******************
aws-developer-data-secret-key = ****************
aws-s3-data-bucket-url = data-dev-backup-bucket.s3.amazonaws.com

```



- Destroy
```bash
$ terraform destroy                                 
Destroy complete! Resources: 8 destroyed.
```