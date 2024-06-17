To generate database dump
```
mysqldump -u root -h db_host -p testdb > /tmp/db.sql
```
To upload backup file to AWS s3 bucket
CREATE these 2 keys with data from the IAM
```
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=us-west-2
```
To copy data from container to s3
```
aws s3 cp /tmp/db.sql s3://jenkins-mysql-backup-ndh/db.sql
```