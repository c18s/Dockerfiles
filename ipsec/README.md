# IPsec - Internet Protocol Security

[![Docker Build Status](https://img.shields.io/docker/build/c18s/ipsec.svg)][dockerhub_build]
[![Docker Automated build](https://img.shields.io/docker/automated/c18s/ipsec.svg)][dockerhub]
[![Docker Pulls](https://img.shields.io/docker/pulls/c18s/ipsec.svg)][dockerhub]
[![Docker ImageSize](https://images.microbadger.com/badges/image/c18s/ipsec.svg)][dockerhub_tag]

![IPsec](https://raw.githubusercontent.com/c18s/Dockerfiles/master/ipsec/logo.png)

---

Internet Protocol Security [(IPsec)][1] is a network protocol suite that authenticates and encrypts the packets of data sent over a network.

---

## Usage

Run container

```bash
docker run -d -e PSK=1234 -e USERNAME=dev -e PASSWORD=1234 -e SERVER=localhost -p 500:500/udp -p 4500:4500/udp -p 1701:1701/udp -p 40080:40080 --name ipsec --privileged -v /lib/modules:/lib/modules c18s/ipsec
```

docker-compose.yml

```yaml
ipsec:
  image: c18s/ipsec
  privileged: yes
  ports:
    - '0.0.0.0:500:500/udp'
    - '0.0.0.0:4500:4500/udp'
    - '0.0.0.0:1701:1701/udp'
    - '0.0.0.0:40080:40080'
  volumes:
    - './certs:/etc/ipsec.d/config/certs'
    - '/lib/modules:/lib/modules:ro'
  environment:
    - PSK=1234
    - USERNAME=dev
    - PASSWORD=1234
    - SERVER=localhost
  restart: always
```

### Configuration files

go to url `http://$SERVER_IP:40080`

## Reference

- 🐛 [GitHub][github]
- 🐳 [Docker Hub][dockerhub]

[1]: https://en.wikipedia.org/wiki/IPsec/
[dockerhub]: https://hub.docker.com/r/c18s/ipsec/
[dockerhub_tag]: https://hub.docker.com/r/c18s/ipsec/tags/
[dockerhub_build]: https://hub.docker.com/r/c18s/ipsec/builds/
[github]: https://github.com/c18s/Dockerfiles/tree/master/ipsec/
