local DisableControlAction = DisableControlAction
local DisablePlayerFiring = DisablePlayerFiring
local isInputDisabled = false
local cursorX = 0
local cursorY = 0
local disableControlsInterval = nil
local inputControlsInterval = nil
local timeUpdateInterval = nil
local tabletDataLoaded = nil
local playerId = nil


LoadedNUI = true
TabletOpen = true
TabletId = nil
TabletSettings = nil
TabletDisabled = false


function DisableTabletControls()
    DisableControlAction(0, 24, true)  -- Attack
    DisableControlAction(0, 25, true)  -- Aim
    DisableControlAction(0, 68, true)  -- Vehicle Aim
    DisableControlAction(0, 69, true)  -- Vehicle Attack
    DisableControlAction(0, 70, true)  -- Vehicle Attack 2
    DisableControlAction(0, 91, true)  -- Vehicle Passenger Aim
    DisableControlAction(0, 92, true)  -- Vehicle Passenger Attack
    DisableControlAction(0, 106, true) -- Vehicle Mouse Control Override
    DisableControlAction(0, 114, true) -- Vehicle Fly Mouse Control Override
    DisableControlAction(0, 140, true) -- Melee Attack Light
    DisableControlAction(0, 141, true) -- Melee Attack Heavy
    DisableControlAction(0, 142, true) -- Melee Attack Alternate
    DisableControlAction(0, 257, true) -- Attack 2
    DisableControlAction(0, 263, true) -- Melee Attack 1
    DisableControlAction(0, 264, true) -- Melee Attack 2
    DisableControlAction(0, 330, true) -- Move Left Right
    DisableControlAction(0, 331, true) -- Move Up Down
    DisablePlayerFiring(playerId, true)
    DisableControlAction(0, 199, true) -- Pause Menu
    DisableControlAction(0, 200, true) -- Pause Menu
end


function DisableInputControls()
    DisableControlAction(0, 1, true)   -- Look Left Right
    DisableControlAction(0, 2, true)   -- Look Up Down
    DisableControlAction(0, 245, true) -- Chat
    DisableControlAction(0, 14, true)  -- Weapon Wheel Up Down
    DisableControlAction(0, 15, true)  -- Weapon Wheel Left Right
    DisableControlAction(0, 16, true)  -- Weapon Wheel Next
    DisableControlAction(0, 17, true)  -- Weapon Wheel Prev
    DisableControlAction(0, 37, true)  -- Select Weapon
    DisableControlAction(0, 50, true)  -- Accurate Aim
    DisableControlAction(0, 99, true)  -- Select Next Weapon
    DisableControlAction(0, 115, true) -- Stand By
    DisableControlAction(0, 180, true) -- Melee Attack Light
    DisableControlAction(0, 181, true) -- Melee Attack Heavy
    DisableControlAction(0, 198, true) -- Pause Menu
    DisableControlAction(0, 241, true) -- Scroll Up
    DisableControlAction(0, 242, true) -- Scroll Down
    DisableControlAction(0, 261, true) -- Input 1
    DisableControlAction(0, 262, true) -- Input 2
    DisableControlAction(0, 85, true)  -- Radio Wheel
end


function LoadConfigFile(fileName)
    local fileContent = LoadResourceFile(GetCurrentResourceName(), "config/" .. fileName .. ".json")
    local configData = {}

    if not fileContent then
        infoprint("error", "config/" .. fileName .. ".json file not found, did you delete it? Try reinstalling the resource.")
    else
        local decodedData = json.decode(fileContent)
        configData = decodedData
        if not configData then
            infoprint("error", "config/" .. fileName .. ".json file has an error. Try reinstalling the resource.")
        end
    end

    return configData or {}
end

local pttPressed = false


