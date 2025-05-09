FROM --platform=linux/amd64 ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update -y && apt install --no-install-recommends -y sudo xterm init systemd snapd vim net-tools curl wget git
RUN curl -fsSL https://code-server.dev/install.sh | sh 
RUN code-server
CMD bash -c "cat /root/.config/code-server/config.yaml"
