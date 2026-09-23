# Planner module
`Executor` module have 2 main functions: `:Plan(ACTIONS, CONTEXT)`

## `:Plan(ACTIONS, CONTEXT)`
This function plans best actions to execute based on their `action.cost` property, `action.preconditions` and `action.effects`. Its returns 2 tables:
- `planned` table - contains sorted actions in table that ready to be executed by `Executor:ExecutePlan()`. Its also contains `cost` property that set to full cost of plan
- `solved` table - contains only names of actions

`CONTEXT` required to be setted by hand with required property `goal`. `goal` used as "requirement" to make a full plan, its compares same properties in `CONTEXT` and `goal` (for example: `CONTEXT.player == goal.player`)

## `:PlanMachine(MACHINE, CONTEXT)`
Same as `:Plan()` but takes in account all states and their actions of `MACHINE`

## Code example
```lua
local Players = game:GetService("Players")

local Executor = require(PATH_TO_OGAS.Executor)
local Planner = require(PATH_TO_OGAS.Planner)
local Action = require(PATH_TO_OGAS.Action)

local message = Action.new({
	name = "Message",
	
	effects = {
		playerMesssaged = true
	},
	
	-- steps = ...
})

local initialize = Action.new({
	name = "Initialize",

	preconditions = {
		playerMesssaged = true
	},

	effects = {
		playerInitialized = true
	},

	-- steps = ...
})

Players.PlayerAdded:Connect(function(player)
	local context = {
		player = player,
		playerJoined = true,
		playerHasData = true,

		goal = {
			playerInitialized = true
		}
	}

    local plan = Planner:Plan({
		message,
		message, -- ignores duplicates
		initialize
	}, context)
	
	Executor:ExecutePlan(plan, context) -- will return {message, initialize} actions
end)
```
