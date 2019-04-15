#!/bin/bash

if [[ ! -e $/etc/gitlab-runner/config.toml ]]; then
    gitlab-ci-multi-runner register --non-interactive && \
        gitlab-ci-multi-runner "$@"
else
    gitlab-ci-multi-runner "$@"
fi
