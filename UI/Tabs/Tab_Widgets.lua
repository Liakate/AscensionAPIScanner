AscensionAPIScanner_UI = AscensionAPIScanner_UI or {}

function AscensionAPIScanner_UI.RenderTab_Widgets(content, detailText, searchBox, lines)
    local fs = content:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    fs:SetPoint("TOPLEFT", 0, -5)
    fs:SetText("Use the 'Inspect' button at the bottom-right of the main window,\n" ..
               "then click any UI element to inspect its properties here.")
    table.insert(lines, fs)

    content:SetHeight(40)
    if not detailText:GetText() or detailText:GetText() == "" then
        detailText:SetText("When inspect mode is ON, clicking a frame will display its info here.")
    end
end
