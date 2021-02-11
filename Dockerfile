FROM alpine

RUN \
  apk add --no-cache tini rsync openssh && \
  mkdir /etc/cron.d

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["crond", "-f", "-d", "8"]
