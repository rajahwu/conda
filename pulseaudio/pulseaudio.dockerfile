FROM ubuntu:latest
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y pulseaudio pulseaudio-utils

