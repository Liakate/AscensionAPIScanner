AscensionAPIScannerDB = AscensionAPIScannerDB or {}

function AscensionAPIScanner_Save()
    AscensionAPIScannerDB.lastScan = AscensionAPIScanner_GetMetadata()
    AscensionAPIScannerDB.timestamp = date("%Y-%m-%d %H:%M:%S")
    print("|cff00ff00AscensionAPIScanner:|r Exported to SavedVariables.")
end
