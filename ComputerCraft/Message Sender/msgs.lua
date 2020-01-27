function Messages()
	msg = " "
	count = 0
	count = tonumber(count)
	local side = {"left", "right", "bottom", "front", "back", "top"}
	for i=1,6 do
		if peripheral.isPresent(side[i])==true then
			if peripheral.getType(side[i])=="modem" then
				count = count + 1
				count = tonumber(count)
				rednet.open(side[i])
			end
		end
	end
	if count==0 then
		write("Please connect a Wireless Modem to use this!\n")
		msg = "exit()"
	end
	id = 0
	if msg ~= "exit()" then
		write("Enter computer ID: ")
		id = read()
		id = tonumber(id)
		write("Enter a message to send (exit() to exit):")
		msg = read()
		msgg = os.getComputerID().." -> "
		msgg = msgg..tostring(id)
		msgg = msgg..": "
		msgg = msgg..msg
	end
	while msg ~= "exit()" do
		rednet.send(id, msgg)
		write("Enter a message to send (exit() to exit):")
		msg = read()
		msgg = os.getComputerID().." -> "
		msgg = msgg..tostring(id)
		msgg = msgg..": "
		msgg = msgg..msg
	end
end