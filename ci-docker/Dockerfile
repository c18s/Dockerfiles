# Stage 1: Get vault-dotenv
FROM --platform=$BUILDPLATFORM c18s/vault-dotenv AS vault-dotenv

# Stage 2: Download HashiCorp Vault
FROM --platform=$TARGETPLATFORM alpine:latest AS vault-downloader
ENV VAULT_VERSION=1.17.2
RUN apk add --no-cache curl unzip && \
    case "$(uname -m)" in \
    x86_64) ARCH=amd64 ;; \
    aarch64) ARCH=arm64 ;; \
    *) echo "Unsupported architecture" && exit 1 ;; \
    esac && \
    curl -fsSL https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_${ARCH}.zip -o vault.zip && \
    unzip vault.zip && \
    chmod +x vault

# Stage 3: Final image with all packages and binaries
FROM alpine:latest
ENV TZ=Asia/Bangkok

# Install all required packages
RUN apk add --no-cache xz git make docker bash tzdata curl sed libcap jq

# Copy vault and vault-dotenv binaries
COPY --from=vault-downloader /vault /usr/local/bin/vault
COPY --from=vault-dotenv /usr/local/bin/vault-dotenv /usr/local/bin/vault-dotenv

# Set proper permissions and capabilities for vault
RUN chmod +x /usr/local/bin/vault /usr/local/bin/vault-dotenv && \
    setcap cap_ipc_lock=+ep /usr/local/bin/vault
