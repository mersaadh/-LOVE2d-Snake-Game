local Food        = require("src.food");
local Snake       = require("src.snake");

local inGame = {};

function inGame:init()
    self.gameOver = false;
    self.debugMode = false;
    self.socre = 0;

    Map:init(2);
    self.food = Food();
    self.snake = Snake(5,1);
end

function inGame:restart()
    self.gameOver = false;
    self.socre = 0;
    self.food = nil;
    self.snake = nil;
    self.food = Food();
    self.snake = Snake(5,1);
end

function inGame:update(dt)
    if (self.gameOver) then return end
    self.snake:update(dt, self);
end

function inGame:draw()
    if self.gameOver then
        love.graphics.print("Game Over! Press "..Keys:get("RESTART").." to Restart", Map.SIZE.x / 2 - 70, Map.SIZE.y / 2)
        return
    end
    Map:draw(self.debugMode);
    self.food:draw();
    self.snake:draw();

    love.graphics.print(string.format("SCORE:%d", self.socre), 15, 15);
    love.graphics.print(string.format("SPEED:%.3f", self.snake.speed), 15, 35);
end

function inGame:addScore(count)
    if not (count and type(count) == "number") then
        count = 1;
    end
    self.socre = self.socre + count;
    return true;
end

Event.listen("keypressed", 0x1, function(key, scancode, isrepeat)
    inGame.snake:applyMoving(key);

    if (key == '=') then
        inGame.snake:setSpeed(inGame.snake.speed + 0.01);
    elseif (key == '-') then
        inGame.snake:setSpeed(inGame.snake.speed - 0.01);
    end
    
    if (key == 'space') then
        if (inGame.snake.speed == math.huge) then
            inGame.snake:setSpeed(inGame.snake.tmp);
        else
            inGame.snake.tmp = inGame.snake.speed;
            inGame.snake:setSpeed(math.huge);
        end
    end

    if Keys:verifyKey(key, "RESTART") then
        inGame:restart();
        Log.create("info", tostring(#Map.walls))
    elseif key == "g" then
        inGame.debugMode = not inGame.debugMode
    end
end)

return inGame;