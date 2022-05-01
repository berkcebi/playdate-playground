import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "bar"

local graphics <const> = playdate.graphics
local margin <const> = 8

local bar = nil

local function initialize()
    local bar_width, bar_height = Bar.size()

    bar = Bar()
    bar:moveTo(margin + bar_width / 2, margin + bar_height / 2)
    bar:add()
end

initialize()

function playdate.update()
    if playdate.buttonJustPressed(playdate.kButtonA) then
        math.randomseed(playdate.getSecondsSinceEpoch())
        local fraction = math.random()
        bar:setFraction(fraction)
    end

    graphics.sprite.update()
end
