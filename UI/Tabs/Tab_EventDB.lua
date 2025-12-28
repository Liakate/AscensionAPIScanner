AscensionAPIScanner_UI = AscensionAPIScanner_UI or {}

function AscensionAPIScanner_UI.RenderTab_EventDB(content, detailText, searchBox, lines)
    local db = AscensionAPIScanner_EventArgs or {}
    local filter = (searchBox:GetText() or ""):lower()
    local y = -5

    for event, sig in pairs(db) do
        if filter == "" or event:lower():find(filter, 1, true) then
            local counts = {}
            for n in pairs(sig) do
                table.insert(counts, n)
            end
            table.sort(counts)

            local fs = content:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            fs:SetPoint("TOPLEFT", 0, y)
            fs:SetText(("|cff66ccff%s|r Args: %s"):format(
                event,
                table.concat(counts, ", ")
            ))

            fs:SetScript("OnMouseDown", function()
                detailText:SetText(
                    ("Event: %s\nObserved argument counts: %s")
                    :format(event, table.concat(counts, ", "))
                )
            end)

            table.insert(lines, fs)
            y = y - 15
        end
    end

    content:SetHeight(math.abs(y))
end
