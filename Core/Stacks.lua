AscensionAPIScanner_Stacks = AscensionAPIScanner_Stacks or {}

function AscensionAPIScanner_CaptureStack(label)
    local trace = debugstack(2, 20, 20)
    table.insert(AscensionAPIScanner_Stacks, {
        time  = date("%H:%M:%S"),
        label = label or "Manual",
        trace = trace,
    })
end

-- Optional error handler hook
local origHandler = geterrorhandler()

seterrorhandler(function(msg)
    AscensionAPIScanner_CaptureStack("Error: " .. tostring(msg))
    return origHandler(msg)
end)
