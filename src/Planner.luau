local function solve(actions, context, goal, plan, cost)
	local goal = goal
	local plan = plan
	
	local satisfied = true
	for name, value in pairs(goal) do
		if context[name] ~= value then
			satisfied = false
			break
		end
	end
	
	if satisfied then return plan, cost end

	local lowestCost = math.huge
	local bestPlan

	for _, action in pairs(actions) do
		local effects = action.effects
		if not effects then continue end

		local nextGoal = {}

		for name, value in pairs(goal) do
			nextGoal[name] = value
		end

		local changed = false

		for name, value in pairs(effects) do
			if nextGoal[name] == value then
				nextGoal[name] = nil
				changed = true
			end
		end

		if not changed then continue end
		
		for name, value in pairs(action.preconditions) do
			nextGoal[name] = value
		end

		local nextPlan = table.clone(plan)
		table.insert(nextPlan, 1, action.name)

		local resultPlan, resultCost = solve(actions, context, nextGoal, nextPlan, cost + action.cost)

		if resultPlan and resultCost < lowestCost then
			bestPlan = resultPlan
			lowestCost = resultCost
		end
	end

	return bestPlan, lowestCost
end

local Planner = {}

function Planner:Plan(actions, context)
	local solved, lowestCost = solve(actions, context, context.goal, {}, 0)
	
	local planned = {
		cost = lowestCost
	}
	for _, required in ipairs(solved) do
		for _, action in ipairs(actions) do
			if action.name == required then
				table.insert(planned, action)
				break
			end
		end
	end
	
	return planned, solved
end

return Planner
