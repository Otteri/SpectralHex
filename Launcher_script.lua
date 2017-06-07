function Initialize()
	counter = 0
end


function Update()
	--Delete these
	if counter % 2 == 0 then
		SKIN:Bang('!HideMeter Sign')
	else
		SKIN:Bang('!ShowMeter Sign')
	end

	counter = counter + 1
	-----------------------
	
	
	
	
	for i=1,6,1
	do 
	   print(i) 
	end


end
