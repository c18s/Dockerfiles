FROM golang:alpine as builder
WORKDIR /app
RUN apk add -u git
COPY *.go /app/
RUN go get -v -d
RUN CGO_ENABLED=0 GOOS=linux go build -o /srv/start

FROM alpine:edge
WORKDIR /srv
ENV TZ=Asia/Bangkok
RUN apk add --no-cache tzdata
COPY --from=builder /srv /srv
COPY static /srv/static
CMD ["/srv/start"]
