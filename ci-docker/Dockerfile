FROM c18s/vault-dotenv as vault-dotenv

FROM alpine:latest
ENV TZ=Asia/Bangkok
COPY --from=vault-dotenv /usr/local/bin/vault-dotenv /usr/local/bin/.
RUN apk add --no-cache xz git make docker bash tzdata curl sed
