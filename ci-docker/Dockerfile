# Stage 1: Get vault-dotenv
FROM --platform=linux/amd64 c18s/vault-dotenv AS vault-dotenv

# Stage 2: Get HashiCorp Vault from official image
FROM --platform=linux/amd64 hashicorp/vault:latest AS vault-official

# Stage 3: Final image with all packages and binaries
FROM alpine:latest
ENV TZ=Asia/Bangkok

# Install all required packages
RUN apk add --no-cache xz git make docker bash tzdata curl sed libcap jq

# Copy vault and vault-dotenv binaries
COPY --from=vault-official /bin/vault /usr/local/bin/vault
COPY --from=vault-dotenv /usr/local/bin/vault-dotenv /usr/local/bin/vault-dotenv

# Set proper permissions for binaries
RUN chmod +x /usr/local/bin/vault /usr/local/bin/vault-dotenv
