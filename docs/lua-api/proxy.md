# proxy

Global object available inside every Lua plugin.

## proxy:getPlayerCount()

Returns the number of currently connected players.

**Returns:** `number`

``` lua
local players = proxy:getPlayerCount()
print(players)
```


## proxy:getVersion()

Returns the proxy version string.

**Returns:** `string`

``` lua
print(proxy:getVersion())
```

## proxy:getFingerprint()

Returns a unique fingerprint for this proxy instance.

**Returns:** `string`

``` lua
print(proxy:getFingerprint())
```

## proxy:on(eventName, callback)

Registers an event listener.

``` lua
proxy:on("session_connect", function(event)
    print("Player connected")
end)
```

## proxy:getServerList()

Returns a list of all registered backend servers.

**Returns:** `table` (array of server objects)

### Server Object Schema

``` lua
{
    name = string,
    players = number,
    healthy = boolean
}
```

### Example

``` lua
local servers = proxy:getServerList()

for i, server in ipairs(servers) do
    log("Server: " .. server.name .. 
        " | Players: " .. server.players .. 
        " | Healthy: " .. tostring(server.healthy))
end
```