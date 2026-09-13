# Getting started

## Installing
1. Download last version from [releases](https://github.com/nevervoyage/OGAS/releases)
2. Import folder in `ServerStorage`
3. Learn more about OGAS

## Basics
OGAS is Action-based system that provides very easy api to make actions for entities fast

If long story short, you create own systems (learn more about them [here]()) that then you can use in own made `Action`s

Your main modules will be `Action`, `Queue`, `Parallel`, `If` and `Executor`. Lets describe them shortly

- **Executor** - the core of whole system. Use executor to use any action. [Learn more here]()
- **Action** - main constructor for actions, requires `Queue`/`Parallel`/`If` to made. [Learn more here]()
- **Queue** and **Parallel** - list of *steps* or *components* uses. Difference between them is that parallel is async. [Learn more here]()
- **If** - main condition. Its requires `Queue`/`Parallel` to be used. [Learn more here]()
