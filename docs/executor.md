# Executor module
`Executor` module have 2 main functions: `:context(ADDITIONAL_CONTEXT)` and `:execute(ACTION, ADDITIONAL_CONTEXT)`

## `:context(ADDITIONAL_CONTEXT)`
This function is used to get context from all systems that you made and combine them in one table so `Action` can use them

## `:execute(ACTION, ADDITIONAL_CONTEXT)`
This function used to execute any `Action` with optional additional context

### Code example
```lua
local Players = game:GetService("Players")

local Executor = require(PATH_TO_EXECUTOR_MODULE)
local Action = require(PATH_TO_ACTION_MODULE)

local message = Action.new({
	-- view action.md to see how to use it
})

Players.PlayedAdded:Connect(function(player)
    Executor:execute(message, {
        player = player,
        playerJoined = true
    })
end)
```
