player = {}

	player.name = 'Lucio'
 	player.class = 'player'
	player.ent_hitbox = ent_hitboxes:newRectangleCollider(0, 0, 23 * graphics_size, 44 * graphics_size)
	player.world_hitbox = world_hitboxes:newCircleCollider(0, 0, 10)
	local vel = 250 * graphics_size
	local dir = nil

    local sprites = {}

		sprites.cycle = 0.125
		sprites.sheet = love.graphics.newImage('assets/img/player/lucio/sheet.png')
		sprites.g = a8.newGrid(48, 48, sprites.sheet:getWidth(), sprites.sheet:getHeight())

		sprites.walk_down = a8.newAnimation(sprites.g('1-5', 1), sprites.cycle)
		sprites.walk_right = a8.newAnimation(sprites.g('1-5', 2), sprites.cycle)
		sprites.walk_up = a8.newAnimation(sprites.g('1-5', 3), sprites.cycle)
		sprites.walk_left = a8.newAnimation(sprites.g('1-5', 4),sprites.cycle)

		sprites.idle_down = a8.newAnimation(sprites.g('1-6', 5), sprites.cycle * 2)
		sprites.idle_right = a8.newAnimation(sprites.g('1-6', 6), sprites.cycle * 2)
		sprites.idle_up = a8.newAnimation(sprites.g('1-1', 8), sprites.cycle * 2)
		sprites.idle_left = a8.newAnimation(sprites.g('1-6', 7), sprites.cycle * 2)

		sprites.shadow = a8.newAnimation(sprites.g('6-6', 1), 1)

		sprites.current = sprites.idle_down

function player:update(dt)

	local vec = {x = 0, y = 0}

	--Character controller:

		if love.keyboard.isDown(input.player.walk_down) then
			vec.y = vel

			dir = 'down'
		end

		if love.keyboard.isDown(input.player.walk_up) then
			vec.y = -vel

			dir = 'up'
		end

		if love.keyboard.isDown(input.player.walk_left) then
			vec.x = -vel

			dir = 'left'
		end

		if love.keyboard.isDown(input.player.walk_right) then
			vec.x = vel

			dir = 'right'
		end

		player.ent_hitbox:setLinearVelocity(vec.x, vec.y)

		-- Idle animation menager:

			if vec.x == 0 and vec.y == 0 then

				if dir == 'down' then

					sprites.current = sprites.idle_down

				elseif dir == 'up' then

					sprites.current = sprites.idle_up

				elseif dir == 'left' then

					sprites.current = sprites.idle_left

				elseif dir == 'right' then

					sprites.current = sprites.idle_right

				end
			elseif vec.x > 0 and vec.y > 0 then

			end
	sprites.current:update(dt)

end

function player:draw()

	sprites.shadow:draw(sprites.sheet, player.ent_hitbox:getX(), player.ent_hitbox:getY(), nil, graphics_size, graphics_size, 24, 24)
	sprites.current:draw(sprites.sheet, player.ent_hitbox:getX(), player.ent_hitbox:getY(), nil, graphics_size, graphics_size, 24, 24)

end
