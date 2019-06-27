# RADIUS Server

[![Docker Build Status](https://img.shields.io/docker/cloud/build/c18s/radius-server.svg)][dockerhub_build]
[![Docker Automated build](https://img.shields.io/docker/automated/c18s/radius-server.svg)][dockerhub]
[![Docker Pulls](https://img.shields.io/docker/pulls/c18s/radius-server.svg)][dockerhub]
[![Docker ImageSize](https://img.shields.io/microbadger/image-size/c18s/radius-server.svg)][dockerhub_tag]

![FreeRadius](https://raw.githubusercontent.com/c18s/Dockerfiles/master/radius-server/logo.png)

---

RADIUS Server with external authentication script, [(FreeRADIUS)][1] is responsible for authenticating one third of all users on the Internet.

---

## Usage

Run container

```bash
docker run -d --name radius-server -p 1812:1812/udp -p 1813:1813/udp c18s/radius-server
```

docker-compose.yml

```yaml
radius-server:
  image: c18s/radius-server
  net: host
  volumes:
    - './logs:/var/log/radius'
  environment:
    - DEBUG=1
    - IPADDR=127.0.0.1
    - RADIUS_SECRET=1234
  restart: always
```

## Reference

- 🐛 [GitHub][github]
- 🐳 [Docker Hub][dockerhub]

[1]: https://freeradius.org/
[dockerhub]: https://hub.docker.com/r/c18s/radius-server/
[dockerhub_tag]: https://hub.docker.com/r/c18s/radius-server/tags/
[dockerhub_build]: https://hub.docker.com/r/c18s/radius-server/builds/
[github]: https://github.com/c18s/Dockerfiles/tree/master/radius-server/