function ToggleFocus()
    if TabletOpen then
        if Config.KeepInput then
            if not pttPressed then
                return
            end
        end
    else
        return
    end

    local shouldDisableFocus = false
    if Config.DisableFocusTalking then
        shouldDisableFocus = IsDisabledControlPressed(0, 249)
    else
        shouldDisableFocus = IsDisabledControlJustReleased(0, 249)
    end

    if shouldDisableFocus then
        debugprint("PTT is pressed, waiting before toggling focus")
        pttPressed = true
        while IsDisabledControlPressed(0, 249) or IsDisabledControlJustReleased(0, 249) do
            Wait(0)
        end
        pttPressed = false
    end

    local isFocused = IsNuiFocused()
    local newFocusState = not isFocused
    SetNuiFocus(newFocusState, newFocusState)
    SetNuiFocusKeepInput(newFocusState)

    if inputControlsInterval and not newFocusState then
        inputControlsInterval = ClearInterval(inputControlsInterval)
    elseif not inputControlsInterval and newFocusState then
        inputControlsInterval = SetInterval(DisableInputControls)
    end

    if newFocusState then
        local screenWidth, screenHeight = GetActiveScreenResolution()
        SetCursorLocation(cursorX / screenWidth, cursorY / screenHeight)
    else
        cursorX, cursorY = GetNuiCursorPosition()
    end
end

local opacityToggled = false


for bindName, bindData in pairs(Config.KeyBinds) do
    AddKeyBind({
        name = bindName,
        description = bindData.description,
        defaultKey = bindData.bind,
        defaultMapper = bindData.mapper,
        onPress = function()
            TriggerEvent("lb-tablet:keyPressed", bindName)
        end,
        onRelease = function(duration)
            TriggerEvent("lb-tablet:keyReleased", bindName, duration)
            if bindName == "Focus" then
                ToggleFocus()
            elseif bindName == "Open" then
                ToggleOpen()
            elseif bindName == "Opacity" then
                opacityToggled = not opacityToggled
                SendReactMessage("toggleOpacity", opacityToggled)
            end
        end
    }).bindData = bindData
end


local configKeysToSync = {
    "Debug", "CurrencyFormat", "DateLocale", "EmailDomain", "DefaultLocale",
    "FrameColor", "AllowFrameColorChange", "Image", "Video", "Police",
    "Ambulance", "Browser", "RTCConfig", "DobFormat", "AllowExternal",
    "Services", "LBPhone", "FadeOutsideTablet", "EvidenceStash",
    "ShowDispatchWithoutItem", "ShowLocationsInDispatch", "Locations",
    "DispatchPosition", "DispatchVisible", "Genders", "LiveEdit"
}


local defaultSettings = LoadConfigFile("defaultSettings")
local configData = LoadConfigFile("config")
PoliceAppData = configData.apps.Police
AmbulanceAppData = configData.apps.Ambulance


for i = 1, #configKeysToSync do
    local key = configKeysToSync[i]
    configData[key] = Config[key]
end

configData.defaultSettings = defaultSettings
configData.RealTime = Config.RealTime == true

local unlockKey = "SPACE"
if Config.KeyBinds and Config.KeyBinds.UnlockTablet and Config.KeyBinds.UnlockTablet.bind then
    unlockKey = Config.KeyBinds.UnlockTablet.bind
end
configData.UnlockTabletKey = unlockKey


AddEventHandler("lb-tablet:customAppAdded", function(appData)
    configData.apps[appData.identifier] = appData
end)

AddEventHandler("lb-tablet:customAppRemoved", function(identifier)
    configData.apps[identifier] = nil
end)

local fetchingTabletData = false


