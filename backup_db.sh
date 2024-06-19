#!/bin/bash

# Define variables
DB_USER="postgres"
DB_NAME="postgres"
BACKUP_DIR="/usr/local/var/postgresql@14/backups"  # Update this path accordingly

# Generate timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Backup file name
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_backup_${TIMESTAMP}.sql"

# Perform backup
pg_dump -U $DB_USER -Fc $DB_NAME > $BACKUP_FILE

# Add backup file to Git
cd $BACKUP_DIR
git add ${DB_NAME}_backup_${TIMESTAMP}.sql
git commit -m "Database backup ${TIMESTAMP}"
git push origin main

