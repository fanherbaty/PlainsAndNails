function love.load()
	require("src/startup")
	startup()
end

function love.update(dt)

end

function love.draw()

  debug:update(dt)

	models.plane:draw()

	local icons = {}

	function icons:draw_w1()

		local deskx = 160 * size
		local desky = 16 * size
		local deska = (math.cos(love.timer.getTime() * 2) / 10)

		local iconx = 160 * size

		local layer_y1 = (math.sin(love.timer.getTime() * 3) * (2.5 * size))
		local layer_y2 = (math.cos(love.timer.getTime() * 4) * (0.5 * size))
		local layer_y3 = (math.sin(love.timer.getTime() * 2) * (3 * size))

		local icony = 100 * size

		map.descPlains:draw(map.descSheet, deskx, desky, deska, size, size, 48, 8)
		love.graphics.draw(map.world1_iconL1, iconx, icony + layer_y1, nil, size, size, map.world1_iconL1:getWidth() / 2, map.world1_iconL1:getHeight() / 2)
		love.graphics.draw(map.world1_iconL2, iconx, icony + layer_y2, nil, size, size, map.world1_iconL1:getWidth() / 2, map.world1_iconL1:getHeight() / 2)
		love.graphics.draw(map.world1_iconL3, iconx, icony + layer_y3, nil, size, size, map.world1_iconL1:getWidth() / 2, map.world1_iconL1:getHeight() / 2)
	end

	icons:draw_w1()

	drawCursor()
end
