-- ==========================================================
--   LB Tablet Server Script (Optimized)
-- ==========================================================

local QBCore = exports['qb-core']:GetCoreObject()
local TabletBySource = {}     -- [source] = tabletId
local SourceByTablet = {}     -- [tabletId] = source
local SettingsByTablet = {}   -- [tabletId] = settings

-- =========================
--  EXPORTS
-- =========================
local function GetEquippedTablet(source)
    return TabletBySource[source]
end
exports("GetEquippedTablet", GetEquippedTablet)

local function GetSourceFromTablet(tabletId)
    return SourceByTablet[tabletId]
end
exports("GetSourceFromTablet", GetSourceFromTablet)

local function GetSettings(tabletId)
    return SettingsByTablet[tabletId]
end
exports("GetSettings", GetSettings)

local function SetSettings(tabletId, settings)
    SettingsByTablet[tabletId] = settings
end
exports("SetSettings", SetSettings)

-- =========================
--  SAVE ALL SETTINGS
-- =========================
local function SaveAllSettings()
    if not Config.CacheSettings then return end

    local toSave = {}
    for tabletId, settings in pairs(SettingsByTablet) do
        table.insert(toSave, { json.encode(settings), tabletId })
    end

    if #toSave == 0 then
        debugprint("No settings to save")
        return
    end

    infoprint("info", "Saving all tablet settings")
    for _, entry in ipairs(toSave) do
        MySQL.update.await("UPDATE lbtablet_tablets SET settings = ? WHERE id = ?", entry)
    end
end

-- =========================
--  GET TABLET CALLBACK
-- =========================
RegisterCallback("getTablet", function(source, cb)
    local tabletId = GetEquippedTablet(source)
    local identifier = GetIdentifier(source)

    if not identifier then
        Wait(2000)
        identifier = GetIdentifier(source)
    end

    if tabletId then
        cb({ id = tabletId, settings = GetSettings(tabletId), isSetup = true })
        return
    end

    if not identifier then
        debugprint("getTablet: no identifier found for", source)
        cb(nil)
        return
    end

    local dbTablet = MySQL.single.await("SELECT id, tablet_name, settings, is_setup FROM lbtablet_tablets WHERE id = ?", {identifier})
    if dbTablet then
        TabletBySource[source] = dbTablet.id
        SourceByTablet[dbTablet.id] = source

        local player = Player(source)
        player.state.lbTabletName = dbTablet.tablet_name

        dbTablet.is_setup = dbTablet.is_setup == 1 or dbTablet.is_setup
        if dbTablet.settings then
            SetSettings(dbTablet.id, json.decode(dbTablet.settings))
        end

        TriggerEvent("lb-tablet:jobUpdated", source, GetJob(source).name, IsOnDuty(source))
        cb({ id = dbTablet.id, settings = GetSettings(dbTablet.id), isSetup = dbTablet.is_setup })
        return
    end

    -- Tablet does not exist, create it
    local firstname, lastname = GetCharacterName(source)
    local tabletName = L("BACKEND.MISC.X_TABLET", { firstname = firstname, lastname = lastname })
    MySQL.insert.await("INSERT INTO lbtablet_tablets (id, tablet_name) VALUES (?, ?)", {identifier, tabletName})

    TabletBySource[source] = identifier
    SourceByTablet[identifier] = source

    -- Auto-create email if needed
    if Config.AutoCreateEmail and not GetActiveAccount(identifier, "mail") then
        debugprint("Generating email account for new tablet", identifier)
        GenerateEmailAccount(source, identifier)
    end

    TriggerEvent("lb-tablet:jobUpdated", source, GetJob(source).name, IsOnDuty(source))
    cb({ id = identifier, isSetup = false })
end)

-- =========================
--  TABLET EVENTS
-- =========================
RegisterNetEvent("tablet:toggleOpen", function(state)
    Player(source).state.lbTabletOpen = state == true
end)

RegisterNetEvent("tablet:toggleFlashlight", function(state)
    if Config.SyncFlashlight then
        Player(source).state.lbTabletFlashlight = state == true
    end
end)

RegisterNetEvent("tablet:finishedSetup", function(settings)
    local tabletId = GetEquippedTablet(source)
    if not tabletId or not settings then return end

    SetSettings(tabletId, settings)
    MySQL.update.await("UPDATE lbtablet_tablets SET settings = ?, is_setup = 1 WHERE id = ?", {
        json.encode(settings),
        tabletId
    })
end)

-- =========================
--  CALLBACKS: ADMIN, NAME, SETTINGS
-- =========================
RegisterCallback("isAdmin", function(source, cb)
    cb(IsAdmin(source))
end)

BaseCallback("setName", function(source, tabletId, name)
    if type(name) ~= "string" or #name == 0 or #name > 50 then return false end

    local updated = MySQL.update.await("UPDATE lbtablet_tablets SET tablet_name = ? WHERE id = ?", {name, tabletId}) > 0
    if updated then
        Player(source).state.lbTabletName = name
    end
    return updated
end)

BaseCallback("factoryReset", function(source, tabletId)
    MySQL.update.await("UPDATE lbtablet_tablets SET settings = NULL WHERE id = ?", {tabletId})
    SetSettings(tabletId, nil)
    PlayerLoggedOut(source)
end)

BaseCallback("setSettings", function(source, tabletId, settings)
    SetSettings(tabletId, settings)
    if not Config.CacheSettings then
        MySQL.update.await("UPDATE lbtablet_tablets SET settings = ? WHERE id = ?", {json.encode(settings), tabletId})
    end
    return true
end)

-- =========================
--  DISCONNECT HANDLER
-- =========================
OnTabletDisconnect(function(tabletId, source)
    local settings = GetSettings(tabletId)
    if settings then
        debugprint(("Saving settings for tablet %s %s (%i)"):format(tabletId, GetPlayerName(source), source))
        MySQL.update.await("UPDATE lbtablet_tablets SET settings = ? WHERE id = ?", {json.encode(settings), tabletId})
    end

    debugprint(("Removing cached tablet %s for %s (%i)"):format(tabletId, GetPlayerName(source), source))
    SetSettings(tabletId, nil)
    TabletBySource[source] = nil
    SourceByTablet[tabletId] = nil
end)

-- =========================
--  RESOURCE STOP / SERVER SHUTDOWN
-- =========================
AddEventHandler("onResourceStop", function(resourceName)
    if resourceName == GetCurrentResourceName() then
        SaveAllSettings()
    end
end)

AddEventHandler("txAdmin:events:serverShuttingDown", SaveAllSettings)
