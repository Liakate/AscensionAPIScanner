AscensionAPIScanner_UI = AscensionAPIScanner_UI or {}

function AscensionAPIScanner_UI.RenderTab_Hooks(content, detailText, searchBox, lines)
    local hooks = AscensionAPIScanner_DetectHooks()
    local filter = (searchBox:GetText() or ""):lower()
    local y = -5

    for name in pairs(hooks) do
        if filter == "" or name:lower():find(filter, 1, true) then
            local fs = content:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            fs:SetPoint("TOPLEFT", 0, y)
            fs:SetText("|cffff4444Hooked:|r " .. name)
            fs:SetScript("OnMouseDown", function()
                detailText:SetText("Blizzard function has been overridden:\n" .. name)
            end)
            table.insert(lines, fs)
            y = y - 15
        end
    end

    content:SetHeight(math.abs(y))
end
