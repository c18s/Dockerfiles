# Ipsec - Internet Protocol Security

[![Docker Build Status](https://img.shields.io/docker/build/c18s/ipsec.svg)][dockerhub_build]
[![Docker Automated build](https://img.shields.io/docker/automated/c18s/ipsec.svg)][dockerhub]
[![Docker Pulls](https://img.shields.io/docker/pulls/c18s/ipsec.svg)][dockerhub]
[![Docker ImageSize](https://images.microbadger.com/badges/image/c18s/ipsec.svg)][dockerhub_tag]

![IPsec](logo.png "IPsec Logo")

----

Internet Protocol Security [(IPsec)][1] is a network protocol suite that authenticates and encrypts the packets of data sent over a network. 

----

## Usage

Run container

```bash
docker run -d -p 500:500/udp -p 4500:4500/udp --name ipsec --privileged -v /lib/modules:/lib/modules c18s/ipsec
```

docker-compose.yml

```yaml
ipsec:
  image: c18s/ipsec
  privileged: yes
  ports:
    - '0.0.0.0:500:500/udp'
    - '0.0.0.0:4500:4500/udp'
  volumes:
    - '/lib/modules:/lib/modules'
  restart: always
```

## Reference

- :octocat: <https://github.com/c18s/Dockerfiles/tree/master/ipsec>
- :whale: <https://hub.docker.com/r/c18s/ipsec/>

[1]: https://en.wikipedia.org/wiki/IPsec
[dockerhub]: https://hub.docker.com/r/c18s/ipsec/
[dockerhub_tag]: https://hub.docker.com/r/c18s/ipsec/tags/
[dockerhub_build]: https://hub.docker.com/r/c18s/ipsec/builds/
