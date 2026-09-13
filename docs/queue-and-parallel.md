# Queue and Parallel
`Queue` and `Parallel` is mostly similliar expect fact that `Parallel` items executes simultaneously

## `.new(LIST_OF_ITEMS)`
`.new()` accepts list of items that will be executed

## `:item(namespace, name, args)`
`:item()` creates a new item inside of created `Queue`/`Parallel`. Lets see what each argument do:

- `namespace` - basically, a system module name. You can learn what system is [here]()
- `name` - name of function that you want to execute from `namespace`
- `args` - table that have all arguments for function `name`

### Code example
```lua
local Queue = require(PATH_TO_QUEUE_MODULE)
local Parallel = require(PATH_TO_PARALLEL_MODULE)

Queue.new({
    Queue:item("Message", "message", {"Hello, World!"})
})

Parallel.new({
    Parallel:item("Message", "message", {"Hello, World!"})
})
```
