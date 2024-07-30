FROM gitea/gitea:latest

RUN apk update && \
    apk add --no-cache python3 py3-pip

# Gitea use s6 to manage the entrypoint, so instead of
# simply adjust the entrypoint here, we need to add an extra s6 service runner
COPY ./s6-services/webhook-handler /etc/s6/webhook-handler

# Ensure the service script is executable
RUN chmod +x /etc/s6/webhook-handler/run