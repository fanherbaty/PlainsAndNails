

function love.draw()
	love.graphics.print('' ..player.type, 0, 0)

	hb_world:draw()
end
