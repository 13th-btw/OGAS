local Action = {}
Action.__index = Action

function Action.new(data)
	data = data or {}

	data.cost = data.cost or 0
	data.preconditions = data.preconditions or {}
	data.effects = data.effects or {}
	data.name = data.name or "Action"
	data.steps = data.steps or {}

	return setmetatable(data, Action)
end

return Action
