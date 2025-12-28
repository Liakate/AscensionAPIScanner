AscensionAPIScanner_UI = AscensionAPIScanner_UI or {}

function AscensionAPIScanner_UI.RenderTab_API(content, detailText, searchBox, lines)
    local meta = AscensionAPIScanner_BuildMetadata()
    local colors = AscensionAPIScanner_Colors or {}
    local filter = (searchBox:GetText() or ""):lower()

    local y = -5
    for _, entry in ipairs(meta) do
        if filter == "" or entry.name:lower():find(filter, 1, true) then
            local fs = content:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            fs:SetPoint("TOPLEFT", 0, y)

            local c = colors[entry.namespace] or "|cffffffff"
            fs:SetText(("%s%s|r (%s)"):format(c, entry.name, entry.kind))

            fs:SetScript("OnMouseDown", function()
                detailText:SetText(
                    ("|cffffff00Name:|r %s\n|cffffff00Namespace:|r %s\n|cffffff00Kind:|r %s")
                    :format(entry.name, entry.namespace, entry.kind)
                )
            end)

            table.insert(lines, fs)
            y = y - 15
        end
    end

    content:SetHeight(math.abs(y))
end
