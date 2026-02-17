# OrbisProxy Docker Guide

This guide explains how to run **OrbisProxy** using Docker and Docker
Compose.

The official image is published on GitHub Container Registry (GHCR):

ghcr.io/orbisproxy/`proxy`:`latest`

---

# Requirements

-   Docker 24+
-   Docker Compose v2+
-   A Linux host (recommended for production)
-   Open UDP port (default: 5520/udp)

---

# Pull the Image

`docker pull ghcr.io/orbisproxy/proxy:<version>`

### Example:<br>
`docker pull ghcr.io/orbisproxy/proxy:latest`<br>
`docker pull ghcr.io/orbisproxy/proxy:<version>`

---

# Run with Docker

Increase UDP buffer sizes on the host:

```bash
sudo sysctl -w net.core.rmem_max=2500000 
sudo sysctl -w net.core.wmem_max=2500000
```

Start docker container

```bash
docker run -d\
    --name orbisproxy\
    -p 5520:5520/udp\
    --ulimit nofile=200000:200000\
    --restart unless-stopped\
    ghcr.io/orbisproxy/proxy:latest
```

---

# Using Docker Compose (Recommended)

Create folder:<br>
`mkdir data/`

Set permissions for folder
`chown -R 1001:1001 data/`

Create a `docker-compose.yml` file:
```yaml
services:
    orbisproxy:
        image: ghcr.io/orbisproxy/proxy:<version>
        container_name: orbisproxy
        restart: unless-stopped
        ports:
            - "5520:5520/udp"
        volumes:
            - ./data:/app/data
        command: ["-c", "/app/data/config.yml"]
        ulimits:
            nofile:
                soft: 200000
                hard: 200000
```

Start it:

`docker compose up -d`

Stop it:

`docker compose down`

---

# Updating OrbisProxy

Pull the new version:

`docker pull ghcr.io/orbisproxy/proxy:<version>`

Restart container:

`docker compose down`<br>
`docker compose up -d`

---

# Using Latest (Stable Only)

If you want automatic updates to the latest stable release:

```yaml
image: ghcr.io/orbisproxy/proxy:latest
```

Do NOT use `latest` in production if you require deterministic
deployments.

---

# Logs

View logs:

`docker logs -f orbisproxy`

---

# Security Notes

-   The container runs as a non-root user.
-   Only port 5520/udp is exposed.