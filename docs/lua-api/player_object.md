 # Player Object

The `Player` object represents a connected player session.

It is available in certain events such as:

-   [`session_connect`](./events.md#session_connect)
-   [`session_connected`](./events.md#session_connected)

The Player object is read-only from Lua unless explicitly documented
otherwise.

---

## player:getName()

Returns the player's display name.

**Returns:** `string`

``` lua
local name = event.player:getName()
```

## player:getUUID()

Returns the player's unique UUID.

**Returns:** `string`

``` lua
local uuid = event.player:getUUID()
```

## player:getServer()

Returns the name of the backend server the player is currently connected
to.

**Returns:** `string | nil`

Returns `nil` if the player is not yet connected to a backend.

## Player Example

``` lua
proxy:on("session_connected", function(event)
    local player = event.player

    log("Name: " .. player:getName())
    log("UUID: " .. player:getUUID())
    log("Server: " .. tostring(player:getServer()))
end)
```