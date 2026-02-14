# OrbisProxy Example Configuration

```yaml
# ==============================
# OrbisProxy Configuration
# ==============================

version: 3

# Address the proxy listens on
listen: 0.0.0.0:5520

# Public address (required!)
publicAddress: "play.example.com"
publicPort: 5520

# Proxy Secret
proxySecret: "REPLACE_WITH_RANDOM_SECRET"

# TLS certificate files
certFile: certs/server.crt
keyFile: certs/server.key

# Enable debug logging (disable in production)
debug: false

# ==============================
# Backend Servers
# ==============================

servers:
  - name: "lobby-1"
    host: 127.0.0.1
    port: 5525

  - name: "lobby-2"
    host: 127.0.0.1
    port: 5526

  - name: "survival-1"
    host: 127.0.0.1
    port: 5535

# Default & fallback server
defaultServer: "lobby-1"
fallbackServer: "lobby-2"

# ==============================
# Load Balancing Pool
# ==============================

poolEnabled: true

pool:
  lobby:
    strategy: round-robin
    servers:
      - lobby-1
      - lobby-2

# ==============================
# Hostname-based Routing
# ==============================

routes:
  - hostname: "lobby.example.com"
    target: "lobby"           # Routes to pool

  - hostname: "survival.example.com"
    target: "survival-1"      # Routes to specific server
```
