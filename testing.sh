#!/bin/bash

docker build -t ninthgrimmercury/needlessbeta . &&
    docker build -t freakygamma/needlessbeta test &&
    docker run --detach --volume /sys/fs/cgroup:/sys/fs/cgroup:ro -p 127.0.0.1.23628:22 freakygamma/needlessbeta &&
    ssh -i test/id_rsa -p 23628 -l root 127.0.0.1 -o StrictHostKeyChecking=no echo hi &&
    true
