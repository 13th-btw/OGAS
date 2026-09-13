local System = require(script.Parent.System)

local function steps(leftSteps, context)
	for _, step in ipairs(leftSteps) do
		if type(step) ~= "table" then continue end
		
		if step.type == "Code" then
			local func = step[1]
			
			context = func(context)
			
			continue
		end
		
		if step.type == "If" then
			local check = step[1]

			if check(context) then
				context = steps(step[2], context)
			end

			continue
		end
		
		if step.type == "Switch" then
			for _, case in ipairs(step[1]) do
				local check = case[1]
				local caseSteps = case[2]

				if check(context) then
					print(case)
					context = steps(caseSteps, context)
					break
				end
			end

			continue
		end
		
		local isAsync = step.type == "Parallel"
		
		for _, item in ipairs(step) do
			local itemName = string.split(item.name, ".")
			local itemArgs = item.args or {}

			local itemNamespace = itemName[1]
			local itemFunction = itemName[2]

			local result, newContext = context[itemNamespace][itemFunction](context, unpack(itemArgs))

			if result and not isAsync then task.wait(result) end
			if newContext then context = newContext end
		end
	end

	return context
end

local Executor = {}

function Executor:Context(additional)
	local context = additional or {}
	
	for name, system in System:systems() do
		context[name] = system
	end
	
	return context
end

function Executor:Execute(action, additional)
	local context = Executor:Context(additional)
	
	if action.preconditions then
		local canExecute = true

		for name, value in pairs(action.preconditions) do
			if context[name] ~= value then
				canExecute = false
				break
			end
		end

		if not canExecute then return end
	end
	
	if action.effects then
		for name, value in pairs(action.effects) do
			context[name] = value
		end
	end
	
	return steps(action.steps, context)
end

function Executor:ExecutePlan(plan, additional)
	local context = Executor:Context(additional)
	
	for _, action in ipairs(plan) do
		context = Executor:Execute(action, context)
	end
	
	return context
end

return Executor
