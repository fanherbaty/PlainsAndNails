  function startup()

	size = 4
	love.window.setMode(320 * size, 180 * size)
	love.graphics.setDefaultFilter('nearest', 'nearest')

	love.mouse.setVisible(false)

	--Libraries


	sti = require("../lib/sti")
	anim8 = require("../lib/anim8")
	wf = require("../lib/windfield")
	camera = require('../lib/camera')
	g3d = require('../lib/g3d')
	require('../lib/scene_menager')
	Scene:unload()
	cam = camera()
	wf_world = wf.newWorld()

	wf_world:addCollisionClass("player")

	wf_world:addCollisionClass("enemy")

	wf_world:addCollisionClass("solid")

	--Scripts
	require('src/inputStorage')
	require('src/resources')
	require('src/debug')
	require('src/hud')
	require('src/player')

end
