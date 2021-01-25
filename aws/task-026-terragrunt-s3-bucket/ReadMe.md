#### We will create S3 bucket using cloudposse module. We will also have IAM user which will have admin priviledges on S3 bucket


- Uploading object
```bash
AWS_ACCESS_KEY_ID=<access-key-id>  AWS_SECRET_ACCESS_KEY=<secret-access-key>  aws s3 cp hello.txt s3://test-dev-backup-bucket/hello.txt
upload: ./hello.txt to s3://test-dev-backup-bucket/hello.txt    
```

- Get the object
```bash
$ AWS_ACCESS_KEY_ID=<access-key-id> AWS_SECRET_ACCESS_KEY=<secret-access-key> aws s3 cp  s3://test-dev-backup-bucket/hello.txt .
download: s3://test-dev-backup-bucket/hello.txt to ./hello.txt 
```

- list files
```bash
$ AWS_ACCESS_KEY_ID=<access-key-id> AWS_SECRET_ACCESS_KEY=<secret-access-key> aws s3 ls s3://test-dev-backup-bucket/hello.txt              
2021-01-25 12:39:54         12 hello.txt
```

- Delete the object
```bash
$ AWS_ACCESS_KEY_ID=<access-key-id> AWS_SECRET_ACCESS_KEY=<secret-access-key> aws s3 rm s3://test-dev-backup-bucket/hello.txt
delete: s3://test-dev-backup-bucket/hello.txt
```


