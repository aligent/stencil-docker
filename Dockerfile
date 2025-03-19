FROM node:22-slim

RUN mkdir /app
RUN chown node:node /app

EXPOSE 3000/tcp
EXPOSE 3002/tcp

ARG DEBIAN_INTERACTIVE=noninteractive
RUN apt-get update && \
    apt-get --no-install-recommends --assume-yes --quiet install sudo git ca-certificates bzip2 curl openssh-client python3 build-essential libsass-dev gettext-base && \ 
    rm -rf /var/lib/apt/lists/* && \
    update-ca-certificates

USER node
WORKDIR /app

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin

RUN npm install -g ajv-cli@5.0.x
RUN npm install -g @bigcommerce/stencil-cli@8.6.0

USER root

COPY entrypoint.sh /docker-entrypoint.sh
RUN chmod 0755 /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
