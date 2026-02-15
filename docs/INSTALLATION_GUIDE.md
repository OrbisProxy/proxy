# Linux Service Installation Guide

This guide explains how to install **OrbisProxy** on Linux as a systemd
service, including downloading the binary from GitHub, setting
permissions, and managing the service.

------------------------------------------------------------------------

## 1. Download OrbisProxy

Download the latest Linux binary (`orbisproxy-linux`) from the GitHub
releases.

``` bash
cd /opt
sudo mkdir -p /opt/orbisproxy
cd /opt/orbisproxy

# Download latest release binary
sudo wget https://github.com/OrbisProxy/proxy/releases/latest/download/orbisproxy-linux -O orbisproxy
```

------------------------------------------------------------------------

## 2. Set Execute Permissions

After downloading, you MUST make the binary executable:

``` bash
sudo chmod +x /opt/orbisproxy/orbisproxy
```

Without this step, the service will not start.

------------------------------------------------------------------------

## 3. Configuration File

⚠️ You do NOT need to create a config file manually.

The `config.yml` file is automatically generated on the first start of
OrbisProxy.

The configuration file will be located in the same directory as the
OrbisProxy binary:

    /opt/orbisproxy/config.yml

After the first start, you can edit the file and restart the service.

------------------------------------------------------------------------

## 4. Create systemd Service

Create the service file:

``` bash
sudo nano /etc/systemd/system/orbisproxy.service
```

Paste the following:

``` ini
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

Save and exit.

------------------------------------------------------------------------

## 5. Enable and Start the Service

Reload systemd:

``` bash
sudo systemctl daemon-reload
```

Enable OrbisProxy to start on boot:

``` bash
sudo systemctl enable orbisproxy
```

Start the service:

``` bash
sudo systemctl start orbisproxy
```

------------------------------------------------------------------------

## 6. Service Management Commands

### Check Status

``` bash
sudo systemctl status orbisproxy
```

### Restart the Proxy

``` bash
sudo systemctl restart orbisproxy
```

### Stop the Proxy

``` bash
sudo systemctl stop orbisproxy
```

### View Logs

``` bash
journalctl -u orbisproxy -f
```

------------------------------------------------------------------------

# Pterodactyl Egg

A ready-to-use Pterodactyl Egg is included in the repository:

[Download Pterodactyl Egg](/deployment/orbisproxy-egg.json)

## Importing the Egg

1.  Go to the Pterodactyl Admin Panel
2.  Navigate to Nests → Import Egg
3.  Upload `orbisproxy-egg.json`
4.  Create a new server using the imported egg

------------------------------------------------------------------------

# Directory Structure After First Start

    /opt/orbisproxy
     ├── orbisproxy
     ├── config.yml   (auto-generated)

------------------------------------------------------------------------

# Requirements

-   Linux system with systemd
-   Root or sudo privileges
-   Open required firewall ports

------------------------------------------------------------------------

# Troubleshooting

If the service does not start:

1.  Check file permissions (`chmod +x`)

2.  Check logs with:

    ``` bash
    journalctl -u orbisproxy -xe
    ```

------------------------------------------------------------------------

# Done

OrbisProxy will automatically generate its configuration file on first
launch and will restart automatically if it crashes or the system
reboots.
