function love.load()
	require('src/start')
	start()
end

function love.update(dt)

	ent_hitboxes:update(dt)
	
	player:update(dt)
	
end

function love.draw()

	love.graphics.setBackgroundColor(0.5,0.5,0.5)
	love.graphics.print('' ..player.type, 0, 0)

	ent_hitboxes:draw()

	player:draw()
end
