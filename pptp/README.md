# PPTP VPN

[![Docker Build Status](https://img.shields.io/docker/cloud/build/c18s/pptp.svg)][dockerhub_build]
[![Docker Automated build](https://img.shields.io/cloud/docker/automated/c18s/pptp.svg)][dockerhub]
[![Docker Pulls](https://img.shields.io/docker/pulls/c18s/pptp.svg)][dockerhub]
[![Docker ImageSize](https://images.microbadger.com/badges/image/c18s/pptp.svg)][dockerhub_tag]

![pptp](https://raw.githubusercontent.com/c18s/Dockerfiles/master/pptp/logo.png)

---

Point-to-Point Tunneling Protocol [(PPTP)][1] is a method for implementing virtual private networks. PPTP uses a control channel over TCP and a GRE tunnel operating to encapsulate PPP packets.

---

## Usage

Run container

```bash
docker run -d -e USERNAME=dev -e PASSWORD=1234 -p 1723:1723 --name pptp --privileged -v /lib/modules:/lib/modules c18s/pptp
```

docker-compose.yml

```yaml
pptp:
  image: c18s/pptp
  privileged: yes
  ports:
    - '0.0.0.0:1723:1723'
  volumes:
    - '/lib/modules:/lib/modules:ro'
  environment:
    - USERNAME=dev
    - PASSWORD=1234
  restart: always
```

## Reference

- 🐛 [GitHub][github]
- 🐳 [Docker Hub][dockerhub]

[1]: https://wiki.archlinux.org/index.php/PPTP_server
[dockerhub]: https://hub.docker.com/r/c18s/pptp/
[dockerhub_tag]: https://hub.docker.com/r/c18s/pptp/tags/
[dockerhub_build]: https://hub.docker.com/r/c18s/pptp/builds/
[github]: https://github.com/c18s/Dockerfiles/tree/master/pptp/
