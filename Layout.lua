--[[
This script arranges launchers and the activator hexagon according to user settings,
which can be found in SpecteralHex.ini. In the other words, this script sets all
x and y cordinates for meters in the skin.
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
	
	--Reading settings and other necessary values from "variables.inc"
	is_horizontal = tonumber(SKIN:GetVariable('Horizontal'))
	is_inverse = tonumber(SKIN:GetVariable('Inverse'))
	is_red = tonumber(SKIN:GetVariable('RedActivator'))
	icon_size = SKIN:GetVariable('IconSize')
	activator = SKIN:GetMeter('Activator')

	--Turning activator to red if 'RedActivator' setting is 1 (on).
	if(is_red == 1) then
		SKIN:Bang("!SetOption activator SolidColor 255,0,0,255")
	end
	
	
	--Arranging launchers. 
	for i=1,launcher_count,1 do
		launcher = SKIN:GetMeter('Launcher'..tostring(i))
		hold_area = SKIN:GetMeter('HoldArea')
		cordinate = icon_size * i
		
		if(is_horizontal == 1) then
			if(i == launcher_count) and (is_inverse == 1) then
				--Positioning 'Activator' in to other end in the final loop round.
				activator:SetX(launcher_count * icon_size)
				launcher:SetX(cordinate-icon_size)
			elseif(is_inverse == 1) then 
				launcher:SetX(cordinate-icon_size)
				hold_area:SetH(icon_size)
				hold_area:SetW(icon_size * launcher_count + icon_size)	
			else	
				launcher:SetX(cordinate)
				hold_area:SetH(icon_size)
				hold_area:SetW(icon_size * launcher_count + icon_size)
			end
		else	
			if(i == launcher_count) and (is_inverse == 1) then
				--Positioning 'Activator' in to other end in the final loop round.
				activator:SetY(launcher_count * icon_size)
				launcher:SetY(cordinate-icon_size)
			elseif(is_inverse == 1) then 
				launcher:SetY(cordinate-icon_size) --positioning needs to start a block earlier here
				hold_area:SetH(icon_size * launcher_count + icon_size)
				hold_area:SetW(icon_size)			
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

