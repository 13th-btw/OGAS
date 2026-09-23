local Machines = {}

function Machines.addState(context, name, state)
	context.machine:AddState(name, state)
end

function Machines.popState(context, name)
	context.machine:PopState(name)
end

function Machines.changeState(context, name)
	context.machine:ChangeState(name)
end

return Machines
