AscensionAPIScanner_UI = AscensionAPIScanner_UI or {}

function AscensionAPIScanner_UI.RenderTab_Profiler(content, detailText, searchBox, lines)
    local data = AscensionAPIScanner_Profiler.data or {}
    local filter = (searchBox:GetText() or ""):lower()
    local y = -5

    for name, info in pairs(data) do
        if filter == "" or name:lower():find(filter, 1, true) then
            local avg = info.calls > 0 and (info.total / info.calls) or 0
            local fs = content:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            fs:SetPoint("TOPLEFT", 0, y)
            fs:SetText(("|cffffcc00%s|r calls: %d  avg: %.2f ms  max: %.2f ms")
                :format(name, info.calls, avg, info.max))
            fs:SetScript("OnMouseDown", function()
                detailText:SetText(
                    ("Function: %s\nCalls: %d\nTotal: %.2f ms\nAvg: %.2f ms\nMax: %.2f ms")
                    :format(name, info.calls, info.total, avg, info.max)
                )
            end)
            table.insert(lines, fs)
            y = y - 15
        end
    end

    content:SetHeight(math.abs(y))
end
