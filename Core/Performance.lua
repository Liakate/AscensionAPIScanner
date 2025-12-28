function AscensionAPIScanner_GetPerformance()
    UpdateAddOnMemoryUsage()
    UpdateAddOnCPUUsage()

    local list = {}
    for i = 1, GetNumAddOns() do
        local name = GetAddOnInfo(i)
        local mem = GetAddOnMemoryUsage(i)
        local cpu = GetAddOnCPUUsage(i)
        table.insert(list, {
            name = name,
            mem  = mem,
            cpu  = cpu,
        })
    end

    table.sort(list, function(a, b) return a.mem > b.mem end)
    return list
end
