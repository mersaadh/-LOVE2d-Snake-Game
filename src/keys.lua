local keys = {
    --MOVEMENT
    MOVE_UP = {"w", "up"};
    MOVE_DOWN = {"s", "down"};
    MOVE_RIGHT = {"d", "right"};
    MOVE_LEFT = {"a", "left"};

    --RESTART
    RESTART = "r";
};

function keys:get(map, index)
    if (not index) then index = 1; end
    local key = keys[map];
    if (key) then
        if (type(key) == "string") then
            return key;
        elseif (type(key) == "table") then
            if (index and key[index]) then
                return key[index];
            end
        end
    end
    return false;
end

function keys:verifyKey(keyName, map)
    assert(keyName and type(keyName) == "string");
    assert(map and type(map) == "string");
    local key = keys[map];
    if (key) then
        if (type(key) == "string") then
            return (key == keyName);
        elseif (type(key) == "table") then
            for _, v in pairs(key) do
                if (v == keyName) then return true; end
            end
        end
    end
end

return keys;