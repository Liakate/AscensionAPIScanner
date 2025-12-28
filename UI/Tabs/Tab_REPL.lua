AscensionAPIScanner_UI = AscensionAPIScanner_UI or {}

function AscensionAPIScanner_UI.RenderTab_REPL(content, detailText, searchBox, lines)
    local history = AscensionAPIScanner_REPLHistory or {}
    local y = -5

    for i = #history, 1, -1 do
        local entry = history[i]
        local fs = content:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        fs:SetPoint("TOPLEFT", 0, y)
        fs:SetText(("> %s\n= %s"):format(entry.code, entry.result))
        table.insert(lines, fs)
        y = y - 30
    end

    content:SetHeight(math.abs(y))

    -- REPL input is handled in MainPanel; we just show history here.
    if not AscensionAPIScanner_UI.replInputCreated then
        AscensionAPIScanner_UI.replInputCreated = true
        local frame = AscensionAPIScannerFrame
        if frame then
            local replInput = CreateFrame("EditBox", nil, frame, "InputBoxTemplate")
            replInput:SetSize(360, 20)
            replInput:SetPoint("BOTTOMLEFT", 20, 40)
            replInput:SetAutoFocus(false)
            replInput:SetScript("OnEnterPressed", function(self)
                local text = self:GetText()
                if text and text ~= "" then
                    local ok, res = AscensionAPIScanner_Eval(text)
                    if ok then
                        detailText:SetText("Result:\n" .. tostring(res))
                    else
                        detailText:SetText("|cffff4444Error:|r " .. tostring(res))
                    end
                end
                self:SetText("")
            end)
        end
    end
end
