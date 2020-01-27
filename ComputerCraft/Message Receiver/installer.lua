local side = {"left", "right", "bottom", "front", "back"}
count = 0
count = tonumber(count)
for i=1,5 do
	if peripheral.isPresent(side[i])==true then
		if peripheral.getType(side[i])=="modem" then
			rednet.open(side[i])
			count = count + 1
			count = tonumber(count)
		end
	end
end
if count==0 then
	write("Please connect a Wireless Modem to use this!\n")
else
	if peripheral.getType("top")=="monitor" then
		local monitor = peripheral.wrap("top")
		monitor.clear()
		monitor.setCursorPos(1, 1)
		local index = "Local ID: "..tostring(os.getComputerID())
		write(tostring(index))
		oldx, oldy = monitor.getCursorPos()
		monitor.setCursorPos(1, oldy + 1)
		monitor.write("Message Reader:")
		monitor.setCursorPos(1, oldy + 2)
		while true do
			shell.run("monitor", "top", "output")
		end
	else
		write("Please connect a Monitor to the top!")
	end
end