FROM --platform=linux/amd64 ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y && apt install --no-install-recommends -y sudo xterm init systemd snapd vim net-tools curl wget git

RUN curl -fsSL https://code-server.dev/install.sh | sh

RUN mkdir -p /root/.config/code-server

CMD ["/bin/bash", "-c", "\
code-server --bind-addr 0.0.0.0:8080 & \
sleep 3 && \
sed -i 's/\"host\": \"127.0.0.1\"/\"host\": \"0.0.0.0\"/' /root/.config/code-server/config.yaml && \
exec code-server --bind-addr 0.0.0.0:8080"]
