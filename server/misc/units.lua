local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
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
GetUnits = L2_1
L2_1 = exports
L3_1 = "GetUnits"
L4_1 = GetUnits
L2_1(L3_1, L4_1)
function L2_1(A0_2)
  local L1_2
  L1_2 = L1_1
  L1_2 = L1_2[A0_2]
  if L1_2 then
    L1_2 = L1_2.unit
  end
  return L1_2
end
GetPlayerUnit = L2_1
L2_1 = exports
L3_1 = "GetPlayerUnit"
L4_1 = GetPlayerUnit
L2_1(L3_1, L4_1)
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = L0_1
  L3_2 = L3_2[A1_2]
  if not L3_2 then
    L3_2 = debugprint
    L4_2 = "No units for job"
    L5_2 = A1_2
    L3_2(L4_2, L5_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = L0_1
  L3_2 = L3_2[A1_2]
  L3_2 = L3_2[A2_2]
  if not L3_2 then
    L3_2 = debugprint
    L4_2 = "No unit for job"
    L5_2 = A1_2
    L6_2 = A2_2
    L3_2(L4_2, L5_2, L6_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = L1_1
  L3_2 = L3_2[A0_2]
  L4_2 = L1_1
  L5_2 = {}
  L5_2.unit = A2_2
  L5_2.job = A1_2
  L4_2[A0_2] = L5_2
  L4_2 = TriggerClientEvent
  L5_2 = "tablet:setPlayerUnit"
  L6_2 = -1
  L7_2 = A1_2
  L8_2 = {}
  L8_2.unit = A2_2
  L8_2.source = A0_2
  if L3_2 then
    L9_2 = L3_2.unit
    if L9_2 then
      goto lbl_45
    end
  end
  L9_2 = nil
  ::lbl_45::
  L8_2.oldUnit = L9_2
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = TriggerEvent
  L5_2 = "lb-tablet:playerUnitUpdated"
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = A2_2
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = true
  return L4_2
end
SetPlayerUnit = L2_1
L2_1 = exports
L3_1 = "SetPlayerUnit"
L4_1 = SetPlayerUnit
L2_1(L3_1, L4_1)
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = L1_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    return
  end
  L2_2 = TriggerClientEvent
  L3_2 = "tablet:setPlayerUnit"
  L4_2 = -1
  L5_2 = L1_2.job
  L6_2 = {}
  L6_2.unit = nil
  L6_2.source = A0_2
  L7_2 = L1_2.unit
  L6_2.oldUnit = L7_2
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = TriggerEvent
  L3_2 = "lb-tablet:playerUnitUpdated"
  L4_2 = A0_2
  L5_2 = L1_2.job
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = L1_1
  L2_2[A0_2] = nil
end
ResetPlayerUnit = L2_1
L2_1 = exports
L3_1 = "ResetPlayerUnit"
L4_1 = ResetPlayerUnit
L2_1(L3_1, L4_1)
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  if not L3_2 then
    L3_2 = {}
  end
  L4_2 = L3_2[A1_2]
  if L4_2 then
    L4_2 = debugprint
    L5_2 = "Unit already exists"
    L6_2 = A0_2
    L7_2 = A1_2
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = false
    return L4_2
  end
  if not A2_2 then
    A2_2 = "available"
  end
  L4_2 = {}
  L4_2.name = A1_2
  L4_2.status = A2_2
  L3_2[A1_2] = L4_2
  L4_2 = L0_1
  L4_2[A0_2] = L3_2
  L4_2 = TriggerClientEvent
  L5_2 = "tablet:unitCreated"
  L6_2 = -1
  L7_2 = A0_2
  L8_2 = A1_2
  L9_2 = A2_2
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L4_2 = TriggerEvent
  L5_2 = "lb-tablet:unitCreated"
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = A2_2
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = true
  return L4_2
end
CreateUnit = L2_1
L2_1 = exports
L3_1 = "CreateUnit"
L4_1 = CreateUnit
L2_1(L3_1, L4_1)
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = L0_1
  L2_2 = L2_2[A0_2]
  if not L2_2 then
    L2_2 = debugprint
    L3_2 = "No units for job"
    L4_2 = A0_2
    L2_2(L3_2, L4_2)
    L2_2 = false
    return L2_2
  end
  L2_2 = L0_1
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2[A1_2]
  if not L2_2 then
    L2_2 = true
    return L2_2
  end
  L2_2 = pairs
  L3_2 = L1_1
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    if L7_2 == A1_2 then
      L8_2 = ResetPlayerUnit
      L9_2 = L6_2
      L8_2(L9_2)
    end
  end
  L2_2 = L0_1
  L2_2 = L2_2[A0_2]
  L2_2[A1_2] = nil
  L2_2 = pairs
  L3_2 = L1_1
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.job
    if L8_2 == A0_2 then
      L8_2 = L7_2.unit
      if L8_2 == A1_2 then
        L8_2 = L1_1
        L8_2 = L8_2[L6_2]
        L8_2.unit = A1_2
      end
    end
  end
  L2_2 = TriggerClientEvent
  L3_2 = "tablet:unitRemoved"
  L4_2 = -1
  L5_2 = A0_2
  L6_2 = A1_2
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = TriggerEvent
  L3_2 = "lb-tablet:unitRemoved"
  L4_2 = A0_2
  L5_2 = A1_2
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = true
  return L2_2
end
RemoveUnit = L2_1
L2_1 = exports
L3_1 = "RemoveUnit"
L4_1 = RemoveUnit
L2_1(L3_1, L4_1)
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  if not L3_2 then
    L3_2 = debugprint
    L4_2 = "No units for job"
    L5_2 = A0_2
    L3_2(L4_2, L5_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  L3_2 = L3_2[A1_2]
  if not L3_2 then
    L3_2 = debugprint
    L4_2 = "No unit for job"
    L5_2 = A0_2
    L6_2 = A1_2
    L3_2(L4_2, L5_2, L6_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  L3_2 = L3_2[A1_2]
  L3_2.status = A2_2
  L3_2 = TriggerClientEvent
  L4_2 = "tablet:unitUpdated"
  L5_2 = -1
  L6_2 = A0_2
  L7_2 = {}
  L7_2.unit = A1_2
  L7_2.status = A2_2
  L3_2(L4_2, L5_2, L6_2, L7_2)
  L3_2 = TriggerEvent
  L4_2 = "lb-tablet:unitStatusUpdated"
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  L3_2(L4_2, L5_2, L6_2, L7_2)
  L3_2 = true
  return L3_2
end
SetUnitStatus = L2_1
L2_1 = exports
L3_1 = "SetUnitStatus"
L4_1 = SetUnitStatus
L2_1(L3_1, L4_1)
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  if not L3_2 then
    L3_2 = debugprint
    L4_2 = "No units for job"
    L5_2 = A0_2
    L3_2(L4_2, L5_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  L3_2 = L3_2[A1_2]
  if not L3_2 then
    L3_2 = debugprint
    L4_2 = "No unit for job"
    L5_2 = A0_2
    L6_2 = A1_2
    L3_2(L4_2, L5_2, L6_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  L3_2 = L3_2[A2_2]
  if L3_2 then
    L3_2 = debugprint
    L4_2 = "Unit already exists"
    L5_2 = A0_2
    L6_2 = A2_2
    L3_2(L4_2, L5_2, L6_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  L4_2 = L0_1
  L4_2 = L4_2[A0_2]
  L4_2 = L4_2[A1_2]
  L3_2[A2_2] = L4_2
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  L3_2 = L3_2[A2_2]
  L3_2.name = A2_2
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  L3_2[A1_2] = nil
  L3_2 = pairs
  L4_2 = L1_1
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L8_2.job
    if L9_2 == A0_2 then
      L9_2 = L8_2.unit
      if L9_2 == A1_2 then
        L9_2 = L1_1
        L9_2 = L9_2[L7_2]
        L9_2.unit = A2_2
      end
    end
  end
  L3_2 = TriggerClientEvent
  L4_2 = "tablet:unitUpdated"
  L5_2 = -1
  L6_2 = A0_2
  L7_2 = {}
  L7_2.unit = A1_2
  L7_2.newName = A2_2
  L3_2(L4_2, L5_2, L6_2, L7_2)
  L3_2 = TriggerEvent
  L4_2 = "lb-tablet:unitRenamed"
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  L3_2(L4_2, L5_2, L6_2, L7_2)
  L3_2 = pairs
  L4_2 = L1_1
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    if L8_2 == A1_2 then
      L9_2 = L1_1
      L9_2 = L9_2[L7_2]
      L9_2.unit = A2_2
    end
  end
  L3_2 = true
  return L3_2
end
RenameUnit = L2_1
L2_1 = exports
L3_1 = "RenameUnit"
L4_1 = RenameUnit
L2_1(L3_1, L4_1)
L2_1 = OnPlayerDisconnect
function L3_1(A0_2)
  local L1_2
  L1_2 = L1_1
  L1_2[A0_2] = nil
end
L2_1(L3_1)
L2_1 = AddEventHandler
L3_1 = "lb-tablet:jobUpdated"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L1_1
  L2_2 = L2_2[A0_2]
  if not L2_2 then
    return
  end
  L3_2 = L2_2.job
  if "police" == L3_2 then
    L3_2 = Config
    L3_2 = L3_2.Police
    L3_2 = L3_2.Permissions
    L3_2 = L3_2[A1_2]
    if not L3_2 then
      L3_2 = ResetPlayerUnit
      L4_2 = A0_2
      L3_2(L4_2)
    end
  end
end
L2_1(L3_1, L4_1)
L2_1 = Config
L2_1 = L2_1.Police
if L2_1 then
  L2_1 = Config
  L2_1 = L2_1.Police
  L2_1 = L2_1.DefaultUnits
  if L2_1 then
    L2_1 = 1
    L3_1 = Config
    L3_1 = L3_1.Police
    L3_1 = L3_1.DefaultUnits
    L3_1 = #L3_1
    L4_1 = 1
    for L5_1 = L2_1, L3_1, L4_1 do
      L6_1 = Config
      L6_1 = L6_1.Police
      L6_1 = L6_1.DefaultUnits
      L6_1 = L6_1[L5_1]
      L7_1 = CreateUnit
      L8_1 = "police"
      L9_1 = L6_1.name
      L10_1 = L6_1.status
      L7_1(L8_1, L9_1, L10_1)
    end
  end
end
L2_1 = Config
L2_1 = L2_1.Ambulance
if L2_1 then
  L2_1 = Config
  L2_1 = L2_1.Ambulance
  L2_1 = L2_1.DefaultUnits
  if L2_1 then
    L2_1 = 1
    L3_1 = Config
    L3_1 = L3_1.Ambulance
    L3_1 = L3_1.DefaultUnits
    L3_1 = #L3_1
    L4_1 = 1
    for L5_1 = L2_1, L3_1, L4_1 do
      L6_1 = Config
      L6_1 = L6_1.Ambulance
      L6_1 = L6_1.DefaultUnits
      L6_1 = L6_1[L5_1]
      L7_1 = CreateUnit
      L8_1 = "ambulance"
      L9_1 = L6_1.name
      L10_1 = L6_1.status
      L7_1(L8_1, L9_1, L10_1)
    end
  end
end
