# defaultbackend

[![Docker Build Status](https://img.shields.io/docker/cloud/build/c18s/defaultbackend.svg)][dockerhub_build]
[![Docker Automated build](https://img.shields.io/docker/cloud/automated/c18s/defaultbackend.svg)][dockerhub]
[![Docker Pulls](https://img.shields.io/docker/pulls/c18s/defaultbackend.svg)][dockerhub]
[![Docker ImageSize](https://images.microbadger.com/badges/image/c18s/defaultbackend.svg)][dockerhub_tag]

![defaultbackend](https://raw.githubusercontent.com/c18s/Dockerfiles/master/defaultbackend/logo.png)

---

[defaultbackend][1] The default backend is a service which handles all URL paths and hosts the nginx controller doesn't understand (i.e., all the requests that are not mapped with an Ingress).

- /healthz that returns 200
- / that returns 404

---

## Reference

- 🐛 [GitHub][github]
- 🐳 [Docker Hub][dockerhub]

[1]: https://kubernetes.github.io/ingress-nginx/user-guide/default-backend/
[dockerhub]: https://hub.docker.com/r/c18s/defaultbackend/
[dockerhub_tag]: https://hub.docker.com/r/c18s/defaultbackend/tags/
[dockerhub_build]: https://hub.docker.com/r/c18s/defaultbackend/builds/
[github]: https://github.com/c18s/Dockerfiles/tree/master/defaultbackend/
