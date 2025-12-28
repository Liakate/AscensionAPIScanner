AscensionScanner_BlizzardGlobals = {

    -- Core Lua
    ["assert"]=true, ["collectgarbage"]=true, ["dofile"]=true,
    ["error"]=true, ["getfenv"]=true, ["getmetatable"]=true,
    ["ipairs"]=true, ["loadfile"]=true, ["loadstring"]=true,
    ["next"]=true, ["pairs"]=true, ["pcall"]=true, ["print"]=true,
    ["rawequal"]=true, ["rawget"]=true, ["rawset"]=true,
    ["select"]=true, ["setfenv"]=true, ["setmetatable"]=true,
    ["tonumber"]=true, ["tostring"]=true, ["type"]=true,
    ["unpack"]=true, ["xpcall"]=true,

    -- Frame/UI core
    ["CreateFrame"]=true, ["CreateFont"]=true, ["CreateTexture"]=true,
    ["CreateAnimationGroup"]=true, ["CreateAnimation"]=true,

    -- Unit
    ["UnitName"]=true, ["UnitClass"]=true, ["UnitRace"]=true,
    ["UnitGUID"]=true, ["UnitHealth"]=true, ["UnitHealthMax"]=true,
    ["UnitPower"]=true, ["UnitPowerMax"]=true, ["UnitLevel"]=true,
    ["UnitExists"]=true, ["UnitIsPlayer"]=true, ["UnitIsUnit"]=true,
    ["UnitIsDead"]=true, ["UnitIsEnemy"]=true, ["UnitIsFriend"]=true,
    ["UnitBuff"]=true, ["UnitDebuff"]=true,

    -- Spells
    ["GetSpellInfo"]=true, ["GetSpellCooldown"]=true,
    ["GetSpellLink"]=true, ["IsSpellKnown"]=true,
    ["CastSpell"]=true, ["CastSpellByName"]=true,

    -- Items
    ["GetItemInfo"]=true, ["GetItemCount"]=true,
    ["GetItemCooldown"]=true, ["GetItemIcon"]=true,

    -- Bags
    ["GetContainerItemInfo"]=true, ["GetContainerNumSlots"]=true,
    ["PickupContainerItem"]=true, ["UseContainerItem"]=true,

    -- Combat
    ["CombatLogGetCurrentEventInfo"]=true,
    ["IsUsableSpell"]=true, ["IsUsableItem"]=true,

    -- Action bar
    ["GetActionInfo"]=true, ["GetActionCooldown"]=true,
    ["IsActionInRange"]=true, ["IsActionUsable"]=true,

    -- Tooltip
    ["GameTooltip"]=true, ["GameTooltip_SetDefaultAnchor"]=true,

    -- CVars
    ["GetCVar"]=true, ["SetCVar"]=true, ["GetCVarBool"]=true,

    -- Time
    ["GetTime"]=true, ["date"]=true, ["time"]=true,

    -- Zone / map
    ["GetZoneText"]=true, ["GetRealZoneText"]=true,
    ["GetMinimapZoneText"]=true,

    -- Group
    ["GetNumPartyMembers"]=true, ["GetNumRaidMembers"]=true,
    ["GetRaidRosterInfo"]=true,

    -- Chat
    ["SendChatMessage"]=true,
    ["ChatFrame_AddMessageEventFilter"]=true,
    ["ChatFrame_RemoveMessageEventFilter"]=true,

    -- AddOn API
    ["GetAddOnMetadata"]=true, ["GetAddOnInfo"]=true,
    ["IsAddOnLoaded"]=true, ["LoadAddOn"]=true,

    -- Secure
    ["InCombatLockdown"]=true, ["SecureCmdOptionParse"]=true,

    -- Misc
    ["GetBuildInfo"]=true, ["GetRealmName"]=true,
    ["GetPlayerInfoByGUID"]=true, ["GetCursorInfo"]=true,
    ["ReloadUI"]=true, ["PlaySound"]=true,
}
