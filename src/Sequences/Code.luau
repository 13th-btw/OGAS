local Code = {}

function Code.new(func)
	func = func
		or function(context)
			return context
		end

	local code = function(context)
		func(context)
		return context
	end

	local data = {}
	data.type = "Code"
	table.insert(data, code)

	return data
end

return Code
