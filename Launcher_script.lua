--[[
Notice how image paths must be given here.
--]]


function Initialize()
	counter = 0
end


function Update()
	trigger = tonumber(SKIN:GetVariable('Trigger'))
	if(trigger == 1) then
		SKIN:Bang('[!SetOption "launchers" ImageName "#@#Images\\Icons\\1icon1.png"][!UpdateMeter "launchers"][!Redraw]')
	else
		SKIN:Bang('[!SetOption "launchers" ImageName "#@#Images\\Icons\\0icon1.png"][!UpdateMeter "launchers"][!Redraw]')
	end
	
	
	
	--Delete these
	if counter % 2 == 0 then
		SKIN:Bang('[!HideMeter Sign][!Redraw]')
	else
		SKIN:Bang('[!ShowMeter Sign][!Redraw]')
	end
	counter = counter + 1

	
	for i=1,6,1
	do 
	   print(i)
	end


end
