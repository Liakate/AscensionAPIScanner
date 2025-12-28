local baseline = AscensionScanner_BlizzardGlobals or {}

local function IsBlizzardGlobal(name)
    return baseline[name] ~= nil
end

local function ScanGlobals()
    local custom = {}

    for name, value in pairs(_G) do
        local t = type(value)

        if t == "function" then
            if not IsBlizzardGlobal(name) then
                custom[name] = "global function"
            end

        elseif t == "table" then
            for k, v in pairs(value) do
                if type(v) == "function" then
                    local full = name .. "." .. k
                    if not IsBlizzardGlobal(name) then
                        custom[full] = "table method"
                    end
                end
            end
        end
    end

    return custom
end

function AscensionAPIScanner_ScanGlobals()
    return ScanGlobals()
end

function AscensionAPIScanner_BuildMetadata()
    local results = AscensionAPIScanner_ScanGlobals()
    local meta = {}

    for name, kind in pairs(results) do
        local namespace = AscensionAPIScanner_InferNamespace(name)
        table.insert(meta, {
            name      = name,
            namespace = namespace,
            kind      = kind,
        })
    end

    table.sort(meta, function(a, b) return a.name < b.name end)
    return meta
end
