#!/bin/bash

TARGET_DIR=$1
BACKUP_DIR=$2
MAX_BACKUPS=$3

echo "Cleaning up old backups"

while [ $(ls ${BACKUP_DIR} | wc -l) -ge ${MAX_BACKUPS} ];
do
    BACKUP_TO_BE_DELETED=$(ls ${BACKUP_DIR} | sort | head -n 1)
    echo "Backup $BACKUP_TO_BE_DELETED is deleted"
    rm "$BACKUP_DIR/$BACKUP_TO_BE_DELETED"
done

BACKUP_NAME=$(date +\%Y_\%m_\%d_\%H_\%M)
BACKUP_PATH="${BACKUP_DIR}/${BACKUP_NAME}"

tar -czf "$BACKUP_PATH.tar.gz" $TARGET_DIR

echo "Backup $BACKUP_PATH.tar.gz created"