function AscensionAPIScanner_GetNamespaceTree()
    local tree = {}

    for name, value in pairs(_G) do
        if type(name) == "string" and type(value) == "table" then
            local list = {}
            for k, v in pairs(value) do
                if type(v) == "function" and type(k) == "string" then
                    table.insert(list, k)
                end
            end
            if #list > 0 then
                table.sort(list)
                tree[name] = list
            end
        end
    end

    return tree
end
