#!/bin/bash

# Get current time
DATE=$(date +%H-%M-%S)

# Assign command-line arguments to variables
DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
AWS_ACCESS_KEY_ID=$4
AWS_SECRET_ACCESS_KEY=$5

# Check if the correct number of arguments is provided
if [ "$#" -ne 5 ]; then
    echo "Usage: $0 <DB_HOST> <DB_PASSWORD> <DB_NAME> <AWS_ACCESS_KEY_ID> <AWS_SECRET_ACCESS_KEY>"
    exit 1
fi

BACKUP_FILE_NAME=/tmp/db_backup_$DATE.sql

# Perform the database backup
mysqldump -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > $BACKUP_FILE_NAME

# Check if the mysqldump command was successful
if [ $? -eq 0 ]; then
    echo "Database backup executed successfully: /tmp/db_backup_$DATE.sql"
else
    echo "Database backup failed"
    exit 1
fi


# Export AWS credentials
export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY

# Copy the back up file to S3
aws s3 cp $BACKUP_FILE_NAME s3://jenkins-mysql-backup-ndh/$BACKUP_FILE_NAME

if [ $? -eq 0 ]; then
    echo "Backup file uploaded successfully to S3"
else
    echo "Failed to upload backup file to S3"
    exit 1
fi