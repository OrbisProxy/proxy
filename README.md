# OrbisProxy


[![Discord](https://img.shields.io/badge/Discord-Join-blue?logo=discord)](https://discord.gg/4uDaw4pH7F)
[![Latest Release](https://img.shields.io/github/v/release/OrbisProxy/proxy?label=Latest%20Release)](https://github.com/OrbisProxy/proxy/releases/latest)

### Supported Hytale Server Versions

![Hytale Release](https://img.shields.io/badge/dynamic/json?url=https://raw.githubusercontent.com/OrbisProxy/proxy/master/hytale-compat.json&query=$.primary&label=Hytale%20Release&color=brightgreen&style=for-the-badge&style=flat)
![Hytale PreRelease](https://img.shields.io/badge/dynamic/json?url=https://raw.githubusercontent.com/OrbisProxy/proxy/master/hytale-compat.json&query=$.pre_release_tested[0]&label=Hytale%20Pre-Release&color=orange&style=for-the-badge&style=flat)

**Alpha – Work in Progress**  
This project is currently in early development. Things may change and bugs are expected.  
Please open an issue if you run into problems or unexpected behavior.

OrbisProxy is a lightweight, high-performance proxy written in Go (not Java).  
It is designed for reliability, scalability with built-in loadbalancing, player transfers, and plugin support.

---

## Features

- Written in Go for low memory usage and high performance
- Server with load balancing strategies
- Player transfer system
- Automatic fallback handling
- Route-based connections
  - Define hostnames and automatically route incoming connections to specific backend servers based on the used domain
- Multi-language support with per-player localization (en, de, zh, es, ru)
- Plugin extensibility
- [Lua Plugin API](#lua-api)
- **(Planned)** Go Plugin API (Linux only) for advanced plugin extensibility

---

## Concepts

### Load Balancing
Pools group multiple servers and distribute players automatically using a strategy like round-robin.

Example:
If you transfer a player to a pool name, OrbisProxy automatically selects the target server based on the pool strategy.

### Fallback
If a backend server crashes or becomes unreachable, all players are automatically moved to the configured fallback server.

---

## Commands

| Command | Arguments                    | Permission | Description |
|---------|------------------------------|-----------|-------------|
| `/proxy` | —                            | `orbisproxy.command.proxy` | Shows all proxy commands |
| `/proxy` | `servers`                    | `orbisproxy.command.proxy.servers` | Lists all servers and their online/offline status |
| `/proxy` | `version`                    | `orbisproxy.command.proxy.version` | Shows the proxy version |
| `/proxy` | `find --target=[player]`     | `orbisproxy.command.proxy.find` | Find a specific player on the proxy |
| `/transfer` | `<server> --target=[player]` | `orbisproxy.command.transfer` | Transfer a specific player to a server |
| `/transfer` | `<server> --all`             | `orbisproxy.command.transfer` | Transfer all players to a server |
| `/transfer` | `<pool-name>`                | `orbisproxy.command.transfer` | Transfer player to a pool (auto-selected target) |

## Plugin and ClientReferral Transfers

Transfers can also be triggered by other plugins or by using the ClientReferral packet.
When using a ClientReferral transfer:
- The host field is interpreted as the target server or pool name
- The port value is ignored
- The host value must be prefixed with: `optransfer.<server>`

Where `<server>` is replaced by the server name or pool name defined in the configuration.

### Example
By using Hytales build-in `/refer` command.

To connect to server lobby-1: `/refer optransfer.lobby-1 1234`<br>
To connect to server lobby-2: `/refer optransfer.lobby-2 1234`<br>
To connect to pool lobby `/refer optransfer.lobby 1234`

---

## CLI Parameters

`-c "config.yml"`
Path to configuration file (optional, default: config.yml)

``-debug true``  
Enable debug logging (default: false)

---

## Plugin API

### Lua API
Quick and easy scripting for lightweight plugins.<br>
See the full Lua API reference here:  [Lua API Documentation](/docs/lua-api/index.md)

### Go API (Planned)
Advanced plugin development in Go.  
Linux only. Windows is not supported.

---

## Proxy Configuration
See example [Proxy Configuration](docs/PROXY_CONFIGURATION.md)

## Backend Server Setup
See [Backend Server Setup](docs/BACKEND_SERVER_SETUP.md) Guide

---

## Installation (Linux Service)

See [Linux Service Installation](docs/INSTALLATION_GUIDE.md) Guide

## Installation (Pterodactyl Egg)

See [Pterodactyl Egg](docs/INSTALLATION_GUIDE.md#pterodactyl-egg) Guide

## Deployment & Support

If you require any specific deployment options or assistance, please feel free to reach out to us on [Discord](https://discord.gg/4uDaw4pH7F).

## Compatible Hytale Mods

OrbisProxy is confirmed to work with a variety of Hytale mods, including:

- **Admin Portals** - fully supported

---

## License

Closed Source currently.