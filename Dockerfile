FROM n8nio/n8n:latest

# Install ffmpeg and clean up
USER root
RUN apk update && \
    apk add --no-cache ffmpeg

USER node

# Ensure proper permissions
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n
