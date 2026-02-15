# http

Provides HTTP client functionality.

## http.get(url, headers?)

Returns: `body, status, error`

``` lua
local body, status, err = http.get("https://example.com")
```

## http.post(url, body, headers?)

Returns: `body, status, error`

``` lua
local body, status, err = http.post(
    "https://example.com",
    '{"hello":"world"}',
    {["Content-Type"] = "application/json"}
)
```
