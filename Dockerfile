FROM alpine:3.8

RUN apk update && apk add dcron && rm -rf /var/cache/apk/*

ADD backup.sh /scripts/backup.sh
ADD run.sh /scripts/run.sh

CMD sh ./scripts/run.sh
