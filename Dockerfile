FROM alpine:3.12.0

RUN apk update
RUN apk add curl
RUN apk add docker

WORKDIR /copilot-ci

# install AWS Copilot CLI
RUN curl -Lo /usr/local/bin/copilot https://github.com/aws/copilot-cli/releases/download/v0.3.0/copilot-linux-amd64-v0.3.0

RUN chmod +x /usr/local/bin/copilot
RUN /usr/local/bin/copilot -v

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]