AscensionAPIScanner_UI = AscensionAPIScanner_UI or {}

function AscensionAPIScanner_UI.RenderTab_FrameXML(content, detailText, searchBox, lines)
    local files = AscensionAPIScanner_GetFrameXMLFiles()
    local filter = (searchBox:GetText() or ""):lower()
    local y = -5

    for _, file in ipairs(files) do
        if filter == "" or file:lower():find(filter, 1, true) then
            local fs = content:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            fs:SetPoint("TOPLEFT", 0, y)
            fs:SetText("|cffffcc00" .. file .. "|r")

            fs:SetScript("OnMouseDown", function()
                local src = AscensionAPIScanner_GetSourceForFile(file)
                src = AscensionAPIScanner_HighlightLua(src)
                detailText:SetText(src)
            end)

            table.insert(lines, fs)
            y = y - 15
        end
    end

    content:SetHeight(math.abs(y))
end
