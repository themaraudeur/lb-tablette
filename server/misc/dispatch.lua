local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = {}
L1_1 = {}
function L2_1(A0_2)
  local L1_2
  L1_2 = L0_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L1_2 = {}
  end
  return L1_2
end
GetJobDispatches = L2_1
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = math
  L0_2 = L0_2.random
  L1_2 = 999999999
  L0_2 = L0_2(L1_2)
  while true do
    L1_2 = L1_1
    L1_2 = L1_2[L0_2]
    if not L1_2 then
      break
    end
    L1_2 = math
    L1_2 = L1_2.random
    L2_2 = 999999999
    L1_2 = L1_2(L2_2)
    L0_2 = L1_2
    L1_2 = Wait
    L2_2 = 0
    L1_2(L2_2)
  end
  return L0_2
end
function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = math
  L1_2 = L1_2.floor
  L2_2 = A0_2.time
  if not L2_2 then
    L2_2 = 300
  end
  L1_2 = L1_2(L2_2)
  A0_2.time = L1_2
  L1_2 = A0_2.job
  if not L1_2 then
    L1_2 = "police"
  end
  A0_2.job = L1_2
  L1_2 = assert
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L2_2 = "table" == L2_2
  L3_2 = "AddDispatch: options must be a table"
  L1_2(L2_2, L3_2)
  L1_2 = assert
  L2_2 = A0_2.priority
  L2_2 = "high" == L2_2
  L3_2 = "AddDispatch: options.priority must be 'high', 'medium' or 'low'"
  L1_2(L2_2, L3_2)
  L1_2 = assert
  L2_2 = type
  L3_2 = A0_2.code
  L2_2 = L2_2(L3_2)
  L2_2 = "string" == L2_2
  L3_2 = "AddDispatch: options.code must be a string"
  L1_2(L2_2, L3_2)
  L1_2 = assert
  L2_2 = type
  L3_2 = A0_2.title
  L2_2 = L2_2(L3_2)
  L2_2 = "string" == L2_2
  L3_2 = "AddDispatch: options.title must be a string"
  L1_2(L2_2, L3_2)
  L1_2 = assert
  L2_2 = type
  L3_2 = A0_2.description
  L2_2 = L2_2(L3_2)
  L2_2 = "string" == L2_2
  L3_2 = "AddDispatch: options.description must be a string"
  L1_2(L2_2, L3_2)
  L1_2 = assert
  L2_2 = A0_2.location
  L3_2 = "AddDispatch: options.location must be a table"
  L1_2(L2_2, L3_2)
  L1_2 = assert
  L2_2 = type
  L3_2 = A0_2.location
  L3_2 = L3_2.label
  L2_2 = L2_2(L3_2)
  L2_2 = "string" == L2_2
  L3_2 = "AddDispatch: options.location.label must be a string"
  L1_2(L2_2, L3_2)
  L1_2 = assert
  L2_2 = A0_2.location
  L2_2 = L2_2.coords
  L2_2 = L2_2.x
  if L2_2 then
    L2_2 = A0_2.location
    L2_2 = L2_2.coords
    L2_2 = L2_2.y
  end
  L3_2 = "AddDispatch: options.location.coords must be a vector2 or have x and y keys"
  L1_2(L2_2, L3_2)
  L1_2 = assert
  L2_2 = type
  L3_2 = A0_2.time
  L2_2 = L2_2(L3_2)
  L2_2 = "number" == L2_2
  L3_2 = "AddDispatch: options.time must be a number and greater than 0"
  L1_2(L2_2, L3_2)
  return A0_2
end
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  if not A0_2 then
    L1_2 = debugprint
    L2_2 = "RemoveAllDispatches: job is nil"
    L1_2(L2_2)
    L1_2 = false
    return L1_2
  end
  L1_2 = L0_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L1_2 = debugprint
    L2_2 = "RemoveAllDispatches: no dispatches for job"
    L3_2 = A0_2
    L1_2(L2_2, L3_2)
    L1_2 = true
    return L1_2
  end
  L1_2 = debugprint
  L2_2 = "Removing all dispatches for job"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
  L1_2 = pairs
  L2_2 = L0_1
  L2_2 = L2_2[A0_2]
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L0_1
    L7_2 = L7_2[A0_2]
    L7_2[L5_2] = nil
    L7_2 = L1_1
    L7_2[L5_2] = nil
  end
  L1_2 = TriggerClientEvent
  L2_2 = "tablet:removeAllDispatches"
  L3_2 = -1
  L4_2 = A0_2
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = true
  return L1_2
