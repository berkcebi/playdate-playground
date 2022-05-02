import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "adventurer"
import "bar"

local graphics <const> = playdate.graphics
local margin <const> = 8

local adventurer = nil
local healthBar = nil

local function reloadHealthBar()
    local fraction = adventurer.health / adventurer.maxHealth
    local title = math.ceil(adventurer.health) .. " / 100"
    healthBar:set(fraction, title)
end

local function initialize()
    adventurer = Adventurer()

    healthBar = Bar()
    local barWidth, barHeight = Bar.size()
    healthBar:moveTo(margin + barWidth / 2, margin + barHeight / 2)
    healthBar:add()

    reloadHealthBar()
end

initialize()

function playdate.update()
    if playdate.buttonJustPressed(playdate.kButtonA) then
        math.randomseed(playdate.getSecondsSinceEpoch())
        local health = math.random() * 100
        adventurer:setHealth(health)

        reloadHealthBar()
    end

    graphics.sprite.update()
end