function FetchTabletData()
    debugprint("FetchTabletData: triggered")

    if fetchingTabletData then
        debugprint("FetchTabletData: already fetching tablet data")
        return
    end

    fetchingTabletData = true

    if not FrameworkLoaded then
        debugprint("FetchTabletData: waiting for framework to load")
        while not FrameworkLoaded do
            Wait(0)
        end
        debugprint("FetchTabletData: framework loaded")
    end

    SetTimeout(2500, function()
        SendReactMessage("setHasTablet", HasTabletItem())
    end)

    if not tabletDataLoaded then
        debugprint("FetchTabletData: fetching tablet data")
        TriggerEvent("lb-tablet:jobUpdated")

        local tabletData = AwaitCallback("getTablet")
        if tabletData then
            TabletId = tabletData.id
            TabletSettings = tabletData.settings
            isInputDisabled = tabletData.isSetup
            tabletDataLoaded = true
            Citizen.CreateThreadNow(RefreshAllDispatches)
            debugprint("FetchTabletData: tablet fetched")
        else
            debugprint("FetchTabletData: ^1failed to fetch tablet^7 (tablet:getTablet returned nil)")
            fetchingTabletData = false
            return
        end
    end

    debugprint("FetchTabletData: ^2tablet loaded^7 triggering setData")

    local baseUrl = GetBaseUrl()
    local serverIdentifier = baseUrl


    if string.find(baseUrl, "%.users%.cfx%.re") then
        local urlLength = #baseUrl
        local reversedUrl = baseUrl:reverse()
        local dashPos = reversedUrl:find("-")
        if not dashPos then
            dashPos = #baseUrl + 1
        end
        local startPos = urlLength - dashPos + 2
        local endPos = #baseUrl - #".users.cfx.re"
        serverIdentifier = string.sub(baseUrl, startPos, endPos)
    end


    if Config.LBPhone then
        local phoneConfig = GetPhoneConfig()
        local numberFormat = "({3}) {3}-{4}"
        if phoneConfig and phoneConfig.PhoneNumber and phoneConfig.PhoneNumber.Format then
            numberFormat = phoneConfig.PhoneNumber.Format
        end
        configData.NumberFormat = numberFormat
    end


    local isPoliceJob = IsPolice()
    local isAmbulanceJob = IsAmbulance()

    if Config.RequireDutyMDT then
        local isOnDuty = IsOnDuty()
        if not isOnDuty then
            debugprint("Not on duty, disabling police and ambulance apps")
            isPoliceJob = false
            isAmbulanceJob = false
        end
    end


    configData.apps.Police = isPoliceJob and PoliceAppData or nil
    configData.apps.Ambulance = isAmbulanceJob and AmbulanceAppData or nil


    if not Config.RegistrationApp then
        configData.apps.Registration = nil
    end


    local customApps = GetCustomApps()
    for appId, appData in pairs(customApps) do
        configData.apps[appId] = appData
    end


    if Config.DynamicWebRTC and Config.DynamicWebRTC.Enabled then
        local webRTCCredentials = AwaitCallback("getWebRTCCredentials")
        if Config.DynamicWebRTC.RemoveStun and webRTCCredentials then
            for i = #webRTCCredentials, 1, -1 do
                if not webRTCCredentials[i].credential then
                    table.remove(webRTCCredentials, i)
                end
            end
        end
        if webRTCCredentials then
            Config.RTCConfig = Config.RTCConfig or {}
            Config.RTCConfig.iceServers = webRTCCredentials
            configData.RTCConfig = Config.RTCConfig
        end
    end


    SendReactMessage("setData", {
        settings = TabletSettings or defaultSettings,
        config = configData,
        serverIdentifier = serverIdentifier,
        hasPhone = Config.LBPhone and GetPhoneNumber and GetPhoneNumber() ~= nil,
        isAdmin = IsAdmin(),
        isSetup = isInputDisabled
    })

    fetchingTabletData = false
end


function LogOut()
    debugprint("LogOut triggered")
    ToggleOpen(false)
    RemoveAllDispatches()
    tabletDataLoaded = true
    TabletId = nil
    TabletSettings = nil
end


ReactCallback("loaded", function()
    debugprint("loaded: triggered")
    LoadedNUI = true
    FetchTabletData()
end, "ok")

ReactCallback("getConfigFile", function(fileName)
    return LoadConfigFile(fileName)
end)

ReactCallback("finishedSetup", function(settings)
    isInputDisabled = true
    if settings then
        local playerName = LocalPlayer.state.lbTabletName or "??"
        settings.name = playerName
        TabletSettings = settings
    end
    TriggerServerEvent("tablet:finishedSetup", settings)
end, "ok")

ReactCallback("getLocales", function()
    return Config.Locales
end, {{locale = "en", name = "English"}})


local function FactoryReset()
    LogOut()
    AwaitCallback("factoryReset")
    Wait(500)
    FetchTabletData()
    ToggleOpen(true)
end

exports("FactoryReset", FactoryReset)

ReactCallback("factoryReset", function()
    FactoryReset()
    return true
end)

ReactCallback("setSettings", function(settings)
    SendReactMessage("customApp:sendMessage", {
        identifier = "any",
        message = {
            action = "settingsUpdated",
            data = settings
        }
    })
    return AwaitCallback("setSettings", settings)
end)

ReactCallback("setName", function(name)
    return AwaitCallback("setName", name)
end)

ReactCallback("toggleInput", function(shouldToggle)
    if Config.KeepInput then
        if shouldToggle then
            Wait(200)
        end
        SetNuiFocusKeepInput(not shouldToggle)
    end
end, "ok")

