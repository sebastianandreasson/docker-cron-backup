# docker-cron-backup
A generic cron backup job for any folder. Using Docker with the alpine image

[Docker image](https://hub.docker.com/r/sebastianandreas/docker-cron-backup/)
[Github repo](https://github.com/sebastianandreasson/docker-cron-backup)

Example usage:
```
version: '3'
services:
  folder-backup:
    image: 'sebastianandreas/docker-cron-backup:latest'
    environment:
      - BACKUP_DIR=/backups
      - TARGET_DIR=/target
      - CRON_TIME=* * * * *
      - MAX_BACKUPS=10
    volumes:
      - './backups:/backups'
      - './target:/target'
```
