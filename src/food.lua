local Food = Class {};

function Food:init(x, y)
    self.pos = Vector(0, 0);
    if (x and y) then
        self.pos = Vector(x, y);
    else
        self:respawn();
    end
end

function Food:respawn()
    local isValidPosition = false

    while not isValidPosition do
        local newX = math.random(0, Map.GRID_DIMENSIONS.x - 1)
        local newY = math.random(0, Map.GRID_DIMENSIONS.y - 1)
        self.pos = Vector(newX, newY)

        isValidPosition = true

        if #Map.walls > 0 then
            for _, wall in ipairs(Map.walls) do
                if self.pos.x == wall.pos.x and self.pos.y == wall.pos.y then
                    isValidPosition = false
                    break
                end
            end
        end
    end
end

function Food:draw()
    love.graphics.setColor(1,0,0);
    love.graphics.rectangle("fill", self.pos.x * Map.GRID_SIZE, self.pos.y * Map.GRID_SIZE, Map.GRID_SIZE, Map.GRID_SIZE)
    love.graphics.setColor(1,1,1);
end

return Food;