local If = {}

function If.new(check, step)
	check = check
		or function(context)
			return true
		end
	step = step or {}
	step.type = step.type or "Parallel"

	local data = {}
	data.type = "If"
	table.insert(data, check)
	table.insert(data, step)

	return data
end

return If
