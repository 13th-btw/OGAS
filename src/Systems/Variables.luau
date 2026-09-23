local Variables = {}

function Variables.set(context, name, value)
	context.variables = context.variables or {}
	context.variables[name] = value
end

function Variables.pop(context, name)
	context.variables = context.variables or {}
	context.variables[name] = nil
end

return Variables
