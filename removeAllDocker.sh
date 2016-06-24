#!/bin/bash
# Stop all containers
docker stop $(docker ps -a -q)
# Delete all containers
docker rm $(docker ps -a -q)
# Delete all images
docker rmi $(docker images -q&)
# Delete volumes
docker volume rm $(docker volume ls -qf dangling=true)
