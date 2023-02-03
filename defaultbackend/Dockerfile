FROM golang:1.19-alpine AS builder
WORKDIR /build
COPY go.mod .
COPY go.sum .
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o /srv/start

FROM alpine:edge
WORKDIR /srv
ENV TZ=Asia/Bangkok
RUN apk add --no-cache tzdata
COPY --from=builder /srv /srv
COPY static /srv/static
CMD ["/srv/start"]
