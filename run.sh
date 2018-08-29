#!/bin/bash

echo "Running backup script"
sh /scripts/backup.sh $TARGET_DIR $BACKUP_DIR $MAX_BACKUPS >> /var/log/backup.log 2>&1

echo "${CRON_TIME} sh /scripts/backup.sh $TARGET_DIR $BACKUP_DIR $MAX_BACKUPS >> /var/log/backup.log 2>&1" > /etc/crontabs/root
chmod 0644 /etc/crontabs/root
/usr/bin/crontab /etc/crontabs/root

echo "Running backups as a cron for ${CRON_TIME}"
crond && tail -F /var/log/backup.log
