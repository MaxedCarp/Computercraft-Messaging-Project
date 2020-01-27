if fs.exists("output")==false then
	fs.copy("disk/output", "output")
	write("Successfully installed 1 / 2!\n")
else
	fs.delete("output")
	fs.copy("disk/output", "output")
	write("Successfully updated 1 / 2!\n")
end
if fs.exists("startup")==false then
	fs.copy("disk/installer", "startup")
	write("Successfully installed 2 / 2!\n")
	write("Installation Complete!\n")
else
	fs.delete("startup")
	fs.copy("disk/installer", "startup")
	write("Successfully updated 2 / 2!\n")
	write("Update Complete!\n")
end
os.setComputerLabel("MSG Reader "..tostring(os.getComputerID()))
local side = {"left", "right", "bottom", "front", "back"}
for i=1,5 do
	if disk.isPresent(side[i])==true then
		disk.eject(side[i])
		write("Successfully ejected disk at: "..side[i].."!\n")
	end
end
write("Reboot to start outputting to the top monitor!\n")