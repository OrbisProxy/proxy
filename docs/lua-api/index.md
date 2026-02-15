# OrbisProxy Lua API

**Version:** 1.0.0

Welcome to the official Lua API documentation for OrbisProxy.\
This API allows you to create powerful plugins that integrate directly
into the proxy runtime.

## Available Modules

-   [`proxy`](./proxy.md)
-   [`scheduler`](./scheduler.md)
-   [`http`](./http.md)
-   [`json`](./json.md)
-   [`os`](./os.md)


## Available Events

See full documentation in: [`events.md`](./events.md)

## Player Object

See full documentation in: [`player_object.md`](./player_object.md)

## Example Plugin

``` lua
proxy:on("session_connect", function()
    print("Players online:", proxy:getPlayerCount())
end)
```

## API Versioning

You can check the Lua API version via:

``` lua
print(proxy:getApiVersion())
```

If breaking changes occur, the API version will increment accordingly.
