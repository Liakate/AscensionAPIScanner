function AscensionAPIScanner_InferNamespace(name)
    -- Table prefix pattern: Namespace.Foo or Namespace.Bar.Baz
    local prefix = name:match("^([%w_]+)")
    if prefix and _G[prefix] then
        return prefix
    end

    -- Try table prefix before first dot
    local tablePrefix = name:match("^([%w_]+)%.")
    if tablePrefix and _G[tablePrefix] then
        return tablePrefix
    end

    return "Global"
end
