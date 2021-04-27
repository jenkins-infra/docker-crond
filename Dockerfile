FROM alpine:3

# hadolint ignore=DL3018
RUN \
  apk add --no-cache rsync openssh && \
  mkdir /etc/cron.d

ENTRYPOINT ["/usr/sbin/crond"]

CMD ["-f", "-d", "8"]
