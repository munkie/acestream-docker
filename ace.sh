#!/bin/sh

docker run -v /dev/snd:/dev/snd --privileged -v /tmp/.X11-unix:/tmp/.X11-unix -e uid=$(id -u) -e gid=$(id -g) -e DISPLAY=unix$DISPLAY --rm ace $@
