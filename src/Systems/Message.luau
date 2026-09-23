local RunService = game:GetService("RunService")

local Message = {}

function Message.message(context, data)
	local isServer = RunService:IsServer()
	if isServer and not context.player then
		context.player = "Server"
	end

	print(context.player, "says", data.str)
end

return Message
