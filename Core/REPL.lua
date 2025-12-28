AscensionAPIScanner_REPLHistory = AscensionAPIScanner_REPLHistory or {}

function AscensionAPIScanner_Eval(expr)
    local chunk, err = loadstring("return " .. expr)
    if not chunk then
        chunk, err = loadstring(expr)
    end
    if not chunk then
        return false, err
    end

    local ok, result = pcall(chunk)
    if not ok then
        return false, result
    end

    local entry = { code = expr, result = tostring(result) }
    table.insert(AscensionAPIScanner_REPLHistory, entry)
    return true, result
end
