# Dante - A free SOCKS server

[![Docker Build Status](https://img.shields.io/docker/build/c18s/dante.svg)][dockerhub_build]
[![Docker Automated build](https://img.shields.io/docker/automated/c18s/dante.svg)][dockerhub]
[![Docker Pulls](https://img.shields.io/docker/pulls/c18s/dante.svg)][dockerhub]
[![Docker ImageSize](https://images.microbadger.com/badges/image/c18s/dante.svg)][dockerhub_tag]

![Dante](https://raw.githubusercontent.com/c18s/Dockerfiles/master/dante/logo.png)

---

[Dante][1] is a product developed by Inferno Nettverk A/S. It consists of a
SOCKS server and a SOCKS client, implementing RFC 1928 and related standards.
It is a flexible product that can be used to provide convenient and secure
network connectivity.

---

## Usage

Run container

```bash
docker run -d -p 1080:1080 --name dante c18s/dante
```

docker-compose.yml

```yaml
dante:
  image: c18s/dante
  ports:
    - '1080:1080'
  volumes:
    - './sockd.conf:/etc/sockd.conf'
  environment:
    - WORKERS=4
  restart: always
```

## Reference

- 🐛 [GitHub][github]
- 🐳 [Docker Hub][dockerhub]

[1]: http://www.inet.no/dante/index.html
[dockerhub]: https://hub.docker.com/r/c18s/dante/
[dockerhub_tag]: https://hub.docker.com/r/c18s/dante/tags/
[dockerhub_build]: https://hub.docker.com/r/c18s/dante/builds/
[github]: https://github.com/c18s/Dockerfiles/tree/master/dante/
