function start()
	_G.graphics_size = 3

	love.window.setMode(love.graphics.getWidth() * graphics_size, love.graphics.getHeight() * graphics_size)
	love.graphics.scale(graphics_size, graphics_size)
	--Libraries:
		wf = require('lib/windfield')
		a8 = require('lib/anim8')
		hb_world = wf.newWorld()
	--Scripts:
		require('src/player')
end
