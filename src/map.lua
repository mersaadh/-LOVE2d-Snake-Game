local Map  = {};
local STI  = require("library.sti");
local Wall = require("src.wall");

Map.GRID_SIZE = 32;
Map.SIZE = Vector(30, 25);
Map.CurrentLevel = false;

function Map:init(ID)
    if not (ID and type(ID) == "number") then
        Log.create("ERROR", "Function: MAP:Init - Bad Argumant @%d, Expected Number, got %s", 1, type(ID));
        return;
    end
    
    self.CurrentLevel = ID;
    self.map = STI("maps/lua/"..tostring(ID)..".lua");
    self.GRID_SIZE = math.max(self.map.tilewidth, self.map.tileheight);
    self.GRID_DIMENSIONS = Vector(self.map.width, self.map.height);
    self.SIZE = Vector(self.map.width * self.GRID_SIZE, self.map.height * self.GRID_SIZE);
    love.window.setMode(Map.SIZE.x, Map.SIZE.y);

    self.wallsLayer = self.map.layers.walls;
    self.walls = {};
    if ( self.wallsLayer ) then 
        self.wallsLayer.visible = false;
        self:spawnWalls(self.wallsLayer.objects);
    end

    Log.create("Map", "Map Changed to %d", ID);
end

function Map:spawnWalls(objects)
    for _, obj in ipairs(objects) do
        local gridX = math.floor(obj.x / self.GRID_SIZE)
        local gridY = math.floor(obj.y / self.GRID_SIZE)
        local tmp = Wall(gridX, gridY)
        table.insert(self.walls, tmp)
    end
    Log.create("Wall-create", "Walls Created: %d", #objects);
end


--RENDER:
function Map:drawGrid()
    love.graphics.setColor(0.8, 0.8, 0.8, 0.5)
    for x = 0, self.SIZE.x, Map.GRID_SIZE do
        love.graphics.line(x, 0, x, self.SIZE.y)
    end
    for y = 0, self.SIZE.y, Map.GRID_SIZE do
        love.graphics.line(0, y, self.SIZE.x, y)
    end
    love.graphics.setColor(1, 1, 1, 1)
end

function Map:draw(debugMode)
    self.map:draw();
    if debugMode then
        self:drawGrid();
    end
end

return Map;