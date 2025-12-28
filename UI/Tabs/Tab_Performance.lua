AscensionAPIScanner_UI = AscensionAPIScanner_UI or {}

function AscensionAPIScanner_UI.RenderTab_Performance(content, detailText, searchBox, lines)
    local list = AscensionAPIScanner_GetPerformance()
    local filter = (searchBox:GetText() or ""):lower()
    local y = -5

    for _, entry in ipairs(list) do
        if filter == "" or entry.name:lower():find(filter, 1, true) then
            local fs = content:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            fs:SetPoint("TOPLEFT", 0, y)
            fs:SetText(("|cffffcc00%s|r  Mem: %.1f KB  CPU: %.1f ms")
                :format(entry.name, entry.mem, entry.cpu))
            fs:SetScript("OnMouseDown", function()
                detailText:SetText(
                    ("Addon: %s\nMemory: %.1f KB\nCPU: %.1f ms")
                    :format(entry.name, entry.mem, entry.cpu)
                )
            end)
            table.insert(lines, fs)
            y = y - 15
        end
    end

    content:SetHeight(math.abs(y))
end
