# If
`If` is a combination of `Queue`/`Parallel` and function that returns `boolean`

## `If.new(IF_DATA)`
`IF_DATA` contains 2 properties: `check` and `step`. Lets see what they do:

- `check` - function that returns `boolean` value and accepts `context`
- `step` - step structure that can be `Queue` or `Parallel`

## `Switch.new(SWITCH_DATA)`
You can count `SWITCH_DATA` as table of `IF_DATA`s, they work same

Order of cases counts, if you make "default" case first it will be executed all time

## Code example
```lua
local Queue = require(PATH_TO_OGAS.Sequences.Queue)
local If = require(PATH_TO_OGAS.Sequences.If)
local Switch = require(PATH_TO_OGAS.Sequences.Switch)

If.new(
	function(context)
	    return context.player.Character.Humanoid.Health < 0
	end,
			
	Queue.new({
		Queue:Item("Message", "message", {"Players character is dead!"})
	})
)

Switch.new({
	{
		function(context)
			return context.player.Character.Humanoid.Health < 0
		end,
				
		Queue.new({
			Queue:Item("Message", "message", {"Players character is dead!"})
		})
	},

	{
		function(context)
			return true -- you can use it as default case
		end,
				
		Queue.new({
			Queue:Item("Message", "message", {"Players character is alive!"})
		})
	},
})
```