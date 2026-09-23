# System
`System` is basically your api for `Executor`

`System` module only used in `Executor` BUT Systems used by you in every sequence (expect `Code`)

## Built-in systems

### Variables
> **DO NOT DELETE**

Allows you to set variables in `context` and use them in any other `:Item()`
they can be only used in tables

To use them you must place `#` before variable name as value of index
(e.g. `{ str = "#id" }` will replace `str` value with `id` variable)

### Message
Allows you to print some message with optinal `context.player`

### Machines
Allows you to manipulate `Machine` states

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

