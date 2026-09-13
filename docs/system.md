# System
`System` is basically basic modules

## How to create a system?
`System` is module located in `OGAS/Systems` folder. Their api automatically used in [`Executor:context()`]() function

### Code example
```lua
-- OGAS/Systems/Message.luau
local module = {}

function module:message(context, message)
    print(context.player, "says", message)
end

return module
```