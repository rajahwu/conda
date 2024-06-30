#!/bin/bash

docker run -it --rm \
    -e PULSE_SERVER=unix:/tmp/pulseaudio.socket \
    -v /tmp/pulseaudio.socket:/tmp/pulseaudio.socket \
    -v ~/.config/pulse/cookie:/root/.config/pulse/cookie \
    pulseaudio-container

