AscensionAPIScanner_Hooks = AscensionAPIScanner_Hooks or {}

local function SnapshotBlizzard()
    local snap = {}
    for name in pairs(AscensionScanner_BlizzardGlobals) do
        if type(_G[name]) == "function" then
            snap[name] = _G[name]
        end
    end
    return snap
end

local originalSnapshot = SnapshotBlizzard()

function AscensionAPIScanner_DetectHooks()
    local hooks = {}
    for name, orig in pairs(originalSnapshot) do
        local now = _G[name]
        if type(now) == "function" and now ~= orig then
            hooks[name] = true
        end
    end
    AscensionAPIScanner_Hooks = hooks
    return hooks
end
