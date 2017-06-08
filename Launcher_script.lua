--[[
This file layouts icons either horizontally or vertically.
File also takes care of hold area, because its different in both cases.
--]]


function Initialize()
	--Checking how many Launchers do we have.
	--Max assumption is 1000. This check is excecuted only once.
	for i=1,1000,1 do
		val = SKIN:GetMeter('Launcher'..tostring(i))
		if(val == nil) then
			launcher_count = i-1
			break
		end
	end
end


function Update()


	is_horizontal = tonumber(SKIN:GetVariable('Horizontal'))
	icon_size = SKIN:GetVariable('IconSize')
	
	
	for i=1,launcher_count,1 do
		launcher = SKIN:GetMeter('Launcher'..tostring(i))
		hold_area = SKIN:GetMeter('HoldArea')
		cordinate = icon_size * i
		if(is_horizontal == 1) then
			launcher:SetX(cordinate)
			hold_area:SetH(icon_size)
			hold_area:SetW(icon_size * launcher_count + icon_size)
		else
			launcher:SetY(cordinate)
			hold_area:SetH(icon_size * launcher_count + icon_size)
			hold_area:SetW(icon_size)
		end
	end
	

end


