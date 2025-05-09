FROM --platform=linux/amd64 ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y && apt install --no-install-recommends -y sudo xterm init systemd snapd vim net-tools curl wget git

RUN curl -fsSL https://code-server.dev/install.sh | sh

RUN mkdir -p /root/.config/code-server

RUN echo '#!/bin/bash\n\
code-server --bind-addr 0.0.0.0:8080 &\n\
sleep 3\n\
sed -i '\''s/"host": "127.0.0.1"/"host": "0.0.0.0"/'\'' /root/.config/code-server/config.yaml\n\
sed -i '\''s/"password": ".*"/"password": "Nettyhost$egh56"/'\'' /root/.config/code-server/config.yaml\n\
sed -i '\''s/"port": [0-9]\+/'"port": 8080"'\'' /root/.config/code-server/config.yaml\n\
exec code-server --bind-addr 0.0.0.0:8080' > /start.sh && chmod +x /start.sh

CMD ["/start.sh"]
