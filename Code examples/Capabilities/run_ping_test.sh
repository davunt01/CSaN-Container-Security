#!/bin/bash

# Build the Docker image
docker build -t ping_image .

# Run the container without the NET_RAW capability
docker run -d --name no_net_raw --cap-drop=NET_RAW ping_image
echo "docker run -d --name no_net_raw --cap-drop=NET_RAW ping_image"
# Allow some time for the container to start
sleep 2

# Try to use the ping command (will likely fail without NET_RAW)
docker exec -it no_net_raw ping -c 4 google.com

# Stop and remove the container
docker stop no_net_raw
docker rm no_net_raw

# Run the container with the NET_RAW capability explicitly added (optional as it's enabled by default)
docker run -d --name with_net_raw --cap-add=NET_RAW ping_image
echo "docker run -d --name with_net_raw --cap-add=NET_RAW ping_image"
# Allow some time for the container to start
sleep 2

# Try to use the ping command (should succeed with NET_RAW)
docker exec -it with_net_raw ping -c 4 google.com

# Stop and remove the container
docker stop with_net_raw
docker rm with_net_raw