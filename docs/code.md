# Code
`Code` used to execute your own functions as step

## `.new(CODE_FUNC)`
`.new()` accepts function that will be executed, function accepts `context`

## Code example
```lua
local Code = require(PATH_TO_OGAS.Sequences.Code)

Queue.new(function(context)
    print(context.player)
end)
```
