local Parallel = {}

function Parallel.new(data)
	data = data or {}
	data.type = "Parallel"

	return data or {}
end

function Parallel:item(namespace, name, args)
	return {
		name = string.format("%s.%s", namespace, name),
		args = args,
	}
end

return Parallel
