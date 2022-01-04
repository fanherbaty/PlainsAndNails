function love.conf(t)
	t.window.title = "Plains And Nails (Build 21122021)" --Always while you build/sent a final version change the build date (the number after the word "Build") to the day you build it (DD/MM/YYYY)
	t.window.icon = "as/icon.png"
	t.version = '11.3'
	t.window.height = 240
	t.window.width = 320
	t.window.vsync = 1 --The VSync is on, because it would cause a lot of de-sync problems while being on, like the camera's lerp not working correctly.
	t.window.msaa = 0
end
