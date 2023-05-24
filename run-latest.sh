#!/bin/sh

# Remove existing containers to avoid conflicts
docker stop grid-server
docker rm grid-server
docker stop grid-project
docker rm grid-project

# Start grid server from public image
docker run -d --name grid-server -p 3000:3000 -p 3443:3443 -v /tmp/cs-23-dat-2-07/grid-server-volume:/data -e MODE="debug" bliztle/grid-server

# Start grid project from public image
docker run -d --name grid-project -p 3001:3001 -p 3444:3444 -v /tmp/cs-23-dat-2-07/grid-project-volume:/data -e MODE="debug" bliztle/grid-project