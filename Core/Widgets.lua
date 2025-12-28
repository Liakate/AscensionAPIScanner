function AscensionAPIScanner_InspectFrame(frame)
    if not frame then
        return "No frame under cursor."
    end

    local name   = frame:GetName() or "<unnamed>"
    local parent = frame:GetParent() and (frame:GetParent():GetName() or "<unnamed>") or "<none>"
    local width, height = frame:GetWidth(), frame:GetHeight()
    local strata = frame:GetFrameStrata() or "UNKNOWN"
    local level  = frame:GetFrameLevel() or 0

    local out = {}
    table.insert(out, ("Name: %s"):format(name))
    table.insert(out, ("Parent: %s"):format(parent))
    table.insert(out, ("Size: %.1f x %.1f"):format(width or 0, height or 0))
    table.insert(out, ("Strata: %s  Level: %d"):format(strata, level))

    local scripts = { "OnShow","OnHide","OnUpdate","OnEvent","OnClick","OnEnter","OnLeave" }
    table.insert(out, "Scripts:")
    for _, s in ipairs(scripts) do
        if frame.HasScript and frame:HasScript(s) then
            table.insert(out, "  - " .. s)
        end
    end

    return table.concat(out, "\n")
end
