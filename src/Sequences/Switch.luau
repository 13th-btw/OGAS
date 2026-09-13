local Switch = {}

function Switch.new(cases)
	cases = cases or {}
	
	local data = {}
	data.type = "Switch"
	table.insert(data, cases)
	
	return data
end

return Switch
