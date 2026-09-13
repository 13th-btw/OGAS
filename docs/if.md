# If
`If` is a combination of `Queue`/`Parallel` and function that returns `boolean`

## `.new(IF_DATA)`
`IF_DATA` contains 2 properties: `check` and `step`. Lets see what they do:

- `check` - function that returns `boolean` value and accepts `context`
- `step` - step structure that can be `Queue` or `Parallel`

### Code example
```lua
local Queue = require(PATH_TO_QUEUE_MODULE)
local If = require(PATH_TO_IF_MODULE)

If.new(
	function(context)
	    return context.player.Character.Humanoid.Health < 0
	end,
			
	Queue.new({
		Queue:item("Message", "message", {"Players character is dead!"})
	})
)
```