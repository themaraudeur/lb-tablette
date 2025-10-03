local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = {}
L1_1 = {}
L2_1 = "NotificationUp"
L3_1 = "NotificationDown"
L4_1 = "NotificationDismiss"
L5_1 = "NotificationView"
L6_1 = "NotificationRespond"
L7_1 = "NotificationExpand"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L1_1[6] = L7_1
L2_1 = true
L3_1 = true
L4_1 = nil
L5_1 = {}
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L0_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L2_2 = debugprint
    L3_2 = "DismissDispatch: No dispatch found with id"
    L4_2 = A0_2
    L2_2(L3_2, L4_2)
    return
  end
  L2_2 = L1_2.blip
  if L2_2 then
    L2_2 = L1_2.blip
    L2_2 = L2_2.handle
  end
  if L2_2 then
    L3_2 = RemoveBlip
    L4_2 = L2_2
    L3_2(L4_2)
  end
  L3_2 = L5_1
  L3_2[A0_2] = true
end
L7_1 = ReactCallback
L8_1 = "Dispatch"
function L9_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = A0_2.action
  if "respondDispatch" == L1_2 then
    L2_2 = A0_2.id
    if L2_2 then
      L3_2 = A0_2.id
      L2_2 = L0_1
      L2_2 = L2_2[L3_2]
      if L2_2 then
        L2_2 = RespondToDispatch
        L4_2 = A0_2.id
        L3_2 = L0_1
        L3_2 = L3_2[L4_2]
        L2_2(L3_2)
    end
    else
      L2_2 = debugprint
      L3_2 = "Invalid dispatch id for respond"
      L4_2 = A0_2.id
      L2_2(L3_2, L4_2)
    end
    L2_2 = "ok"
    return L2_2
  elseif "deleteDispatch" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "deleteDispatch"
    L4_2 = A0_2.id
    return L2_2(L3_2, L4_2)
  elseif "clearDispatches" == L1_2 then
    L2_2 = A0_2.removeForEveryone
    if L2_2 then
      L2_2 = AwaitCallback
      L3_2 = "clearDispatches"
      return L2_2(L3_2)
    else
      L2_2 = RemoveAllDispatches
      L2_2()
      L2_2 = true
      return L2_2
    end
  elseif "dismissDispatch" == L1_2 then
    L2_2 = A0_2.id
    if L2_2 then
      L2_2 = L6_1
      L3_2 = A0_2.id
      L2_2(L3_2)
    end
    L2_2 = "ok"
    return L2_2
  end
end
L7_1(L8_1, L9_1)
function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = {}
  L1_2 = 1
  L2_2 = L1_1
  L2_2 = #L2_2
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = L1_1
    L5_2 = L5_2[L4_2]
    L6_2 = Config
    L6_2 = L6_2.KeyBinds
    L6_2 = L6_2[L5_2]
    L6_2 = L6_2.bindData
    if not L6_2 then
    else
      L7_2 = GetControlInstructionalButton
      L8_2 = 0
      L9_2 = L6_2.hash
      L10_2 = true
      L7_2 = L7_2(L8_2, L9_2, L10_2)
      L9_2 = L7_2
      L8_2 = L7_2.sub
      L10_2 = 1
      L11_2 = 2
      L8_2 = L8_2(L9_2, L10_2, L11_2)
      if "b_" == L8_2 then
        L9_2 = GetInstructionalButtonName
        L10_2 = L7_2
        L9_2 = L9_2(L10_2)
        L0_2[L5_2] = L9_2
      elseif "t_" == L8_2 then
        L10_2 = L7_2
        L9_2 = L7_2.sub
        L11_2 = 3
        L9_2 = L9_2(L10_2, L11_2)
        L0_2[L5_2] = L9_2
      end
    end
  end
  return L0_2
end
GetDispatchControls = L7_1
function L7_1()
  local L0_2, L1_2, L2_2
  L0_2 = SendReactMessage
  L1_2 = "dispatch:setControls"
  L2_2 = GetDispatchControls
  L2_2 = L2_2()
  L0_2(L1_2, L2_2)
