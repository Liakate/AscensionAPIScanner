AscensionAPIScanner_Source = AscensionAPIScanner_Source or {}
AscensionAPIScanner_FrameXMLIndex = AscensionAPIScanner_FrameXMLIndex or {}

-- Hook loadstring to capture source chunks (FrameXML and others that pass a chunkname)
local originalLoadString = loadstring

loadstring = function(code, chunk)
    if type(chunk) == "string" and chunk:find("Interface") then
        AscensionAPIScanner_Source[chunk] = code
    end
    return originalLoadString(code, chunk)
end

local function IndexFrameXML()
    local files = {}

    for name, value in pairs(_G) do
        if type(value) == "function" then
            local info = debugstack(value, 1, 1, 0)
            local file = info and info:match("@(Interface[^\n]+)")
            if file then
                files[file] = true
            end
        end
    end

    local list = {}
    for file in pairs(files) do
        table.insert(list, file)
    end
    table.sort(list)
    AscensionAPIScanner_FrameXMLIndex = list
    return list
end

function AscensionAPIScanner_GetFrameXMLFiles()
    return IndexFrameXML()
end

function AscensionAPIScanner_GetSourceForFile(file)
    return AscensionAPIScanner_Source[file]
end
