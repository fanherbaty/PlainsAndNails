player = {
	name = 'Lucio',
	type = -1,
	enemy_hb = hb_world:newRectangleCollider(0, 0, 23 * graphics_size, 44 * graphics_size),
	sprite = {
		cycle = 0.1,
		sheet = love.graphics.newImage('as/img/player/lucio/sheet.png'),
	}
}

player.sprite.g = a8.newGrid(48, 48, player.sprite.sheet:getWidth(), player.sprite.sheet:getHeight())

function player:update(dt)
	player.vec2 = {0, 0}
end
