# Backend Server Setup

This document describes how to properly configure a Hytale backend server to work with **OrbisProxy**.

---

## 1. Start Parameters

The backend server **must** be started with the following parameter enabled:

```
--auth-mode insecure
```

This is required because authentication and session handling are managed by OrbisProxy.  
If this parameter is missing, the proxy will not be able to connect players correctly.

---

## 2. Firewall Configuration

The backend server must be reachable by OrbisProxy over the network.

Make sure that the following are allowed in your firewall configuration:

- **TCP** traffic on the backend server port (for [Health Check Connectivity](#health-check-connectivity) required)
- **UDP** traffic on the backend server port

The port must be accessible **from the proxy server**, not necessarily publicly.

Failure to allow both TCP and UDP traffic may result in:
- failed player transfers
- connection timeouts
- unexpected disconnects

---

## 3. OrbisProxy Backend Mod Configuration

OrbisProxy uses a backend mod that must be installed on each Hytale server.

### Installation
1. Place the OrbisProxy mod JAR into the server’s `mods/` directory
2. Start the server once to generate the default configuration files
3. Stop the server again before editing the configuration

---

## 4. Secret Configuration

Open the following file on the backend server:

```
mods/OrbisProxy_OrbisProxy/config.json
```

Set the `SecretKey` value to **exactly the same value** as `proxySecret` in the OrbisProxy `config.yml`.

Example:

```json
{
  "SecretKey": "YOUR_PROXY_SECRET"
}
```

Important notes:
- The secret must match exactly
- Do not share this value publicly
- All backend servers connected to the same proxy must use the same secret

If the secret does not match, the backend server will be rejected by the proxy.

---

## 5. Summary Checklist

Before starting the backend server, ensure the following:

- `--auth-mode insecure` is enabled
- Firewall allows TCP and UDP traffic on the server port
- OrbisProxy backend mod is installed
- `SecretKey` in `mods/OrbisProxy_OrbisProxy/config.json` matches `proxySecret` in the proxy configuration

---

## 6. Troubleshooting

If players cannot connect or are immediately disconnected:

- Verify the secret matches on both sides
- Check firewall rules between proxy and backend
- Ensure the backend server is running with `--auth-mode insecure`
- Review proxy and backend logs for authentication errors

---

### Health Check Connectivity

In addition to normal backend communication, the **TCP port of the backend server must also be reachable for health checks**.

OrbisProxy uses a TCP-based health check to determine whether a backend server is online and available.  
If the TCP port is blocked or unreachable, the server may be marked as offline even if it is running.

Make sure that:
- The backend server’s **TCP port is accessible from the proxy**
- No firewall rules block incoming TCP connections from the proxy host

If the health check fails, the server will not be considered a valid transfer target and may be excluded from pools or fallback handling.
