function love.load()
	require('src/startup')
    	startup()

	ent_w1 = tiny.world(player)
	
end

function love.update(dt)

	wf_world:update(dt)

	player:update(dt)

	cam:update(dt)

    	cam:follow(player.collider:getX(), player.collider:getY())

	cam:setFollowLerp(0.2)
    	
	cam:setFollowStyle('SCREEN_BY_SCREEN')
	
	debug:update(dt)

end

function love.draw()

	cam:attach()
	love.graphics.push()
		love.graphics.scale(size, size)
			map.world1:drawLayer(map.world1.layers["bg"], 0)
			map.world1:drawLayer(map.world1.layers["fg"], 0)
	love.graphics.pop()

		sprite.player.current:draw(sprite.player.walkSheet, player.collider:getX(), player.collider:getY(), 0, size, size, 12, 22)

		wf_world:draw()

	cam:detach()

	hud:draw()

	debug:draw()

	drawCursor()

end
