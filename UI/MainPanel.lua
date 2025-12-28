print("MainPanel.lua loaded!")

function AscensionAPIScanner_CreateMainFrame()
    if AscensionAPIScannerFrame then return end

    local frame = CreateFrame("Frame", "AscensionAPIScannerFrame", UIParent, "BasicFrameTemplateWithInset")
    frame:SetSize(800, 600)
    frame:SetPoint("CENTER")
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    frame:Hide()

    AscensionAPIScannerFrame = frame
end

SLASH_ASCENSIONAPISCANNERUI1 = "/ascui"
SlashCmdList["ASCENSIONAPISCANNERUI"] = function()
    print("Slash command triggered")
    AscensionAPIScanner_CreateMainFrame()
    print("Frame created:", AscensionAPIScannerFrame)

    if AscensionAPIScannerFrame:IsShown() then
        print("Frame is shown — hiding")
        AscensionAPIScannerFrame:Hide()
    else
        print("Frame is hidden — showing")
        AscensionAPIScannerFrame:Show()
    end
end
