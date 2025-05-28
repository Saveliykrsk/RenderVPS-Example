FROM --platform=linux/amd64 ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y && apt install --no-install-recommends -y sudo xterm init systemd snapd vim net-tools curl wget git tmate python3-websockify

RUN git clone https://github.com/Saveliykrsk/RenderVPS-Example

RUN cd RenderVPS-Example

RUN sh install.sh

