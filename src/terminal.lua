local log = {};

function log.create(logType, text, ...)
    assert(text and type(text) == "string");
    logType = logType or "Unknown";
    print("("..logType.."-LOG): "..string.format(text, ...));
end

return log;