class("Adventurer", { health = 100, maxHealth = 100 }).extends()

function Adventurer:setHealth(health)
    self.health = math.min(health, self.maxHealth)
end
