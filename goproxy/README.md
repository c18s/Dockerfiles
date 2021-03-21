# GoProxy

[![Docker Build Status](https://img.shields.io/docker/cloud/build/c18s/goproxy.svg)][dockerhub_build]
[![Docker Automated build](https://img.shields.io/docker/automated/c18s/goproxy.svg)][dockerhub]
[![Docker Pulls](https://img.shields.io/docker/pulls/c18s/goproxy.svg)][dockerhub]
[![Docker ImageSize](https://images.microbadger.com/badges/image/c18s/goproxy.svg)][dockerhub_tag]

![GoProxy](https://raw.githubusercontent.com/c18s/Dockerfiles/master/goproxy/logo.png)

---

[(GoProxy)][1] is a high performance HTTP, HTTPS, HTTPS, websocket, TCP, UDP, Socks5 proxy server implemented by golang. It supports parent proxy,nat forward,TCP/UDP port forwarding, SSH transfer, TLS encrypted transmission, protocol conversion. you can expose a local server behind a NAT or firewall to the internet, secure DNS proxy.

---

## Usage

Run container

docker-compose.yml

```yaml
dante:
  image: c18s/goproxy
  ports:
    - '1080:1080'
  command: ['proxy', 'socks', '-t', 'tcp', '-p', '0.0.0.0:1080']
  restart: always
```

## Reference

- 🐛 [GitHub][github]
- 🐳 [Docker Hub][dockerhub]

[1]: https://github.com/snail007/goproxy
[dockerhub]: https://hub.docker.com/r/c18s/goproxy/
[dockerhub_tag]: https://hub.docker.com/r/c18s/goproxy/tags/
[dockerhub_build]: https://hub.docker.com/r/c18s/goproxy/builds/
[github]: https://github.com/c18s/Dockerfiles/tree/master/goproxy/
