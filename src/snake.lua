local Snake = Class {};

function Snake:init(x, y)
    if (not x) then x = 0; end
    if (not y) then y = 0; end

    self.segments = {};
    for i = -2, 0 do
        table.insert(self.segments, Vector(x - i, y));
    end
    self.direction = Vector(1, 0);
    self.length = 3;
    self.speed = 0.1 ; --Har Speed M/S = 1 Block
    self.timer = 0;
    self.canMove = true;
    self.moveBuffer = {};
    return self;
end

function Snake:setSpeed(newSpeed)
    assert(newSpeed and type(newSpeed) == "number");
    self.speed = newSpeed;
    return self;
end

function Snake:calculateScore()
    return math.floor(1 / self.speed);
end

function Snake:checkCollision(game)
    local head = self.segments[1]
    
    for i = 2, #self.segments do
        if head == self.segments[i] then
            game.gameOver = true
            Log.create("BUG", "Barkhord Ba Khodesh");
            return
        end
    end

    for _, wall in ipairs(Map.walls) do
        if head.x == wall.pos.x and head.y == wall.pos.y then
            Log.create("over", "gameOver")
            game.gameOver = true
            Log.create("BUG", "Barkhord Ba Divar");
            return
        end
    end
end

function Snake:applyMoving(key)
    if (self.canMove) then
        if Keys:verifyKey(key, "MOVE_RIGHT") and self.direction ~= Vector(-1, 0) then
            self.direction = Vector(1, 0)
        elseif Keys:verifyKey(key, "MOVE_LEFT") and self.direction ~= Vector(1, 0) then
            self.direction = Vector(-1, 0)
        elseif Keys:verifyKey(key, "MOVE_UP") and self.direction ~= Vector(0, 1) then
            self.direction = Vector(0, -1)
        elseif Keys:verifyKey(key, "MOVE_DOWN") and self.direction ~= Vector(0, -1) then
            self.direction = Vector(0, 1)
        end
        self.canMove = false;
    end
end

function Snake:move(game)
    self.timer = 0;
    self.canMove = true;
    
    local head = self.segments[1] + self.direction;

    head.x = head.x % Map.GRID_DIMENSIONS.x
    head.y = head.y % Map.GRID_DIMENSIONS.y

    table.insert(self.segments, 1, head);

    if head == game.food.pos then
        self.length = self.length + 1;
        game.food:respawn();
        game:addScore(self:calculateScore());
    else
        table.remove(self.segments)
    end
end

function Snake:update(dt, game)
    self.timer = self.timer + dt
    if self.timer >= self.speed then
        self:move(game);
        self:checkCollision(game);
    end
end

function Snake:draw()
    for _, segment in ipairs(self.segments) do
        love.graphics.rectangle("fill", segment.x * Map.GRID_SIZE, segment.y * Map.GRID_SIZE, Map.GRID_SIZE, Map.GRID_SIZE)
    end
end

return Snake;