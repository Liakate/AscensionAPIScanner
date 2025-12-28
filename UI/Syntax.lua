function AscensionAPIScanner_HighlightLua(code)
    if not code then return "No source captured." end

    -- Comments
    code = code:gsub("(%-%-.-\n)", "|cff7f7f7f%1|r")
    -- Strings
    code = code:gsub("(%b\"\")", "|cffffcc00%1|r")
    code = code:gsub("(%b'')", "|cffffcc00%1|r")
    -- Keywords
    local kwPattern = "(%f[%w_](local|function|end|if|then|else|elseif|for|in|return|while|repeat|until|break)%f[^%w_])"
    code = code:gsub(kwPattern, "|cff00ccff%1|r")

    return code
end
