AscensionAPIScanner_UI = AscensionAPIScanner_UI or {}

function AscensionAPIScanner_UI.RenderTab_Stacks(content, detailText, searchBox, lines)
    local stacks = AscensionAPIScanner_Stacks or {}
    local filter = (searchBox:GetText() or ""):lower()
    local y = -5

    for i = #stacks, 1, -1 do
        local s = stacks[i]
        local label = s.label or ""
        if filter == "" or label:lower():find(filter, 1, true) then
            local fs = content:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            fs:SetPoint("TOPLEFT", 0, y)
            fs:SetText(("|cffff6666[%s]|r %s"):format(s.time or "??", label))
            fs:SetScript("OnMouseDown", function()
                detailText:SetText(s.trace or "")
            end)
            table.insert(lines, fs)
            y = y - 15
        end
    end

    content:SetHeight(math.abs(y))
end
