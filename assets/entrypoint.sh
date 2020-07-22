#!/bin/bash

if [[ ! -e /etc/gitlab-runner/config.toml ]]; then
    /usr/local/bin/gitlab-runner register --non-interactive && \
        /usr/local/bin/gitlab-runner "$@"
else
    /usr/local/bin/gitlab-runner "$@"
fi
