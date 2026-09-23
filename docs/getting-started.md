# Getting started

## Installing
1. Download last version from [releases](https://github.com/nevervoyage/OGAS/releases)
2. Import folder in `ServerStorage`
3. Learn more about OGAS

## Basics
OGAS is Action-based system that provides very easy api to make actions for entities fast

If long story short, you create own systems (learn more about them [here](https://github.com/nevervoyage/OGAS/blob/main/docs/system.md)) that then you can use in own made `Action`s

Modules can be divided in several groups:
- **Core**
- - `Executor`, `Planner`, `Action`
- **Sequences**
- - `Queue` and `Parallel`, `If` and `Switch`, `Code`

### List of all modules
- **Executor** - the core of whole system. Use executor to use any action. [Learn more here](https://github.com/nevervoyage/OGAS/blob/main/docs/executor.md)
- **Planner** - GOAP helper. Provides plans for provided actions list. [Learn more here](https://github.com/nevervoyage/OGAS/blob/main/docs/planner.md)
- **System** - very situational module for usage but required for `Executor`. [Learn more here](https://github.com/nevervoyage/OGAS/blob/main/docs/system.md)
- **Action** - main constructor for actions, requires `Queue`/`Parallel`/`If` to made. [Learn more here](https://github.com/nevervoyage/OGAS/blob/main/docs/action.md)
- **Queue** and **Parallel** - list of *steps* or *components* uses. Difference between them is that parallel is async. [Learn more here](https://github.com/nevervoyage/OGAS/blob/main/docs/queue-and-parallel.md)
- **If** and **Switch** - main conditions. Its requires `Queue`/`Parallel` to be used. [Learn more here](https://github.com/nevervoyage/OGAS/blob/main/docs/if-and-switch.md)
- **Code** - for those who want code seperate parts of action. [Learn more here](https://github.com/nevervoyage/OGAS/blob/main/docs/code.md)
