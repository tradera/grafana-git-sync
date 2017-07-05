FROM node:alpine

RUN apk update && apk upgrade && \
    apk add --no-cache git bash

RUN npm install -g wizzy

RUN mkdir -p /grafana-git-sync/grafana-entities/dashboards
RUN mkdir -p /grafana-git-sync/grafana-entities/datasources
RUN mkdir -p /grafana-git-sync/grafana-entities/orgs

COPY entrypoint.sh /grafana-git-sync/entrypoint.sh

ENTRYPOINT ["/bin/bash", "/grafana-git-sync/entrypoint.sh"]