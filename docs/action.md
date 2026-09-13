# Action
`Action` is main structure for this framework

## What is action in code?
`Action` is created with `.new(ACTION_DATA)`

`Action` is combination of `Queue`s/`Parallel`s/`If`s structure and addtional data

Additional data that can be provided:
- `name` - name of action
- `preconditions` - conditions in `context` that must be met to execute this action
- `effects` - things that will be setted in `context` to provided value when actions sucefully exectued
- `cost` - cost of the actions, helper for GOAP systems that you can built around this framework
- `steps` - main table that containes all steps that action will execute

### Code example
```lua
local Players = game:GetService("Players")

local Executor = require(PATH_TO_EXECUTOR_MODULE)
local Action = require(PATH_TO_ACTION_MODULE)
local Queue = require(PATH_TO_QUEUE_MODULE)

local message = Action.new({
	name = "Message",

    preconditions = {
        playerJoined = true
    },

    effects = {
        playerMesssaged = true
    },
	
	steps = {
        -- view queue-and-parallel.md to understand what it does
		Queue.new({
            -- view system.md to understand what it does
            Queue:item("Message", "message", {"Hello, World!"})
        })
	}
})

Players.PlayedAdded:Connect(function(player)
    Executor:execute(message, {
        player = player,
        playerJoined = true
    })
end)
```
