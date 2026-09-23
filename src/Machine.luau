local Executor = require(script.Parent.Executor)
local HttpService = game:GetService("HttpService")

local function DeepCopy(t)
	if type(t) ~= "table" then
		return t
	end
	local copy = {}
	for k, v in pairs(t) do
		copy[k] = DeepCopy(v)
	end
	return copy
end

local Machine = {}
Machine.__index = Machine

function Machine.new()
	local self = setmetatable({}, Machine)

	self.id = HttpService:GenerateGUID(false)
	self.states = {}
	self.state = nil

	return self
end

function Machine:AddState(name, data)
	local state = DeepCopy(data)
	state.name = name
	table.insert(self.states, state)
end

function Machine:PopState(name)
	for i, state in ipairs(self.states) do
		if state.name == name then
			self.states[i] = nil
			break
		end
	end
end

function Machine:ChangeState(name)
	for _, state in ipairs(self.states) do
		if state.name == name then
			self.state = state.name
			break
		end
	end
end

function Machine:GetState(name)
	name = name or self.state
	for _, state in ipairs(self.states) do
		if state.name == name then
			return state
		end
	end
end

function Machine:GetAction(name)
	local state = self:GetState()
	if state then
		for _, action in ipairs(state) do
			if action.name == name then
				return action
			end
		end
	end
end

function Machine:TriggerAction(name, context)
	local state = self:GetState()
	if state then
		local action = self:GetAction(name)
		if action then
			Executor:Execute(action, context)
		end
	end
end

return Machine
