if fs.exists("msgs")==true then
	os.unloadAPI("msgs")
	fs.delete("msgs")
	fs.copy("disk/msgs", "msgs")
else
	fs.copy("disk/msgs", "msgs")
end
if fs.exists("startup")==true then
	fs.delete("startup")
	fs.copy("disk/autoscript", "startup")
else
	fs.copy("disk/autoscript", "startup")
end
os.setComputerLabel("Programmed PC "..tostring(os.getComputerID()))
write("Installation / update complete!\n")
local side = {"left", "right", "bottom", "front", "back", "top"}
for i=1,6 do
	if disk.isPresent(side[i])==true then
		disk.eject(side[i])
		write("Successfully ejected disk at: "..side[i].."!\n")
	end
end