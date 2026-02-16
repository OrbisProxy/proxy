
# Events

OrbisProxy provides lifecycle events that plugins can subscribe to
using:

``` lua
proxy:on("event_name", function(event)
    -- handle event
end)
```

# Currently available events:

## session_connect

Triggered when a player initiates a connection and the proxy is about to
select a backend server.

This event is **mutable**.\
You may modify certain fields to influence routing behavior.

### Event Fields

| Field          | Type                               | Mutable | Description                                                  |
|---------------|------------------------------------|---------|--------------------------------------------------------------|
| target_server | `string`                           | ✅ Yes  | The backend server the player will be connected to.         |
| player        | [`Player`](./player_object.md)     | ❌ No   | The player object initiating the connection.                |


### Example

``` lua
proxy:on("session_connect", function(event)
    log("Player connecting to: " .. event.target_server)
    event.target_server = "lobby"
end)
```

## session_connected

Triggered after a player has successfully connected to the backend
server.

This event is **read-only** and cannot influence routing anymore.

### Event Fields

| Field          | Type                                             | Mutable | Description                                   |
|---------------|--------------------------------------------------|---------|-----------------------------------------------|
| server | `string`                                         | ❌ No   | The backend server the player is connected to. |
| player        | [`Player`](./player_object.md)                   | ❌ No   | The connected player object.                  |


### Example

``` lua
proxy:on("session_connected", function(event)
    log("Player successfully connected to " .. event.target_server)
end)
```