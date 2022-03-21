import "CoreLibs/graphics"

local gfx <const> = playdate.graphics

function playdate.update()
    gfx.drawRect(10, 10, 50, 50)
end
