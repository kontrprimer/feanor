#!/bin/bash

# Define variables
DB_USER="postgres"
DB_NAME="postgres"
BACKUP_DIR="/usr/local/var/postgresql@14/backups"  # Update this path accordingly

# Ensure backup directory exists
mkdir -p $BACKUP_DIR

# Backup file name
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_backup.sql"

# Perform backup
if pg_dump -U $DB_USER -d $DB_NAME > $BACKUP_FILE; then
  echo "$(date +"%Y-%m-%d %H:%M:%S") - Backup successful: $BACKUP_FILE"
else
  echo "$(date +"%Y-%m-%d %H:%M:%S") - Backup failed"
  exit 1
fi

# Add backup file to Git
cd $BACKUP_DIR
if git add ${DB_NAME}_backup.sql && git commit -m "Database backup $(date +"%Y-%m-%d %H:%M:%S")" && git push origin main; then
  echo "$(date +"%Y-%m-%d %H:%M:%S") - Git commit and push successful"
else
  echo "$(date +"%Y-%m-%d %H:%M:%S") - Git commit or push failed"
  exit 1
fi

