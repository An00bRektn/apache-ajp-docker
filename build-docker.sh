#!/bin/bash

docker rm -f apache-ajp
docker image rm apache-ajp
docker build -t apache-ajp .
docker run --name=apache-ajp -p80:80 apache-ajp