end
function L8_1()
  local L0_2, L1_2
  L0_2 = Config
  L0_2 = L0_2.DispatchUpdateZIndex
  if not L0_2 then
    L0_2 = debugprint
    L1_2 = "Config.DispatchUpdateZIndex is false, not updating z-index"
    L0_2(L1_2)
    return
  end
  L0_2 = TabletOpen
  if L0_2 then
    L0_2 = debugprint
    L1_2 = "Tablet is open, already has high z-index"
    L0_2(L1_2)
    return
  end
  L0_2 = SetNuiZindex
  if not L0_2 then
    L0_2 = debugprint
    L1_2 = "SetNuiZindex does not exist"
    L0_2(L1_2)
    return
  end
  L0_2 = L2_1
  if L0_2 then
    L0_2 = debugprint
    L1_2 = "Dispatch is visible; setting z-index to 99"
    L0_2(L1_2)
    L0_2 = SetNuiZindex
    L1_2 = 99
    L0_2(L1_2)
  else
    L0_2 = debugprint
    L1_2 = "Dispatch not visible & tablet not open; setting z-index to 0"
    L0_2(L1_2)
    L0_2 = SetNuiZindex
    L1_2 = 0
    L0_2(L1_2)
  end
end
function L9_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = Config
  L1_2 = L1_2.DispatchBlip
  L1_2 = L1_2.Enabled
  if not L1_2 then
    return
  end
  L1_2 = A0_2.blip
  if false ~= L1_2 then
    L1_2 = A0_2.blip
    if nil ~= L1_2 then
      goto lbl_19
    end
    L1_2 = Config
    L1_2 = L1_2.DispatchBlip
    L1_2 = L1_2.Default
    if L1_2 then
      goto lbl_19
    end
  end
  do return end
  ::lbl_19::
  L1_2 = IsOnDuty
  L1_2 = L1_2()
  if not L1_2 then
    L1_2 = A0_2.blip
    if L1_2 then
      L1_2 = A0_2.blip
      L1_2 = L1_2.handle
      if L1_2 then
        L1_2 = RemoveBlip
        L2_2 = A0_2.blip
        L2_2 = L2_2.handle
        L1_2(L2_2)
      end
    end
    return
  end
  L1_2 = A0_2.blip
  if not L1_2 then
    L1_2 = {}
  end
  A0_2.blip = L1_2
  L1_2 = A0_2.blip
  L1_2 = L1_2.sprite
  if not L1_2 then
    L1_2 = Config
    L1_2 = L1_2.DispatchBlip
    L1_2 = L1_2.Default
    L1_2 = L1_2.Sprite
  end
  L2_2 = A0_2.blip
  L2_2 = L2_2.color
  if not L2_2 then
    L2_2 = Config
    L2_2 = L2_2.DispatchBlip
    L2_2 = L2_2.Default
    L2_2 = L2_2.Color
  end
  L3_2 = A0_2.blip
  L3_2 = L3_2.label
  if not L3_2 then
    L3_2 = Config
    L3_2 = L3_2.DispatchBlip
    L3_2 = L3_2.Default
    L3_2 = L3_2.Label
  end
  L4_2 = A0_2.blip
  L4_2 = L4_2.size
  if not L4_2 then
    L4_2 = Config
    L4_2 = L4_2.DispatchBlip
    L4_2 = L4_2.Default
    L4_2 = L4_2.Size
  end
  L5_2 = A0_2.blip
  L5_2 = L5_2.shortRange
  if not L5_2 then
    L5_2 = Config
    L5_2 = L5_2.DispatchBlip
    L5_2 = L5_2.Default
    L5_2 = L5_2.ShortRange
  end
  L6_2 = A0_2.blip
  L7_2 = CreateBlip
  L8_2 = vector2
  L9_2 = A0_2.location
  L9_2 = L9_2.coords
  L9_2 = L9_2.x
  L10_2 = A0_2.location
  L10_2 = L10_2.coords
  L10_2 = L10_2.y
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = L1_2
  L10_2 = L2_2
  L11_2 = FormatString
  L12_2 = L3_2
  L13_2 = {}
  L14_2 = A0_2.title
  L13_2.dispatch_title = L14_2
  L14_2 = A0_2.id
  L13_2.id = L14_2
  L14_2 = A0_2.priority
  L13_2.priority = L14_2
  L11_2 = L11_2(L12_2, L13_2)
  L12_2 = L4_2
  L13_2 = L5_2
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L6_2.handle = L7_2
end
function L10_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L2_2 = A0_2.id
  L1_2 = L0_1
  L1_2[L2_2] = A0_2
  L1_2 = L9_1
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = L7_1
  L1_2()
  L1_2 = SendReactMessage
  L2_2 = "dispatch:add"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
  L1_2 = L8_1
  L1_2()
  L1_2 = debugprint
  L2_2 = "Dispatch: Added dispatch"
  L3_2 = A0_2.id
  L4_2 = A0_2.title
  L1_2(L2_2, L3_2, L4_2)
