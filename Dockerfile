FROM alpine:3

# hadolint ignore=DL3018
RUN \
  apk add --no-cache tini rsync openssh && \
  mkdir /etc/cron.d

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["crond", "-f", "-d", "8"]
