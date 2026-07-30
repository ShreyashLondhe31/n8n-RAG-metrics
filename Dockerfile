# syntax=docker/dockerfile:1.7

FROM n8nio/n8n:slimmer-custom-image

ENV N8N_PORT=5678 \
    N8N_PROTOCOL=http \
    NODE_ENV=production

RUN mkdir -p /home/node/.n8n /tmp/n8n && \
    chown -R node:node /home/node/.n8n /tmp/n8n && \
    chmod 750 /home/node/.n8n /tmp/n8n

USER node
WORKDIR /home/node

VOLUME ["/home/node/.n8n"]

HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=5 \
  CMD ["/bin/sh", "-c", "wget -qO- http://127.0.0.1:5678/healthz >/dev/null 2>&1 || exit 1"]