end
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = TriggerClientEvent
  L2_2 = "tablet:removeDispatch"
  L3_2 = -1
  L4_2 = A0_2
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = L1_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L2_2 = debugprint
    L3_2 = "RemoveDispatch: no dispatchJob"
    L4_2 = A0_2
    L2_2(L3_2, L4_2)
    L2_2 = false
    return L2_2
  end
  L2_2 = L0_1
  L2_2 = L2_2[L1_2]
  L2_2 = L2_2[A0_2]
  if not L2_2 then
    L3_2 = debugprint
    L4_2 = "RemoveDispatch: no currentDispatch"
    L5_2 = A0_2
    L3_2(L4_2, L5_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = debugprint
  L4_2 = "Removed dispatch"
  L5_2 = A0_2
  L6_2 = L1_2
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = L0_1
  L3_2 = L3_2[L1_2]
  L3_2[A0_2] = nil
  L3_2 = L1_1
  L3_2[A0_2] = nil
  L3_2 = true
  return L3_2
end
function L6_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = debugprint
  L4_2 = "Queued dispatch"
  L5_2 = A0_2
  L6_2 = "for removal in"
  L7_2 = A1_2
  L8_2 = "seconds"
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  L3_2 = SetTimeout
  L4_2 = A1_2 * 1000
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L1_3 = A0_2
    L0_3 = L1_1
    L0_3 = L0_3[L1_3]
    if not L0_3 then
      L1_3 = debugprint
      L2_3 = "QueueDispatchForRemoval: dispatch"
      L3_3 = A0_2
      L4_3 = "does not exit (not in dispatchIds)"
      L1_3(L2_3, L3_3, L4_3)
      return
    end
    L1_3 = L0_1
    L1_3 = L1_3[L0_3]
    L2_3 = A0_2
    L1_3 = L1_3[L2_3]
    if not L1_3 then
      L2_3 = debugprint
      L3_3 = "QueueDispatchForRemoval: dispatch"
      L4_3 = A0_2
      L5_3 = "does not exit (not in dispatches)"
      L2_3(L3_3, L4_3, L5_3)
      return
    end
    L2_3 = L1_3.endTime
    L3_3 = A2_2
    if L2_3 == L3_3 then
      L2_3 = L5_1
      L3_3 = A0_2
      L2_3(L3_3)
    else
      L2_3 = debugprint
      L3_3 = "QueueDispatchForRemoval: dispatch"
      L4_3 = A0_2
      L5_3 = "has been updated, not removing. Current end time:"
      L6_3 = L1_3.endTime
      L7_3 = "Original end time:"
      L8_3 = A2_2
      L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3)
    end
  end
  L3_2(L4_2, L5_2)
