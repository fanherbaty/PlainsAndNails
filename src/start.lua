function start()
	_G.graphics_size = 2

	love.window.setMode(love.graphics.getWidth() * graphics_size, love.graphics.getHeight() * graphics_size)
	love.graphics.scale(graphics_size, graphics_size)
	love.graphics.setDefaultFilter('nearest', 'nearest')

	--Libraries:
		require('lib/scene_menager')
		require('lib/switch')

		wf = require('lib/windfield')
		a8 = require('lib/anim8')

		ent_hitboxes = wf.newWorld()
		world_hitboxes = wf.newWorld()

	--Scripts:

		require('src/inputs')

		require('src/player')
end
