AscensionAPIScanner_Profiler = AscensionAPIScanner_Profiler or {
    enabled = false,
    data = {},
}

local function ProfileWrapper(name, fn)
    return function(...)
        if not AscensionAPIScanner_Profiler.enabled then
            return fn(...)
        end

        local start = GetTime()
        local results = { fn(...) }
        local delta = (GetTime() - start) * 1000 -- ms

        local entry = AscensionAPIScanner_Profiler.data[name] or {
            calls = 0,
            total = 0,
            max   = 0,
        }

        entry.calls = entry.calls + 1
        entry.total = entry.total + delta
        if delta > entry.max then
            entry.max = delta
        end

        AscensionAPIScanner_Profiler.data[name] = entry
        return unpack(results)
    end
end

function AscensionAPIScanner_ProfileFunction(globalName)
    local fn = _G[globalName]
    if type(fn) ~= "function" then
        DEFAULT_CHAT_FRAME:AddMessage("|cffff0000AscensionAPIScanner:|r Not a function: " .. tostring(globalName))
        return false
    end
    _G[globalName] = ProfileWrapper(globalName, fn)
    DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00AscensionAPIScanner:|r Profiling " .. globalName)
    return true
end

function AscensionAPIScanner_ToggleProfiler(enable)
    AscensionAPIScanner_Profiler.enabled = not not enable
    DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00AscensionAPIScanner:|r Profiler " ..
        (AscensionAPIScanner_Profiler.enabled and "ON" or "OFF"))
end
