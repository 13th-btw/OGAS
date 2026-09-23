# Machine module
`Machine` module is small class of state machine that supported by other modules like `Executor` and `Planner`

## `.new()`
Creates new `Machine` that has these properties:
- `state` - string value that represents current state
- `states` - contains all states
- `id` - http-generated id 

## `:AddState(NAME, STATE_DATA)`
This function adds `STATE_DATA` to `states`

## `:PopState(NAME)`
This function removes state that `name == NAME`

## `:ChangeState(NAME)`
This function changes `state` to `NAME` if state with given name exists in `states`

## `:GetState(NAME)`
This function returns state with given `NAME` or current state if `NAME == nil`

## `:GetAction(NAME)`
This function returns action with corresponding `NAME` if its exists in `state`

## `:TriggerAction(NAME, CONTEXT)`
This functions executes action with given additional `CONTEXT` by `Executor`

## Code example
```lua
local Players = game:GetService("Players")

local Machine = require(PATH_TO_OGAS.Machine)
local Action = require(PATH_TO_OGAS.Action)

local message = Action.new({
	-- view action.md to see how to use it
})

local initialize = Action.new({
	-- view action.md to see how to use it
})

Players.PlayedAdded:Connect(function(player)
    local machine = Machine.new()
	machine.state = "idle"
	
	machine.states = {
		{
			name = "idle",
			message,
		},
		
		{
			name = "initialize",
			initialize
		},
	}
end)
```
