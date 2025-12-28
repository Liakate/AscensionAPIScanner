AscensionAPIScanner_UI = AscensionAPIScanner_UI or {}

function AscensionAPIScanner_UI.RenderTab_Blizzard(content, detailText, searchBox, lines)
    local filter = (searchBox:GetText() or ""):lower()
    local y = -5

    for name in pairs(AscensionScanner_BlizzardGlobals or {}) do
        if filter == "" or name:lower():find(filter, 1, true) then
            local fs = content:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            fs:SetPoint("TOPLEFT", 0, y)
            fs:SetText("|cff00ff00" .. name .. "|r")
            table.insert(lines, fs)
            y = y - 15
        end
    end

    content:SetHeight(math.abs(y))
    detailText:SetText("Blizzard 3.3.5 baseline functions currently in the scanner.")
end
