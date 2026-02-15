# scheduler

Provides timed task execution.

## scheduler:setInterval(callback, intervalMs)

Executes a function repeatedly.

**Returns:** `intervalId`

``` lua
local id = scheduler:setInterval(function()
    print("tick")
end, 5000)
```

------------------------------------------------------------------------

## scheduler:clearInterval(intervalId)

Stops a running interval.

``` lua
scheduler:clearInterval(id)
```

------------------------------------------------------------------------

## scheduler:setTimeout(callback, delayMs)

Executes a function once after a delay.

**Returns:** `timeoutId`

``` lua
scheduler:setTimeout(function()
    print("Executed once after delay")
end, 2000)
```