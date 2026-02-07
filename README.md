# OrbisProxy


[![Discord](https://img.shields.io/badge/Discord-Join-blue?logo=discord)](https://discord.gg/4uDaw4pH7F)
[![Latest Release](https://img.shields.io/github/v/release/OrbisProxy/proxy?label=Latest%20Release)](https://github.com/OrbisProxy/proxy/releases/latest)

**Alpha – Work in Progress**  
This project is currently in early development. Things may change and bugs are expected.  
Please open an issue if you run into problems or unexpected behavior.

OrbisProxy is a lightweight, high-performance proxy written in Go (not Java).  
It is designed for reliability, scalability with built-in loadbalancing, player transfers, and plugin support (WIP).

---

## Features

- Written in Go for low memory usage and high performance
- Server with load balancing strategies
- Player transfer system
- Automatic fallback handling
- Plugin extensibility
- Lua Plugin API (work in progress)
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

| Command | Arguments | Permission | Description |
|---------|-----------|-----------|-------------|
| `/proxy` | — | — | Shows all proxy commands |
| `/proxy` | `servers` | — | Lists all servers and their online/offline status |
| `/whereami` | — | — | Displays the current server |
| `/transfer` | `<server> [player]` | `orbisproxy.command.transfer` | Transfer a specific player to a server |
| `/transfer` | `<server> all` | `orbisproxy.command.transfer` | Transfer all players to a server |
| `/transfer` | `<pool-name>` | `orbisproxy.command.transfer` | Transfer player to a pool (auto-selected target) |

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

### Lua API (Work in Progress)
Quick and easy scripting for lightweight plugins. Documentation coming soon.

### Go API (Planned)
Advanced plugin development in Go.  
Linux only. Windows is not supported.

---

## Installation (Linux Service)

Example systemd service file:

Create file:
``/etc/systemd/system/orbisproxy.service``

Content:
```
[Unit]
Description=OrbisProxy Service
After=network.target

[Service]
Type=simple
WorkingDirectory=/opt/orbisproxy
ExecStart=/opt/orbisproxy/orbisproxy -c config.yml
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
```
Then run:

`sudo systemctl daemon-reload`<br>
`sudo systemctl enable orbisproxy`<br>
`sudo systemctl start orbisproxy`

---

## License

Closed Source currently.