# OpenResty® is a dynamic web platform based on NGINX and LuaJIT

[![Docker Pulls](https://img.shields.io/docker/pulls/c18s/openresty.svg)][dockerhub]
[![Docker ImageSize](https://images.microbadger.com/badges/image/c18s/openresty.svg)][dockerhub_tag]

![Openresty](https://raw.githubusercontent.com/c18s/Dockerfiles/master/openresty/logo.png)

---

[OpenResty®][1] is a full-fledged web platform that integrates the standard Nginx core, LuaJIT, many carefully written Lua libraries, lots of high quality 3rd-party Nginx modules, and most of their external dependencies. It is designed to help developers easily build scalable web applications, web services, and dynamic web gateways.

---

## Add-ons

- luarocks
- libsregex
- replace-filter-nginx-module
- nginx_substitutions_filter

## Usage

Run container

```bash
docker run -d -p 80:80 -p 443:443 --name openresty c18s/openresty
```

## Reference

- 🐛 [GitHub][github]
- 🐳 [Docker Hub][dockerhub]

[1]: https://openresty.org/
[dockerhub]: https://hub.docker.com/r/c18s/openresty/
[dockerhub_tag]: https://hub.docker.com/r/c18s/openresty/tags/
[github]: https://github.com/c18s/Dockerfiles/tree/master/openresty/
