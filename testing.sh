#!/bin/bash

docker build -t ninthgrimmercury/needlessbeta . &&
    docker build -t freakygamma/needlessbeta test &&
    docker run --interactive --privileged --detach --volume /sys/fs/cgroup:/sys/fs/cgroup:ro -p 23628:80 freakygamma/needlessbeta &&
    sleep 10s &&
    if curl http://127.0.0.1:23628 > /dev/null 2>&1
    then
	echo the httpd service is working &&
	    true
    else
	echo this httpd service is not working &&
	    exit 64 &&
	    true
    fi &&
    docker rmi --force ninthgrimmercury/needlessbeta &&
    docker rm $(docker stop $(docker ps -a -q --filter ancestor=freakygamma/needlessbeta --format="{{.ID}}")) &&
    docker rmi --force freakygamma/needlessbeta &&
    true
