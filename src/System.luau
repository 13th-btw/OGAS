local System = {}

function System:system(name)
	if not script.Parent.Systems:FindFirstChild(name) then
		return
	end
	return require(script.Parent.Systems[name])
end

function System:systems()
	local systems = {}

	for _, system in script.Parent.Systems:GetChildren() do
		if not system:IsA("ModuleScript") then
			continue
		end
		systems[system.Name] = require(system)
	end

	return systems
end

return System
