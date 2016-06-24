#!/bin/bash

../removeAllDocker.sh

#docker rmi mypg

docker build -t mypg .

docker run mypg