end
function L11_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L2_2 = A0_2.id
  L1_2 = L0_1
  L1_2 = L1_2[L2_2]
  if not L1_2 then
    L2_2 = debugprint
    L3_2 = "Old dispatch not found"
    L4_2 = A0_2.id
    L2_2(L3_2, L4_2)
    return
  end
  L3_2 = A0_2.id
  L2_2 = L5_1
  L2_2 = L2_2[L3_2]
  if L2_2 then
    L2_2 = debugprint
    L3_2 = "Dispatch is dismissed, not updating"
    L4_2 = A0_2.id
    L2_2(L3_2, L4_2)
    return
  end
  if L1_2 then
    L2_2 = L1_2.blip
    if L2_2 then
      L2_2 = L1_2.blip
      L2_2 = L2_2.handle
      if L2_2 then
        L2_2 = RemoveBlip
        L3_2 = L1_2.blip
        L3_2 = L3_2.handle
        L2_2(L3_2)
      end
    end
  end
  L3_2 = A0_2.id
  L2_2 = L0_1
  L2_2[L3_2] = A0_2
  L2_2 = L9_1
  L3_2 = A0_2
  L2_2(L3_2)
  L2_2 = L7_1
  L2_2()
  L2_2 = SendReactMessage
  L3_2 = "dispatch:update"
  L4_2 = A0_2
  L2_2(L3_2, L4_2)
end
function L12_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L0_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    return
  end
  L2_2 = L1_2.blip
  if L2_2 then
    L2_2 = L1_2.blip
    L2_2 = L2_2.handle
    if L2_2 then
      L2_2 = RemoveBlip
      L3_2 = L1_2.blip
      L3_2 = L3_2.handle
      L2_2(L3_2)
    end
  end
  L2_2 = L0_1
  L2_2[A0_2] = nil
  L2_2 = L5_1
  L2_2[A0_2] = nil
  L2_2 = SendReactMessage
  L3_2 = "dispatch:remove"
  L4_2 = A0_2
  L2_2(L3_2, L4_2)
end
L13_1 = RegisterNetEvent
L14_1 = "tablet:addDispatch"
function L15_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = Config
  L1_2 = L1_2.DispatchEnabled
  if false == L1_2 then
    L1_2 = debugprint
    L2_2 = "tablet:addDispatch - Config.DispatchEnabled is set to false"
    L1_2(L2_2)
    return
  end
  L1_2 = L4_1
  L2_2 = A0_2.job
  if L1_2 ~= L2_2 then
    L1_2 = debugprint
    L2_2 = "Not adding dispatch as job is different"
    L3_2 = L4_1
    L4_2 = A0_2.job
    L1_2(L2_2, L3_2, L4_2)
    return
  end
  L1_2 = L10_1
  L2_2 = A0_2
  L1_2(L2_2)
end
L13_1(L14_1, L15_1)
L13_1 = RegisterNetEvent
L14_1 = "tablet:updateDispatch"
function L15_1(A0_2)
  local L1_2, L2_2
  L1_2 = L4_1
  L2_2 = A0_2.job
  if L1_2 ~= L2_2 then
    L1_2 = debugprint
    L2_2 = "Not updating dispatch as job is different"
    return L1_2(L2_2)
  end
  L1_2 = L11_1
  L2_2 = A0_2
  L1_2(L2_2)
