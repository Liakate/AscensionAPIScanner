AscensionAPIScanner_UI = AscensionAPIScanner_UI or {}

function AscensionAPIScanner_UI.RenderTab_Events(content, detailText, searchBox, lines)
    local events = AscensionAPIScanner_Events or {}
    local filter = (searchBox:GetText() or ""):lower()
    local y = -5

    for i = #events, 1, -1 do
        local e = events[i]
        if filter == "" or e.event:lower():find(filter, 1, true) then
            local fs = content:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            fs:SetPoint("TOPLEFT", 0, y)
            local argsText = table.concat(e.args, ", ")
            fs:SetText(("|cff66ccff%s|r %s"):format(e.event, argsText))

            fs:SetScript("OnMouseDown", function()
                detailText:SetText(
                    ("Time: %.3f\nEvent: %s\nArgs:\n%s")
                    :format(e.time, e.event, argsText)
                )
            end)

            table.insert(lines, fs)
            y = y - 15
        end
    end

    content:SetHeight(math.abs(y))
end
