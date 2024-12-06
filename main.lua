-- --[[
-- /------------------------[ CLASSIC SNAKE PROJECT ]-----------------------\-\
-- |                                                                        |-|
-- |                   _.x-o=.|=-._[ By MERS4D ]_.-=|.=o-x._                |-|
-- |                                                                        |-|
-- |                          FILE-NAME = main.lua                          |-|
-- |            LICENSE = See LICENSE in the top level directory            |-|
-- |                                                                        |-|
-- \------------------------------------------------------------------------/-/
-- ]]
              require("library.vector");
Log         = require("src.terminal");
Event       = require("library.event");
Class       = require("library.class");
Keys        = require("src.keys");
GameState   = require("library.gamestate");
Map         = require("src.map");

local inGame = require("src.pages.inGame");

--LOVE DEFAULT FUNCTIONS
function love.load()
    Event.call("load");
    love._openConsole();

    math.randomseed(os.time())
    GameState.registerEvents();
    GameState.switch(inGame);
end

function love.update(dt)
    Event.call("update", dt);
end

function love.draw()
    Event.call("draw");
end

function love.mousereleased(x, y, button, istouch, presses)
    Event.call("mousereleased", x, y, button, istouch, presses);
end

function love.keypressed(key, scancode, isrepeat)
    Event.call("keypressed", key, scancode, isrepeat);
end