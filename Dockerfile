FROM alpine:3.12.0

RUN apk update
RUN apk add curl

# install AWS Copilot CLI
RUN curl -Lo /usr/local/bin/copilot https://github.com/aws/copilot-cli/releases/download/v0.1.0/copilot-darwin-v0.1.0 && \
  chmod +x /usr/local/bin/copilot && \
  copilot --help

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]