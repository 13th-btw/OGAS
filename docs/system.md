# System
`System` is basically your api for `Executor`

`System` module only used in `Executor` BUT Systems used by you in every sequence (expect `Code`)

## How to create a system?
Systems is modules located in `OGAS/Systems` folder. Their api automatically required in `Executor:context()` function

Systems functions MUST use `.` syntax instead of `:` to work properly with `:Item()` functions. Functions accepts first argument as `context`

## Code example
```lua
-- OGAS/Systems/Message.luau
local module = {}

function module.message(context, message)
    print(context.player, "says", message)
end

return module
```