ReactCallback("setFocus", function()
    if not TabletOpen then
        ToggleOpen(true, true)
    end
end, "ok")

ReactCallback("close", function()
    if TabletOpen then
        ToggleOpen(false, true)
    end
end, "ok")


function ToggleOpen(forceState, skipAnimation, unlock)
    local newState = forceState
    if forceState == nil then
        newState = not TabletOpen
    end

    debugprint("ToggleOpen: " .. tostring(newState) .. " " .. tostring(forceState) .. " " .. tostring(skipAnimation))

    if TabletDisabled and newState then
        debugprint("ToggleOpen: tablet is disabled")
        return
    end

    if not tabletDataLoaded then
        debugprint("ToggleOpen: tablet has not loaded")
        debugprint("UI loaded:" .. tostring(LoadedNUI))
        return
    end

    if newState == TabletOpen then
        debugprint("ToggleOpen: already " .. (newState and "open" or "closed"))
        return
    end

    if newState then
        if not CanOpenTablet() then
            debugprint("ToggleOpen: not allowed to open tablet (CanOpenTablet returned false)")
            return
        end
    end

    opacityToggled = false
    SendReactMessage("toggleOpacity", opacityToggled)

    TabletOpen = newState
    SetNuiFocus(TabletOpen, TabletOpen)

    if Config.KeepInput then
        SetNuiFocusKeepInput(TabletOpen)
    end


    if not TabletOpen then
        SetNuiFocus(false, false)
        SetNuiFocusKeepInput(false)
    end

    if TabletOpen then
        OnOpen()
    else
        OnClose()
    end

    if not skipAnimation then
        SendReactMessage("setVisibility", TabletOpen)
        if unlock then
            SetTimeout(100, function()
                SendReactMessage("unlock")
            end)
        end
    end

    TriggerServerEvent("tablet:toggleOpen", TabletOpen)
    UpdateAnimations()

    if not TabletOpen then
        while IsDisabledControlPressed(0, 199) or IsDisabledControlPressed(0, 200) do
            Wait(0)
            DisableControlAction(0, 199, true)
            DisableControlAction(0, 200, true)
        end
    end

    if Config.KeepInput then
        if TabletOpen then
            playerId = PlayerId()
            if not disableControlsInterval then
                disableControlsInterval = SetInterval(DisableTabletControls)
            end
            if not inputControlsInterval then
                inputControlsInterval = SetInterval(DisableInputControls)
            end
            CreateThread(ControllerThread)

            if not Config.RealTime then
                if not timeUpdateInterval then
                    timeUpdateInterval = SetInterval(function()
                        local timeData
                        if Config.CustomTime then
                            timeData = Config.CustomTime()
                        end
                        if not timeData then
                            timeData = {
                                hour = GetClockHours(),
                                minute = GetClockMinutes()
                            }
                        end
                        SendReactMessage("updateTime", timeData)
                    end, 1000)
                end
            end
        else
            if disableControlsInterval then
                disableControlsInterval = ClearInterval(disableControlsInterval)
            end
            if inputControlsInterval then
                inputControlsInterval = ClearInterval(inputControlsInterval)
            end
            if timeUpdateInterval then
                timeUpdateInterval = ClearInterval(timeUpdateInterval)
            end
        end
    end
end


function ToggleDisabled(disabled)
    TabletDisabled = disabled == true
    if TabletDisabled and TabletOpen then
        ToggleOpen(false)
    end
end


exports("ToggleDisabled", ToggleDisabled)

exports("ToggleOpen", function(state, unlock)
    if type(state) == "boolean" then
        ToggleOpen(state, nil, unlock == true)
    else
        ToggleOpen(nil, nil, unlock == true)
    end
end)

exports("IsOpen", function()
    return TabletOpen
end)


RegisterNetEvent("tablet:toggleOpen", function(state)
    if type(state) == "boolean" then
        ToggleOpen(state)
    else
        ToggleOpen()
    end
end)


if Config.OpenCommand then
    RegisterCommand(Config.OpenCommand, function()
        ToggleOpen()
    end, false)
end


AddEventHandler("onResourceStop", function(resourceName)
    if resourceName == GetCurrentResourceName() then
        if TabletOpen then
            SetNuiFocus(false, false)
        end
    end
end)