end
L13_1(L14_1, L15_1)
L13_1 = RegisterNetEvent
L14_1 = "tablet:removeAllDispatches"
function L15_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L4_1
  if L1_2 ~= A0_2 then
    L1_2 = debugprint
    L2_2 = "Not removing all dispatches as job is different"
    L3_2 = L4_1
    L4_2 = A0_2
    L1_2(L2_2, L3_2, L4_2)
    return
  end
  L1_2 = RemoveAllDispatches
  L1_2()
end
L13_1(L14_1, L15_1)
L13_1 = RegisterNetEvent
L14_1 = "tablet:removeDispatch"
function L15_1(A0_2)
  local L1_2, L2_2
  L1_2 = L12_1
  L2_2 = A0_2
  L1_2(L2_2)
end
L13_1(L14_1, L15_1)
function L13_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = true == A0_2
  L2_1 = L1_2
  L1_2 = L3_1
  if L1_2 then
    L1_2 = SendReactMessage
    L2_2 = "dispatch:toggleDispatch"
    L3_2 = L2_1
    L1_2(L2_2, L3_2)
    L1_2 = L8_1
    L1_2()
  else
    L1_2 = debugprint
    L2_2 = "Dispatch is not visible as dutyDispatchVisible is false"
    L1_2(L2_2)
  end
end
ToggleDispatchVisible = L13_1
L13_1 = exports
L14_1 = "ToggleDispatchVisible"
L15_1 = ToggleDispatchVisible
L13_1(L14_1, L15_1)
L13_1 = exports
L14_1 = "IsDispatchVisible"
function L15_1()
  local L0_2, L1_2
  L0_2 = L2_1
  return L0_2
end
L13_1(L14_1, L15_1)
function L13_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = debugprint
  L1_2 = "Removing all dispatches"
  L0_2(L1_2)
  L0_2 = pairs
  L1_2 = L0_1
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = L12_1
    L7_2 = L4_2
    L6_2(L7_2)
  end
end
RemoveAllDispatches = L13_1
function L13_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = nil
  L1_2 = {}
  L2_2 = IsPolice
  L2_2 = L2_2()
  if L2_2 then
    L2_2 = GetPermissions
    L3_2 = "Police"
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = L2_2.dispatch
    end
    if L2_2 then
      L2_2 = L2_2.view
    end
    if false ~= L2_2 then
      L0_2 = "police"
      L2_2 = AwaitCallback
      L3_2 = "police:getDispatches"
      L2_2 = L2_2(L3_2)
      L1_2 = L2_2 or L1_2
      if not L2_2 then
        L2_2 = {}
        L1_2 = L2_2
      end
      L2_2 = debugprint
      L3_2 = "Dispatch: RefreshAllDispatches - newJob = police"
      L2_2(L3_2)
  end
  else
    L2_2 = IsAmbulance
    L2_2 = L2_2()
    if L2_2 then
      L2_2 = GetPermissions
      L3_2 = "Ambulance"
      L2_2 = L2_2(L3_2)
      if L2_2 then
        L2_2 = L2_2.dispatch
      end
      if L2_2 then
        L2_2 = L2_2.view
      end
      if false ~= L2_2 then
        L0_2 = "ambulance"
        L2_2 = AwaitCallback
        L3_2 = "ambulance:getDispatches"
        L2_2 = L2_2(L3_2)
        L1_2 = L2_2 or L1_2
        if not L2_2 then
          L2_2 = {}
          L1_2 = L2_2
        end
        L2_2 = debugprint
        L3_2 = "Dispatch: RefreshAllDispatches - newJob = ambulance"
        L2_2(L3_2)
    end
    else
      L2_2 = debugprint
      L3_2 = "Dispatch: RefreshAllDispatches - No job found, removing all dispatches"
      L2_2(L3_2)
      L2_2 = RemoveAllDispatches
      L2_2()
      L2_2 = nil
      L4_1 = L2_2
      return
    end
  end
  L2_2 = L4_1
  if L0_2 ~= L2_2 then
    L2_2 = debugprint
    L3_2 = "Dispatch: RefreshAllDispatches - newJob is different from currentDispatchJob"
    L4_2 = L0_2
    L5_2 = L4_1
    L2_2(L3_2, L4_2, L5_2)
    L2_2 = RemoveAllDispatches
    L2_2()
    L4_1 = L0_2
  end
  L2_2 = L7_1
  L2_2()
  L2_2 = pairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L0_1
    L8_2 = L8_2[L6_2]
    if L8_2 then
      L8_2 = L11_1
      L9_2 = L7_2
      L8_2(L9_2)
    else
      L8_2 = L10_1
      L9_2 = L7_2
      L8_2(L9_2)
    end
    L8_2 = L0_1
    L8_2[L6_2] = L7_2
  end
  L2_2 = pairs
  L3_2 = L0_1
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L1_2[L6_2]
    if not L8_2 then
      L8_2 = L12_1
      L9_2 = L6_2
      L8_2(L9_2)
    end
  end
