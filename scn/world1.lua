function love.load()
	require('src/startup')
  startup()

end

function love.update(dt)

	wf_world:update(dt)

	player:update(dt)

	cam:update(dt)

	hud:update(dt)

	cam:follow(player.collider:getX(), player.collider:getY())

	cam:setFollowLerp(0.2)

	cam:setFollowStyle('LOCKON')

	debug:update(dt)

end

function love.draw()

	cam:attach()
	love.graphics.push()
		love.graphics.scale(size, size)
			map.world1:drawLayer(map.world1.layers["bg"], 0, size)
			map.world1:drawLayer(map.world1.layers["fg"], 0, size)
	love.graphics.pop()

		player:draw()

		if debug.isOn == true then
			wf_world:draw()
		end
	cam:detach()

	hud:draw()

	debug:draw()

	drawCursor()

end
