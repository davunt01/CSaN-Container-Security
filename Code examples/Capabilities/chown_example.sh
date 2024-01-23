#!/bin/bash
echo "container run --rm -it alpine chown nobody /"
docker container run --rm -it alpine chown nobody /

echo "container run --rm -it --cap-drop ALL --cap-add CHOWN alpine chown nobody /"
docker container run --rm -it --cap-drop ALL --cap-add CHOWN alpine chown nobody /

echo "container run --rm -it --cap-drop CHOWN alpine chown nobody /"
docker container run --rm -it --cap-drop CHOWN alpine chown nobody /

