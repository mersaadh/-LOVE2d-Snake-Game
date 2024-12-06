local Wall = Class {}

function Wall:init(gridX, gridY)
    self.pos = Vector(gridX, gridY)
end

return Wall