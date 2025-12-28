AscensionAPIScanner_Events = AscensionAPIScanner_Events or {}
AscensionAPIScanner_EventArgs = AscensionAPIScanner_EventArgs or {}

local eventFrame = CreateFrame("Frame")
eventFrame:SetScript("OnEvent", function(_, event, ...)
    local args = { ... }

    table.insert(AscensionAPIScanner_Events, {
        time  = GetTime(),
        event = event,
        args  = args,
    })

    AscensionAPIScanner_EventArgs[event] = AscensionAPIScanner_EventArgs[event] or {}
    AscensionAPIScanner_EventArgs[event][#args] = true
end)

eventFrame:RegisterAllEvents()
