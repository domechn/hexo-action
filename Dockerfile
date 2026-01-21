FROM node:20-bookworm-slim

LABEL version="1.0.3"
LABEL repository="https://github.com/sma11black/hexo-action"
LABEL homepage="https://sma11black.github.io"
LABEL maintainer="sma11black <smallblack@outlook.com>"

USER root
COPY entrypoint.sh /entrypoint.sh
COPY sync_deploy_history.js /sync_deploy_history.js

RUN apt-get update && \
    apt-get install -y git openssh-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
