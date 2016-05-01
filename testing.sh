#!/bin/bash

docker build -t ninthgrimmercury/needlessbeta . &&
    docker build -t freakygamma/needlessbeta test &&
    docker run --detach --volume /sys/fs/cgroup:/sys/fs/cgroup:ro -p 23628:80 freakygamma/needlessbeta &&
    OBSERVED=$(mktemp) &&
    echo ${OBSERVED} &&
    curl --output ${OBSERVED} http://127.0.0.1:23628/index.html &&
    docker rmi --force ninthgrimmercury/needlessbeta &&
    docker rmi --force freakygamma/needlessbeta &&
    true
