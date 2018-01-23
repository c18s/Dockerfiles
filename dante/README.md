Dante - A free SOCKS server
===========================
![Dante](logo.png?raw=true "Dante Logo")

[Dante][1] is a product developed by Inferno Nettverk A/S. It consists of a
SOCKS server and a SOCKS client, implementing RFC 1928 and related standards.
It is a flexible product that can be used to provide convenient and secure
network connectivity. 

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

[1]: http://www.inet.no/dante/index.html
