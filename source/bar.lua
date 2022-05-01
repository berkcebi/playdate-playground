local graphics <const> = playdate.graphics
local width <const> = 80
local height <const> = 16

class("Bar", { fraction = 1 }).extends(graphics.sprite)

function Bar.size()
    return width, height
end

function Bar:init()
    Bar.super.init(self)

    local image = graphics.image.new(width, height)
    self:setImage(image)
    self:reloadImage()
end

function Bar:setFraction(fraction)
    self.fraction = fraction
    self:reloadImage()
end

function Bar:reloadImage()
    local image = self:getImage()

    graphics.pushContext(image)
    graphics.clear()
    graphics.fillRect(0, 0, width * self.fraction, height)
    graphics.drawRect(0, 0, width, height)
    graphics.popContext()
end
