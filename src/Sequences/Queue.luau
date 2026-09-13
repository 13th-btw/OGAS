local Queue = {}

function Queue.new(data)
	data = data or {}
	data.type = "Queue"

	return data or {}
end

function Queue:Item(namespace, name, args)
	return {
		name = string.format("%s.%s", namespace, name),
		args = args,
	}
end

return Queue
