# Kimchi - An HTML5 management interface for KVM guests

[![Docker Build Status](https://img.shields.io/docker/build/c18s/kimchi.svg)][dockerhub_build]
[![Docker Automated build](https://img.shields.io/docker/automated/c18s/kimchi.svg)][dockerhub]
[![Docker Pulls](https://img.shields.io/docker/pulls/c18s/kimchi.svg)][dockerhub]
[![Docker ImageSize](https://images.microbadger.com/badges/image/c18s/kimchi.svg)][dockerhub_tag]

![Kimchi](https://raw.githubusercontent.com/c18s/Dockerfiles/master/kimchi/logo.png "Kimchi Logo")

---

[Kimchi][1] is an HTML5 based management tool for KVM. It is designed to make it as easy as possible to get started with KVM and create your first guest.

---

## Usage

Run container

```bash
docker run -d -p 8001:8001 --name kimchi c18s/kimchi
```

docker-compose.yml

```yaml
kimchi:
  image: c18s/kimchi
  ports:
    - '8001:8001'
  restart: always
```

## Reference

* :octocat: <https://github.com/c18s/Dockerfiles/tree/master/kimchi>
* :whale: <https://hub.docker.com/r/c18s/kimchi/>

[1]: https://github.com/kimchi-project/kimchi/
[dockerhub]: https://hub.docker.com/r/c18s/kimchi/
[dockerhub_tag]: https://hub.docker.com/r/c18s/kimchi/tags/
[dockerhub_build]: https://hub.docker.com/r/c18s/kimchi/builds/