end
RefreshAllDispatches = L13_1
L13_1 = {}
L13_1.NotificationUp = "up"
L13_1.NotificationDown = "down"
L13_1.NotificationDismiss = "dismiss"
L13_1.NotificationView = "view"
L13_1.NotificationRespond = "respond"
L13_1.NotificationExpand = "expand"
L14_1 = AddEventHandler
L15_1 = "lb-tablet:keyReleased"
function L16_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L13_1
  L1_2 = L1_2[A0_2]
  if L1_2 then
    L1_2 = L2_1
    if L1_2 then
      L1_2 = IsNuiFocused
      L1_2 = L1_2()
      if L1_2 then
        L1_2 = TabletOpen
        if not L1_2 then
          goto lbl_26
        end
      end
      L1_2 = IsNuiFocused
      L1_2 = L1_2()
      if not L1_2 then
        goto lbl_27
      end
      L1_2 = TabletOpen
      if not L1_2 then
        goto lbl_27
      end
      L1_2 = IsNuiFocusKeepingInput
      L1_2 = L1_2()
      if L1_2 then
        goto lbl_27
      end
    end
  end
  ::lbl_26::
  do return end
  ::lbl_27::
  L1_2 = SendReactMessage
  L2_2 = "dispatch:"
  L3_2 = L13_1
  L3_2 = L3_2[A0_2]
  L2_2 = L2_2 .. L3_2
  L1_2(L2_2)
end
L14_1(L15_1, L16_1)
L14_1 = AddEventHandler
L15_1 = "lb-tablet:jobUpdated"
function L16_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = debugprint
  L1_2 = "Dispatch: job updated, refreshing all dispatches & visibility"
  L0_2(L1_2)
  L0_2 = Config
  L0_2 = L0_2.RequireDutyDispatch
  if L0_2 then
    L0_2 = IsOnDuty
    L0_2 = L0_2()
    L3_1 = L0_2
    L0_2 = L3_1
    if L0_2 then
      L0_2 = SendReactMessage
      L1_2 = "dispatch:toggleDispatch"
      L2_2 = L2_1
      L0_2(L1_2, L2_2)
    else
      L0_2 = SendReactMessage
      L1_2 = "dispatch:toggleDispatch"
      L2_2 = false
      L0_2(L1_2, L2_2)
    end
    L0_2 = debugprint
    L1_2 = "Dispatch: dutyDispatchVisible:"
    L2_2 = L3_1
    L3_2 = "dispatchVisible:"
    L4_2 = L2_1
    L0_2(L1_2, L2_2, L3_2, L4_2)
  end
  L0_2 = RefreshAllDispatches
  L0_2()
end
L14_1(L15_1, L16_1)
L14_1 = exports
L15_1 = "AddDispatch"
function L16_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = Config
  L1_2 = L1_2.AllowClientDispatch
  if not L1_2 then
    L1_2 = infoprint
    L2_2 = "error"
    L3_2 = "AddDispatch: Config.AllowClientDispatch is set to false"
    L1_2(L2_2, L3_2)
    L1_2 = false
    return L1_2
  end
  L1_2 = TriggerServerEvent
  L2_2 = "lb-tablet:addDispatch"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L14_1(L15_1, L16_1)
