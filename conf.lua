function love.conf(t)
	t.window.title = 'Plains And Nails (Proto 4.2.2)' --Always while you build/sent a final version change the build date (the number after the word "Build") to the day you build it (DD/MM/YYYY)
	t.window.icon = 'assets/icon.png'
	t.version = '11.4'
	t.window.height = 240
	t.window.width = 427
	t.window.vsync = 1 --The VSync is on, because it would cause a lot of de-sync problems while being on, like the camera's lerp not working correctly.
end
