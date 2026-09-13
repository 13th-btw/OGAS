local System = require(script.Parent.System)

local Executor = {}

function Executor:context(additional)
	local context = additional or {}

	for name, system in System:systems() do
		context[name] = system
	end

	return context
end

function Executor:execute(action, additional)
	local context = Executor:context(additional)

	for _, step in ipairs(action.steps) do
		local stepType = step.type
		local isAsync = stepType == "Parallel"
		local isCondition = stepType == "If"

		local canExecute = true
		if step.preconditions then
			for name, value in pairs(step.preconditions) do
				if context[name] ~= value then
					canExecute = false
				end
			end
		end

		if not canExecute then
			continue
		end

		if step.effects then
			for name, value in pairs(step.effects) do
				context[name] = value
			end
		end

		if isCondition then
			local check = step[1]
			if not check(context) then
				continue
			end

			step = step[2]
			isAsync = step.type == "Parallel"
		end

		for _, item in ipairs(step) do
			local itemName = string.split(item.name, ".")
			local itemArgs = item.args

			local itemNamespace = itemName[1]
			local itemFunction = itemName[2]

			local result, newContext = context[itemNamespace][itemFunction](context, unpack(itemArgs))
			if result and not isAsync then
				task.wait(result)
			end
			if newContext then
				context = newContext
			end
		end
	end
end

return Executor
