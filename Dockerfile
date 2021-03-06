## It's a simple image: no need to fix to minor version
FROM alpine:3

# hadolint ignore=DL3018
RUN \
  apk add --no-cache rsync openssh && \
  mkdir /etc/cron.d

ENTRYPOINT ["/usr/sbin/crond"]

CMD ["-f", "-d", "8"]

LABEL io.jenkins-infra.tools="crond"
LABEL io.jenkins-infra.tools.crond.version="latest"
