hud = {}

function hud:draw()
	--Hearts:
		for i=1, player.maxHp do
			local width = sprite.hud.health.spriteSheet:getWidth()
			local offsetX = (i-1) * (width * size)
			local offsetY = (math.sin(love.timer.getTime() * 3 - i) * (2 * size)) --Cool bouncing heart effect using a sine wave

			if i - player.hp <= player.hp - i then
				sprite.hud.health.current = sprite.hud.health.full
			elseif i - player.hp <= i then
				sprite.hud.health.current = sprite.hud.health.empty
			end

			if player.hp - i == -0.5 then
				sprite.hud.health.current = sprite.hud.health.half
			end

			love.graphics.setColor(0, 0, 0, 0.5)
				sprite.hud.health.current:draw(sprite.hud.health.spriteSheet, 4 * size + offsetX , 131 * size + offsetY, 0 ,size)
			love.graphics.setColor(1, 1, 1, 1)
				sprite.hud.health.current:draw(sprite.hud.health.spriteSheet, 3 * size + offsetX , 130 * size + offsetY, 0 ,size)
		end

	--Slots:
		local slots = {
			amount = 3
		}
		for i=1, slots.amount do
			local width = sprite.hud.slots.spriteSheet:getWidth()
			local offsetX = (i-1) * (width * size)

			love.graphics.setColor(0, 0, 0, 0.5)
				sprite.hud.slots.current:draw(sprite.hud.slots.spriteSheet, 4 * size + offsetX , 151 * size, 0, size)
			love.graphics.setColor(1, 1, 1, 1)
				sprite.hud.slots.current:draw(sprite.hud.slots.spriteSheet, 3 * size + offsetX , 150 * size, 0 , size)
		end
end

function hud:update(dt)
	sprite.hud.health.current:update(dt)
	sprite.hud.slots.current:update(dt)
end
