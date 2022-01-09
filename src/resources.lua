-- Sprites
sprite = {}
-- Player related sprites
sprite.player = {}
sprite.player.sheet = love.graphics.newImage('/as/img/player/lucio/sheet.png')
sprite.player.sheetGrid = anim8.newGrid(32, 40, sprite.player.sheet:getWidth(), sprite.player.sheet:getHeight())
sprite.player.animCycle = 0.05
--Walk Animations
sprite.player.walkL = anim8.newAnimation(sprite.player.sheetGrid('1-12', 1), sprite.player.animCycle)
sprite.player.walkR = anim8.newAnimation(sprite.player.sheetGrid('1-12', 2), sprite.player.animCycle)
sprite.player.walkU = anim8.newAnimation(sprite.player.sheetGrid('1-7', 3), sprite.player.animCycle * 2)
sprite.player.walkD = anim8.newAnimation(sprite.player.sheetGrid('1-7', 4), sprite.player.animCycle * 2)
--Idle Animations
sprite.player.idleL = anim8.newAnimation(sprite.player.sheetGrid('1-7', 5), sprite.player.animCycle)
sprite.player.idleR = anim8.newAnimation(sprite.player.sheetGrid('1-7', 6), sprite.player.animCycle)
sprite.player.idleU = anim8.newAnimation(sprite.player.sheetGrid('1-7', 7), sprite.player.animCycle)
sprite.player.idleD = anim8.newAnimation(sprite.player.sheetGrid('1-7', 8), sprite.player.animCycle * 2.5)
--Other Things
sprite.player.shadow = anim8.newAnimation(sprite.player.sheetGrid('12-12', 4), sprite.player.animCycle)
--====--
sprite.player.current = sprite.player.walkR
-- HUDs and GUIs
sprite.gui = {}
sprite.gui.logo = love.graphics.newImage('as/img/gui/logo.png')
-- Hearts
sprite.hud = {}
sprite.hud.health = {}
sprite.hud.health.spriteSheet = love.graphics.newImage('/as/img/hud/health.png')
sprite.hud.health.grid = anim8.newGrid(16, 16, sprite.hud.health.spriteSheet:getWidth(), sprite.hud.health.spriteSheet:getHeight())
sprite.hud.health.full = anim8.newAnimation(sprite.hud.health.grid('1-1', 1), 1)
sprite.hud.health.half = anim8.newAnimation(sprite.hud.health.grid('1-1', 2), 1)
sprite.hud.health.empty = anim8.newAnimation(sprite.hud.health.grid('1-1', 3), 1)
sprite.hud.health.current = sprite.hud.health.full
-- Slots
sprite.hud.slots = {}
sprite.hud.slots.spriteSheet = love.graphics.newImage('as/img/hud/slotSheet.png')
sprite.hud.slots.grid = anim8.newGrid(24, 24, sprite.hud.slots.spriteSheet:getWidth(), sprite.hud.slots.spriteSheet:getHeight())
sprite.hud.slots.slot = anim8.newAnimation(sprite.hud.slots.grid('1-1', 1), 1)
sprite.hud.slots.selected = anim8.newAnimation(sprite.hud.slots.grid('1-1', 2), 1)
sprite.hud.slots.current = sprite.hud.slots.slot
-- Cursors
sprite.cursor = {}
sprite.cursor.main = love.graphics.newImage('/as/img/gui/cursor_main.png')
function drawCursor()

    love.graphics.setColor(0, 0, 0, 0.5)
    love.graphics.draw(sprite.cursor.main, love.mouse.getX() + size, love.mouse.getY() + size, 0, size, size)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(sprite.cursor.main, love.mouse.getX(), love.mouse.getY(), 0, size, size)
end
-- Entities
sprite.entity = {}
sprite.entity.default = love.graphics.newImage('as/img/entities/the_fan_of_the_tea.png')
-- Maps

map = {}
map.descSheet = love.graphics.newImage('as/maps/desc.png')
map.descGrid = anim8.newGrid(96, 16, map.descSheet:getWidth(), map.descSheet:getHeight())
map.descPlains = anim8.newAnimation(map.descGrid('1-1', 1), 1)
map.desc = map.descPlains
map.world1 = sti('/as/maps/world1/world1.lua', {"box2d"})
map.world1_iconL1 = love.graphics.newImage('/as/maps/world1/icon_l1.png')
map.world1_iconL2 = love.graphics.newImage('/as/maps/world1/icon_l2.png')
map.world1_iconL3 = love.graphics.newImage('/as/maps/world1/icon_l3.png')
map.world1.solids = {}
map.current = map.world1
if map.current.layers['solid'] then
    for i, obj in pairs(map.current.layers['solid'].objects) do
        local solids = wf_world:newRectangleCollider(obj.x * size, obj.y * size, obj.width * size, obj.height * size)
        solids:setType('static')
        table.insert(map.current.solids, solids)
    end
end

-- Sounds
snd = {}
-- Models
models = {}
sprite.models = {}
sprite.models.synthground = love.graphics.newImage('as/maps/synthground.png')
sprite.models.bg = love.graphics.newImage('as/maps/bg.png')
models.plane = g3d.newModel('as/maps/plane.obj', sprite.models.synthground, {-2.5, 0, -3.5}, {0, 0, 0}, {20, 20, 1})
-- Fonts
fonts = {}
fonts.debug_01 = love.graphics.newFont('/as/fonts/basis33_debug.ttf', 16)
