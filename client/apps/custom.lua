local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = {}
L1_1 = {}
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = GetInvokingResource
  L1_2 = L1_2()
  if not L1_2 then
    L1_2 = GetCurrentResourceName
    L1_2 = L1_2()
  end
  L2_2 = assert
  L3_2 = type
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L3_2 = "table" == L3_2
  L4_2 = "AddCustomApp: expected appData to have type table, got "
  L5_2 = type
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  L4_2 = L4_2 .. L5_2
  L2_2(L3_2, L4_2)
  L2_2 = assert
  L3_2 = type
  L4_2 = A0_2.identifier
  L3_2 = L3_2(L4_2)
  L3_2 = "string" == L3_2
  L4_2 = "AddCustomApp: expected identifier to have type string, got "
  L5_2 = type
  L6_2 = A0_2.identifier
  L5_2 = L5_2(L6_2)
  L4_2 = L4_2 .. L5_2
  L2_2(L3_2, L4_2)
  L2_2 = assert
  L3_2 = type
  L4_2 = A0_2.name
  L3_2 = L3_2(L4_2)
  L3_2 = "string" == L3_2
  L4_2 = "AddCustomApp: expected name to have type string, got "
  L5_2 = type
  L6_2 = A0_2.name
  L5_2 = L5_2(L6_2)
  L4_2 = L4_2 .. L5_2
  L2_2(L3_2, L4_2)
  L3_2 = A0_2.identifier
  L2_2 = L0_1
  L2_2 = L2_2[L3_2]
  if L2_2 then
    L2_2 = false
    L3_2 = "APP_ALREADY_EXISTS"
    return L2_2, L3_2
  end
  L2_2 = A0_2.ui
  if L2_2 then
    L2_2 = A0_2.ui
    L3_2 = L2_2
    L2_2 = L2_2.find
    L4_2 = "^http"
    L2_2 = L2_2(L3_2, L4_2)
    if not L2_2 then
      L2_2 = L1_2
      L3_2 = "/"
      L4_2 = A0_2.ui
      L2_2 = L2_2 .. L3_2 .. L4_2
      A0_2.ui = L2_2
    end
  end
  L2_2 = A0_2.icon
  if L2_2 then
    L2_2 = A0_2.icon
    L3_2 = L2_2
    L2_2 = L2_2.find
    L4_2 = "^http"
    L2_2 = L2_2(L3_2, L4_2)
    if not L2_2 then
      L2_2 = "https://cfx-nui-"
      L3_2 = L1_2
      L4_2 = "/"
      L5_2 = A0_2.icon
      L2_2 = L2_2 .. L3_2 .. L4_2 .. L5_2
      A0_2.icon = L2_2
    end
  end
  L2_2 = A0_2.images
  if L2_2 then
    L2_2 = 1
    L3_2 = A0_2.images
    L3_2 = #L3_2
    L4_2 = 1
    for L5_2 = L2_2, L3_2, L4_2 do
      L6_2 = A0_2.images
      L6_2 = L6_2[L5_2]
      L8_2 = L6_2
      L7_2 = L6_2.find
      L9_2 = "^http"
      L7_2 = L7_2(L8_2, L9_2)
      if not L7_2 then
        L7_2 = A0_2.images
        L8_2 = "https://cfx-nui-"
        L9_2 = L1_2
        L10_2 = "/"
        L11_2 = L6_2
        L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2
        L7_2[L5_2] = L8_2
      end
    end
  end
  L3_2 = A0_2.identifier
  L2_2 = L1_1
  L4_2 = {}
  L5_2 = A0_2.onInstall
  L4_2.install = L5_2
  L5_2 = A0_2.onOpen
  L4_2.open = L5_2
  L5_2 = A0_2.onClose
  L4_2.close = L5_2
  L5_2 = A0_2.onUninstall
  L4_2.uninstall = L5_2
  L2_2[L3_2] = L4_2
  L3_2 = A0_2.identifier
  L2_2 = L0_1
  L4_2 = {}
  L5_2 = A0_2.identifier
  L4_2.identifier = L5_2
  L4_2.resource = L1_2
  L4_2.custom = true
  L5_2 = A0_2.name
  L4_2.name = L5_2
  L5_2 = A0_2.description
  L4_2.description = L5_2
  L5_2 = A0_2.icon
  L4_2.icon = L5_2
  L5_2 = A0_2.price
  L4_2.price = L5_2
  L5_2 = A0_2.images
  L4_2.images = L5_2
  L5_2 = A0_2.developer
  L4_2.developer = L5_2
  L5_2 = A0_2.size
  if not L5_2 then
    L5_2 = 0
  end
  L4_2.size = L5_2
  L5_2 = A0_2.ui
  L4_2.ui = L5_2
  L5_2 = A0_2.defaultApp
  L5_2 = true ~= L5_2
  L4_2.removable = L5_2
  L2_2[L3_2] = L4_2
  L2_2 = TriggerEvent
  L3_2 = "lb-tablet:customAppAdded"
  L5_2 = A0_2.identifier
  L4_2 = L0_1
  L4_2 = L4_2[L5_2]
  L2_2(L3_2, L4_2)
  L2_2 = SendReactMessage
  L3_2 = "addCustomApp"
  L5_2 = A0_2.identifier
  L4_2 = L0_1
  L4_2 = L4_2[L5_2]
  L2_2(L3_2, L4_2)
  L2_2 = true
  return L2_2
