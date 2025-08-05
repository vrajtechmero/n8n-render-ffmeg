FROM n8nio/n8n:latest

# Install ffmpeg
USER root
RUN apt-get update && apt-get install -y ffmpeg

USER node
