player = {
	collider = wf_world:newBSGRectangleCollider(100, 100, 19 * size, 41 * size, size),
	vel = 200 * size,
	maxHp = 3,
	hp = nil,
	vectorX = nil,
	vectorY = nil,
	currentSlot = 0
}

player.hp = player.maxHp

player.collider:setFixedRotation(true)

function player:update(dt)

	--Character Controller

	player.vectorX = 0
	player.vectorY = 0

	if love.keyboard.isDown(input.walkL) then
		player.vectorX = -1
		sprite.player.current = sprite.player.walkL
	end

	if love.keyboard.isDown(input.walkR) then
		player.vectorX = 1
		sprite.player.current = sprite.player.walkR
	end

	if love.keyboard.isDown(input.walkD) then
		player.vectorY = 1
		sprite.player.current = sprite.player.walkD
	end

	if love.keyboard.isDown(input.walkU) then
		player.vectorY = -1
		sprite.player.current = sprite.player.walkU
	end

	if player.vectorX == 0 and player.vectorY == 0 then
		sprite.player.current:gotoFrame(1)
	end

	player.collider:setLinearVelocity(player.vectorX * player.vel, player.vectorY * player.vel)

	sprite.player.current:update(dt)

end