end
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = Config
  L1_2 = L1_2.DispatchEnabled
  if false == L1_2 then
    L1_2 = debugprint
    L2_2 = "AddDispatch: Config.DispatchEnabled is set to false"
    L1_2(L2_2)
    L1_2 = false
    return L1_2
  end
  L1_2 = L3_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  L1_2 = A0_2.time
  L2_2 = 3600
  if L1_2 > L2_2 then
    L1_2 = Config
    L1_2 = L1_2.LongDispatchWarning
    if false ~= L1_2 then
      L1_2 = infoprint
      L2_2 = "warning"
      L3_2 = FormatString
      L4_2 = "A dispatch with the name {name} was added with a time of {time} seconds. This is over an hour. Note that dispatch time is in seconds, not milliseconds. To disable this warning, set Config.LongDispatchWarning to false."
      L5_2 = {}
      L6_2 = A0_2.title
      L5_2.name = L6_2
      L6_2 = A0_2.time
      L5_2.time = L6_2
      L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L3_2(L4_2, L5_2)
      L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    end
  end
  L1_2 = L2_1
  L1_2 = L1_2()
  L2_2 = os
  L2_2 = L2_2.time
  L2_2 = L2_2()
  L3_2 = A0_2.time
  L2_2 = L2_2 + L3_2
  L3_2 = {}
  L3_2.id = L1_2
  L4_2 = A0_2.job
  L3_2.job = L4_2
  L4_2 = A0_2.priority
  L3_2.priority = L4_2
  L4_2 = A0_2.code
  L3_2.code = L4_2
  L4_2 = A0_2.title
  L3_2.title = L4_2
  L4_2 = A0_2.description
  L3_2.description = L4_2
  L4_2 = A0_2.image
  L3_2.image = L4_2
  L4_2 = os
  L4_2 = L4_2.time
  L4_2 = L4_2()
  L4_2 = L4_2 * 1000
  L3_2.timestamp = L4_2
  L4_2 = A0_2.fields
  L3_2.fields = L4_2
  L4_2 = A0_2.sound
  L3_2.sound = L4_2
  L4_2 = A0_2.location
  L3_2.location = L4_2
  L4_2 = A0_2.blip
  L3_2.blip = L4_2
  L3_2.endTime = L2_2
  L5_2 = A0_2.job
  L4_2 = L0_1
  L7_2 = A0_2.job
  L6_2 = L0_1
  L6_2 = L6_2[L7_2]
  if not L6_2 then
    L6_2 = {}
  end
  L4_2[L5_2] = L6_2
  L5_2 = A0_2.job
  L4_2 = L0_1
  L4_2 = L4_2[L5_2]
  L4_2[L1_2] = L3_2
  L4_2 = L1_1
  L5_2 = A0_2.job
  L4_2[L1_2] = L5_2
  L4_2 = TriggerClientEvent
  L5_2 = "tablet:addDispatch"
  L6_2 = -1
  L7_2 = L3_2
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L6_1
  L5_2 = L1_2
  L6_2 = A0_2.time
  L7_2 = L2_2
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = Log
  L5_2 = nil
  L6_2 = "Dispatch"
  L7_2 = "info"
  L8_2 = L
  L9_2 = "BACKEND.LOGS.NEW_DISPATCH"
  L10_2 = {}
  L11_2 = A0_2.title
  L10_2.title = L11_2
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = A0_2
  L10_2 = A0_2.image
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  return L1_2
end
AddDispatch = L7_1
L7_1 = exports
L8_1 = "AddDispatch"
L9_1 = AddDispatch
L7_1(L8_1, L9_1)
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = L1_1
  L2_2 = L2_2[A0_2]
  L3_2 = L2_2 or L3_2
  if L2_2 then
    L3_2 = L0_1
    L3_2 = L3_2[L2_2]
    L3_2 = L3_2[A0_2]
  end
  if not L3_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = L3_1
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  A1_2 = L4_2
  A1_2.job = L2_2
  L4_2 = os
  L4_2 = L4_2.time
  L4_2 = L4_2()
  L5_2 = A1_2.time
  L4_2 = L4_2 + L5_2
  L5_2 = L0_1
  L5_2 = L5_2[L2_2]
  L5_2[A0_2] = L3_2
  L5_2 = TriggerClientEvent
  L6_2 = "tablet:updateDispatch"
  L7_2 = -1
  L8_2 = L3_2
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = L6_1
  L6_2 = A0_2
  L7_2 = A1_2.time
  L8_2 = L4_2
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = true
  return L5_2
end
UpdateDispatch = L7_1
L7_1 = exports
L8_1 = "UpdateDispatch"
L9_1 = UpdateDispatch
L7_1(L8_1, L9_1)
L7_1 = RegisterNetEvent
L8_1 = "tablet:dispatch:respond"
function L9_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = source
  L2_2 = L1_1
  L2_2 = L2_2[A0_2]
  L3_2 = L2_2 or L3_2
  if L2_2 then
    L3_2 = L0_1
    L3_2 = L3_2[L2_2]
    L3_2 = L3_2[A0_2]
  end
  if not L3_2 then
    return
  end
  L4_2 = GetPlayerUnit
  L5_2 = L1_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L5_2 = GetCharacterName
    L6_2 = L1_2
    L5_2, L6_2 = L5_2(L6_2)
    L7_2 = L5_2
    L8_2 = " "
    L9_2 = L6_2
    L7_2 = L7_2 .. L8_2 .. L9_2
    L4_2 = L7_2
  end
  if "police" == L2_2 then
    L5_2 = HasPermission
    L6_2 = L1_2
    L7_2 = "Police"
    L8_2 = "dispatch"
    L9_2 = "view"
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    if not L5_2 then
      L5_2 = debugprint
      L6_2 = "Player does not have permission to view dispatches (police)"
      L7_2 = L1_2
      return L5_2(L6_2, L7_2)
    end
  elseif "ambulance" == L2_2 then
    L5_2 = HasPermission
    L6_2 = L1_2
    L7_2 = "Ambulance"
    L8_2 = "dispatch"
    L9_2 = "view"
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    if not L5_2 then
      L5_2 = debugprint
      L6_2 = "Player does not have permission to view dispatches (ambulance)"
      L7_2 = L1_2
      return L5_2(L6_2, L7_2)
    end
  end
  L5_2 = L3_2.responders
  if not L5_2 then
    L5_2 = {}
    L3_2.responders = L5_2
  end
  L5_2 = table
  L5_2 = L5_2.contains
  L6_2 = L3_2.responders
  L7_2 = L4_2
  L5_2 = L5_2(L6_2, L7_2)
  if L5_2 then
    L5_2 = debugprint
    L6_2 = "Player/unit has already responded to this dispatch"
    L7_2 = L1_2
    return L5_2(L6_2, L7_2)
  end
  L5_2 = L3_2.responders
  L6_2 = L3_2.responders
  L6_2 = #L6_2
  L6_2 = L6_2 + 1
  L5_2[L6_2] = L4_2
  L5_2 = L0_1
  L5_2 = L5_2[L2_2]
  L5_2[A0_2] = L3_2
  L5_2 = TriggerClientEvent
  L6_2 = "tablet:updateDispatch"
  L7_2 = -1
  L8_2 = L3_2
  L5_2(L6_2, L7_2, L8_2)