end
AddCustomApp = L2_1
L2_1 = exports
L3_1 = "AddCustomApp"
L4_1 = AddCustomApp
L2_1(L3_1, L4_1)
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = GetInvokingResource
  L1_2 = L1_2()
  L2_2 = assert
  L3_2 = type
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L3_2 = "string" == L3_2
  L4_2 = "RemoveCustomApp: expected identifier to have type string, got "
  L5_2 = type
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  L4_2 = L4_2 .. L5_2
  L2_2(L3_2, L4_2)
  L2_2 = L0_1
  L2_2 = L2_2[A0_2]
  if not L2_2 then
    L2_2 = false
    L3_2 = "INVALID_APP"
    return L2_2, L3_2
  end
  L2_2 = L0_1
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2.resource
  if L2_2 ~= L1_2 then
    L2_2 = false
    L3_2 = "WRONG_RESOURCE"
    return L2_2, L3_2
  end
  L2_2 = L0_1
  L2_2[A0_2] = nil
  L2_2 = L1_1
  L2_2[A0_2] = nil
  L2_2 = TriggerEvent
  L3_2 = "lb-tablet:customAppRemoved"
  L4_2 = A0_2
  L2_2(L3_2, L4_2)
  L2_2 = SendReactMessage
  L3_2 = "removeCustomApp"
  L4_2 = A0_2
  L2_2(L3_2, L4_2)
end
RemoveCustomApp = L2_1
L2_1 = exports
L3_1 = "RemoveCustomApp"
L4_1 = RemoveCustomApp
L2_1(L3_1, L4_1)
L2_1 = exports
L3_1 = "SendCustomAppMessage"
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  if not L3_2 then
    L3_2 = false
    L4_2 = "INVALID_APP"
    return L3_2, L4_2
  end
  L3_2 = SendReactMessage
  L4_2 = "customApp:sendMessage"
  L5_2 = {}
  L5_2.identifier = A0_2
  L6_2 = {}
  L6_2.action = A1_2
  L6_2.data = A2_2
  L5_2.message = L6_2
  L3_2(L4_2, L5_2)
  L3_2 = true
  return L3_2
end
L2_1(L3_1, L4_1)
L2_1 = AddEventHandler
L3_1 = "onResourceStop"
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = pairs
  L2_2 = L0_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.resource
    if L7_2 == A0_2 then
      L7_2 = L0_1
      L7_2[L5_2] = nil
      L7_2 = L1_1
      L7_2[L5_2] = nil
      L7_2 = SendReactMessage
      L8_2 = "removeCustomApp"
      L9_2 = L5_2
      L7_2(L8_2, L9_2)
      L7_2 = debugprint
      L8_2 = "Removed custom app"
      L9_2 = L5_2
      L10_2 = "due to resource stop"
      L7_2(L8_2, L9_2, L10_2)
    end
  end
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNUICallback
L3_1 = "CustomApp"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
  L2_2 = A0_2.action
  L3_2 = A0_2.app
  L4_2 = L1_1
  L4_2 = L4_2[L3_2]
  if L4_2 then
    L5_2 = L4_2[L2_2]
    if L5_2 then
      L5_2 = L4_2[L2_2]
      L5_2()
    end
    return
  end
end
L2_1(L3_1, L4_1)
function L2_1()
  local L0_2, L1_2
  L0_2 = L0_1
  return L0_2
end
GetCustomApps = L2_1
L2_1 = Config
L2_1 = L2_1.CustomApps
if L2_1 then
  L2_1 = Config
  L2_1 = L2_1.CustomApps
  L2_1 = #L2_1
  if L2_1 > 0 then
    L2_1 = 1
    L3_1 = Config
    L3_1 = L3_1.CustomApps
    L3_1 = #L3_1
    L4_1 = 1
    for L5_1 = L2_1, L3_1, L4_1 do
      L6_1 = AddCustomApp
      L7_1 = Config
      L7_1 = L7_1.CustomApps
      L7_1 = L7_1[L5_1]
      L6_1(L7_1)
    end
  end
end
