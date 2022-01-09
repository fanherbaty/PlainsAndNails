player = {
	collider = wf_world:newCircleCollider(600, 600, 8 * size),
	vel = 200 * size,
	maxHp = 3,
	currentSlot = 0
}

player.hp = player.maxHp

player.collider:setFixedRotation(true)

function player:update(dt)

	--Character Controller

	player.vecX = 0
	player.vecY = 0
	if love.keyboard.isDown(input.player.walkL) then
		player.vecX = -player.vel
		sprite.player.current = sprite.player.walkL
	end

	if love.keyboard.isDown(input.player.walkR) then
		player.vecX = player.vel
		sprite.player.current = sprite.player.walkR
	end

	if love.keyboard.isDown(input.player.walkD) then
		player.vecY = player.vel
		sprite.player.current = sprite.player.walkD
	end

	if love.keyboard.isDown(input.player.walkU) then
		player.vecY = -player.vel
		sprite.player.current = sprite.player.walkU
	end

	if player.vecX == 0 and player.vecY == 0 then
		sprite.player.current = sprite.player.idleD
	end

	player.collider:setLinearVelocity(player.vecX, player.vecY)

	sprite.player.current:update(dt)

end

function player:draw()
	sprite.player.current:draw(sprite.player.sheet, player.collider:getX(), player.collider:getY(), 0, size, size, 16, 20)
end
