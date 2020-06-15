FROM node:10

RUN mkdir /app
RUN chown node:node /app


USER node
WORKDIR /app

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin
RUN npm install -g @bigcommerce/stencil-cli@2.1.1

RUN stencil help

USER root
ENTRYPOINT ["/docker-entrypoint.sh"]

ARG DEBIAN_INTERACTIVE=noninteractive
RUN apt-get update && \
    apt-get --no-install-recommends --assume-yes --quiet install \
      sudo \
    && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /docker-entrypoint.sh
RUN chmod 0755 /docker-entrypoint.sh

EXPOSE 3000/tcp
EXPOSE 3002/tcp
