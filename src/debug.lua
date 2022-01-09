debug = {}
debug.isOn = false
function debug:update(dt)

	function debug.on()

		debug.screen = {}

		love.graphics.setColor(0, 0, 0, 0.5)

		love.graphics.rectangle("fill", 0, 0, 100, 50)
		--Main debug info
		love.graphics.setColor(1, 1, 1, 1)

		debug.screen.fps = love.graphics.print("FPS: "..tostring(love.timer.getFPS()),0 ,0)

		debug.screen.playerHp = love.graphics.print("player.hp: "..tostring(player.hp),0 , 10)

		debug.screen.mouseX = love.graphics.print("Mouse X: "..tostring(love.mouse.getX()) , 0, 20)

		debug.screen.mouseY = love.graphics.print("Mouse Y: "..tostring(love.mouse.getY()) , 0, 30)

		love.mouse.setVisible(true)

		local px, py = cam:toCameraCoords(player.collider:getX(), player.collider:getY())
	 	debug.screen.line = love.graphics.line(px, py, love.mouse.getX(), love.mouse.getY())

	end

	function love.keypressed(key)
		if key == input.debugToggle and debug.isOn == false then
			debug.isOn = true
		elseif key == input.debugToggle and debug.isOn == true then
			debug.isOn = false
		end

		if key == '=' and debug.isOn ~= false then
			player.hp = player.hp + 0.5
		elseif key == '-' and debug.isOn ~= false then
			player.hp = player.hp - 0.5
		end
	end

	function debug.off()

		love.mouse.setVisible(false)

		debug.screen = nil
	end

end

function debug:draw()
	if debug.isOn == true then
		debug.on()
	elseif debug.isOn == false then
		debug.off()
	end
end
