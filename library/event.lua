local Event = {}
Event.events = {}

-- Add an event listener
function Event.listen(eventType, name, func)
	if not Event.events[eventType] then
		Event.events[eventType] = {}
	end
	if type(func) == "function" then
		Event.events[eventType][name] = func
	end
end
-- Call all functions for an event
function Event.call(eventType, ...)
	if Event.events[eventType] then
		for k, v in pairs(Event.events[eventType]) do
			v(...)
		end
	end
end
-- Remove an event listener
function Event.remove(eventType, name)
	Event.events[eventType][name] = nil
end

function Event.clearCache()
	local counter = 0;
	for eventType, t in pairs(Event.events) do
		for name, func in pairs(t) do
			if (type(func) ~= "function") then
				Event.events[eventType][name] = nil;
				counter = counter + 1;
			end
		end
	end
	Log.create("Event", "Event Cache Cleared! Removed Event listeners: %d", counter);
end

return Event;