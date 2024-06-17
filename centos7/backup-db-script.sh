#!/bin/bash

# Get current time
DATE=$(date +%H-%M-%S)

# Assign command-line arguments to variables
DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <DB_HOST> <DB_PASSWORD> <DB_NAME>"
    exit 1
fi

# Perform the database backup
mysqldump -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /tmp/db_backup_$DATE.sql

# Check if the mysqldump command was successful
if [ $? -eq 0 ]; then
    echo "Database backup executed successfully: /tmp/db_backup_$DATE.sql"
else
    echo "Database backup failed"
    exit 1
fi
