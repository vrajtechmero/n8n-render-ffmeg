FROM n8nio/n8n:latest

# Install ffmpeg and clean up
USER root
RUN apk update && \
    apk add --no-cache ffmpeg

USER node

# Ensure proper permissions
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

# Add startup script to debug environment variables
COPY --chown=node:node <<EOF /home/node/debug-env.sh
#!/bin/sh
echo "=== Environment Variables Debug ==="
echo "DB_TYPE: \$DB_TYPE"
echo "DB_POSTGRESDB_HOST: \$DB_POSTGRESDB_HOST"
echo "DB_POSTGRESDB_PORT: \$DB_POSTGRESDB_PORT"
echo "=================================="
exec "\$@"
EOF

RUN chmod +x /home/node/debug-env.sh

ENTRYPOINT ["/home/node/debug-env.sh"]
CMD ["n8n"]
