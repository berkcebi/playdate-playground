local graphics <const> = playdate.graphics
local width <const> = 80
local height <const> = 16
local font <const> = graphics.font.new("assets/Bitmore")
font:setTracking(1)

class("Bar", { fraction = 1, title = "" }).extends(graphics.sprite)

function Bar.size()
    return width, height
end

function Bar:init()
    Bar.super.init(self)

    local image = graphics.image.new(width, height)
    self:setImage(image)
    self:reloadImage()
end

function Bar:set(fraction, title)
    self.fraction = fraction
    self.title = title
    self:reloadImage()
end

function Bar:reloadImage()
    local image = self:getImage()

    graphics.pushContext(image)
    graphics.clear()

    graphics.drawRect(0, 0, width, height)

    graphics.setFont(font)

    local title = self.title
    local textWidth, textHeight = graphics.getTextSize(title)
    local textX = math.ceil((width - textWidth) / 2)
    local textY = math.ceil((height - textHeight) / 2) + 1

    graphics.drawText(title, textX, textY)

    graphics.setClipRect(0, 0, width * self.fraction, height)

    graphics.fillRect(0, 0, width, height)

    graphics.setImageDrawMode(graphics.kDrawModeInverted)
    graphics.drawText(title, textX, textY)
    graphics.setImageDrawMode(graphics.kDrawModeCopy)

    graphics.clearClipRect()

    graphics.popContext()
end
