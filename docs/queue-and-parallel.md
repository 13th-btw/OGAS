# Queue and Parallel
`Queue` and `Parallel` is mostly similliar expect fact that `Parallel` items executes simultaneously

## `.new(LIST_OF_ITEMS)`
`.new()` accepts list of items that will be executed

## `:Item(namespace, name, args)`
`:Item()` creates a new item inside of created `Queue`/`Parallel`. Lets see what each argument do:

- `namespace` - basically, a system module name
- `name` - name of function that you want to execute from `namespace`
- `args` - table that have all arguments for function `name`

## Code example
```lua
local Queue = require(PATH_TO_OGAS.Sequences.Queue)
local Parallel = require(PATH_TO_OGAS.Sequences.Parallel)

Queue.new({
    Queue:Item("Message", "message", {"Hello, World!"})
})

Parallel.new({
    Parallel:Item("Message", "message", {"Hello, World!"})
})
```
