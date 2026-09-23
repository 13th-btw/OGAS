# Executor module
`Executor` module have 3 main functions: `:Context(ADDITIONAL_CONTEXT)`, `:Execute(ACTION, ADDITIONAL_CONTEXT)` and `:ExecutePlan(PLAN, ADDITIONAL_CONTEXT)`

## `:Context(ADDITIONAL_CONTEXT)`
This function is used to get `context` from all systems that you made and combine them in one table so `Action` can use them

## `:Execute(ACTION, ADDITIONAL_CONTEXT)`
This function used to execute any `Action` with optional additional `context`

## `:ExecutePlan(PLAN, ADDITIONAL_CONTEXT)`
This function executes plan that made by `Planner:Plan()`

## `:ExecuteMachineAction(MACHINE, NAME, ADDITIONAL_CONTEXT)`
This function executes machines action by its `name`
sets `context.machine` to `MACHINE`

## `:ExecuteMachinePlan(MACHINE, PLAN, ADDITIONAL_CONTEXT)`
Same as `:ExecutePlan()` but takes in account all states
you can set `goal.state` to have goal make machine be in particullar state

## Code example
```lua
local Players = game:GetService("Players")

local Executor = require(PATH_TO_OGAS.Executor)
local Action = require(PATH_TO_OGAS.Action)

local message = Action.new({
	-- view action.md to see how to use it
})

Players.PlayedAdded:Connect(function(player)
    Executor:Execute(message, {
        player = player,
        playerJoined = true
    })
end)
```
