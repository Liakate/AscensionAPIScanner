AscensionAPIScanner_UI = AscensionAPIScanner_UI or {}

function AscensionAPIScanner_UI.RenderTab_Tree(content, detailText, searchBox, lines)
    local tree = AscensionAPIScanner_GetNamespaceTree()
    local filter = (searchBox:GetText() or ""):lower()
    local y = -5

    for ns, funcs in pairs(tree) do
        if filter == "" or ns:lower():find(filter, 1, true) then
            local header = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            header:SetPoint("TOPLEFT", 0, y)
            header:SetText("|cff00ffcc" .. ns .. "|r")
            table.insert(lines, header)
            y = y - 20

            for _, fn in ipairs(funcs) do
                local fs = content:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
                fs:SetPoint("TOPLEFT", 20, y)
                fs:SetText("- " .. fn)
                fs:SetScript("OnMouseDown", function()
                    detailText:SetText(("Namespace: %s\nFunction: %s.%s"):format(ns, ns, fn))
                end)
                table.insert(lines, fs)
                y = y - 15
            end

            y = y - 10
        end
    end

    content:SetHeight(math.abs(y))
end
