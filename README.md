A docker image that syncs grafana dashboards, datasources and organizations to a git repository using [wizzy](https://utkarshcmu.github.io/wizzy-site/home/).

## Usage

```bash
$ docker run -it \
    -e GRAFANA_URL=http://host.com \
    -e GRAFANA_USER=username \
    -e GRAFANA_PWD=password \
    -e GIT_REPO=http://username:password@host.com/repo.git \
    -e GIT_EMAIL=grafana-git-sync@host.com \
    tradera/grafana-git-sync
```
