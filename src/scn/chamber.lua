function love.load()
	require('src/start')
	start()
end
	a = 0
function love.keypressed(key)
	if key == 'e' then
		a = a + 1
	end
end

function love.update(dt)

	ent_hitboxes:update(dt)

	player:update(dt)

		switch(a, {
		  [1] = function()	-- for case 1
				love.graphics.setColor(1, 0, 0)
			end,
			[2] = function()	-- for case 2
				love.graphics.setColor(0, 1, 0)
			end,
			[3] = function()	-- for case 3
				love.graphics.setColor(0, 0, 1)
			end
		})

end

function love.draw()
	love.graphics.setBackgroundColor(0.5,0.5,0.5)

	ent_hitboxes:draw()

	player:draw()
end
