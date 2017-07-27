#!/bin/bash

git config --global user.email "${GIT_EMAIL:-"grafana-git-sync@test.com"}"
git config --global user.name "grafana-git-sync"

cd /grafana-git-sync/grafana-entities

wizzy init
wizzy set grafana url $GRAFANA_URL
wizzy set grafana username $GRAFANA_USER
wizzy set grafana password $GRAFANA_PWD

git init
git remote add origin $GIT_REPO
git pull origin master

rm -rf dashboards/*.json
rm -rf datasources/*.json
rm -rf orgs/*.json

git rm dashboards/\*.json
git rm datasources/\*.json
git rm orgs/\*.json

wizzy import dashboards
wizzy import datasources
wizzy import orgs

git add dashboards/*.json
git add datasources/*.json
git add orgs/*.json

git commit -m "Sync dashboards, datasources and organizations with grafana"
git push origin master
