--[[
This file layouts icons either horizontally or vertically.
File also takes care of the hold area, because it's different in both cases.
--]]


function Initialize()
	--This function is executed only once.
	--Checking how many Launchers do we have. 
	--Max assumption is 1000, which should be way more than enough.
	for i=1,1000,1 do
		val = SKIN:GetMeter('Launcher'..tostring(i))
		if(val == nil) then
			launcher_count = i-1
			break
		end
	end
	
	--Reading necessary values from "variables.inc"
	is_horizontal = tonumber(SKIN:GetVariable('Horizontal'))
	is_inverse = tonumber(SKIN:GetVariable('Inverse'))
	is_red = tonumber(SKIN:GetVariable('RedActivator'))
	icon_size = SKIN:GetVariable('IconSize')
	activator = SKIN:GetMeter('Activator')

	if(is_red == 1) then
		SKIN:Bang("!SetOption activator SolidColor 255,0,0,255")
	end
	
	
	--Arranging launchers. 
	for i=1,launcher_count,1 do
		launcher = SKIN:GetMeter('Launcher'..tostring(i))
		hold_area = SKIN:GetMeter('HoldArea')
		cordinate = icon_size * i
		
		if(is_horizontal == 1) then
			if(is_inverse == 0) then 
				launcher:SetX(cordinate)
				hold_area:SetW(icon_size * launcher_count + icon_size)
				hold_area:SetH(icon_size)
			
			elseif(i == launcher_count) then
				--Positioning 'Activator' in the final loop round.
				activator:SetX(launcher_count * icon_size)
				activator:SetY('r')
			else
				launcher:SetX(cordinate)
				hold_area:SetH(icon_size)
				hold_area:SetW(icon_size * launcher_count + icon_size)
			end
			

		else	
			if(is_inverse == 0) then 
				launcher:SetY(cordinate)
				hold_area:SetH(icon_size * launcher_count + icon_size)
				hold_area:SetW(icon_size)
				
			elseif(i == launcher_count) and (is_inverse == 1) then
				--Positioning 'Activator' in the final loop round.
				activator:SetX('r')
				activator:SetY(launcher_count * icon_size)
				
				
			else
				launcher:SetY(cordinate)
				hold_area:SetH(icon_size * launcher_count + icon_size)
				hold_area:SetW(icon_size)
			end
			
			
		end
	end
end


function Update()
	--Active features come here if there will be any...
end

