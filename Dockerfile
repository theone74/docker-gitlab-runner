FROM alpine:latest
MAINTAINER Sean Gillespie <sean@mistersg.net>

# Install curl
RUN apk update && apk add bash \
  ca-certificates \
  git \
  openssl \
  wget

VOLUME /etc/gitlab-runner /home/gitlab-runner

RUN adduser -h /home/gitlab-runner -s /bin/bash -D gitlab-runner
RUN wget -q -O /usr/local/bin/gitlab-runner \
  https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-386 && \
  chmod +x /usr/local/bin/gitlab-runner && /usr/local/bin/gitlab-runner -v

# Add the entrypoint
COPY assets/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["run", "--working-directory=/home/gitlab-runner", "--user=gitlab-runner"]