end
L7_1(L8_1, L9_1)
L7_1 = exports
L8_1 = "GetDispatch"
function L9_1(A0_2)
  local L1_2, L2_2
  L1_2 = L1_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    return
  end
  L2_2 = L0_1
  L2_2 = L2_2[L1_2]
  L2_2 = L2_2[A0_2]
  return L2_2
end
L7_1(L8_1, L9_1)
L7_1 = exports
L8_1 = "RemoveDispatch"
L9_1 = L5_1
L7_1(L8_1, L9_1)
L7_1 = RegisterNetEvent
L8_1 = "lb-tablet:addDispatch"
function L9_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = source
  L2_2 = Config
  L2_2 = L2_2.AllowClientDispatch
  if not L2_2 then
    L2_2 = infoprint
    L3_2 = "error"
    L4_2 = GetPlayerName
    L5_2 = L1_2
    L4_2 = L4_2(L5_2)
    L5_2 = " | "
    L6_2 = L1_2
    L7_2 = " tried to add a dispatch from the client, but Config.AllowClientDispatch is set to false"
    L4_2 = L4_2 .. L5_2 .. L6_2 .. L7_2
    L2_2(L3_2, L4_2)
    return
  end
  L2_2 = AddDispatch
  L3_2 = A0_2
  L2_2(L3_2)
end
L7_1(L8_1, L9_1)
L7_1 = BaseCallback
L8_1 = "deleteDispatch"
function L9_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = L1_1
  L3_2 = L3_2[A2_2]
  if not L3_2 then
    L4_2 = debugprint
    L5_2 = "deleteDispatch: no dispatchJob (invalid dispatch?)"
    L6_2 = A2_2
    L4_2(L5_2, L6_2)
    L4_2 = false
    return L4_2
  end
  L5_2 = L3_2
  L4_2 = L3_2.gsub
  L6_2 = "^%l"
  L7_2 = string
  L7_2 = L7_2.upper
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = HasPermission
  L6_2 = A0_2
  L7_2 = L4_2
  L8_2 = "dispatch"
  L9_2 = "delete"
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  if not L5_2 then
    L5_2 = debugprint
    L6_2 = A0_2
    L7_2 = "does not have permission to delete dispatches"
    L5_2(L6_2, L7_2)
    L5_2 = false
    return L5_2
  end
  L5_2 = L5_1
  L6_2 = A2_2
  return L5_2(L6_2)
end
L7_1(L8_1, L9_1)
L7_1 = BaseCallback
L8_1 = "clearDispatches"
function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = nil
  L3_2 = HasPermission
  L4_2 = A0_2
  L5_2 = "Police"
  L6_2 = "dispatch"
  L7_2 = "delete"
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  if L3_2 then
    L2_2 = "police"
  else
    L3_2 = HasPermission
    L4_2 = A0_2
    L5_2 = "Ambulance"
    L6_2 = "dispatch"
    L7_2 = "delete"
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
    if L3_2 then
      L2_2 = "ambulance"
    else
      L3_2 = debugprint
      L4_2 = A0_2
      L5_2 = "does not have permission to clear dispatches"
      L3_2(L4_2, L5_2)
      L3_2 = false
      return L3_2
    end
  end
  L3_2 = L4_1
  L4_2 = L2_2
  L3_2(L4_2)
  L3_2 = true
  return L3_2
end
L7_1(L8_1, L9_1)
