local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = {}
L1_1 = Config
L1_1 = L1_1.TabletModel
if not L1_1 then
  L1_1 = -933868115
end
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = GetGameTimer
  L1_2 = L1_2()
  L1_2 = L1_2 + 5000
  while true do
    L2_2 = DoesEntityExist
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      break
    end
    L2_2 = GetGameTimer
    L2_2 = L2_2()
    if not (L1_2 > L2_2) then
      break
    end
    L2_2 = Wait
    L3_2 = 0
    L2_2(L3_2)
  end
  L2_2 = DoesEntityExist
  L3_2 = A0_2
  return L2_2(L3_2)
end
WaitForEntity = L2_1
L2_1 = BaseCallback
L3_1 = "spawnTablet"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = Config
  L2_2 = L2_2.ServerSideSpawn
  if not L2_2 then
    L2_2 = infoprint
    L3_2 = "error"
    L4_2 = "Possible cheater."
    L5_2 = A0_2
    L6_2 = " | "
    L7_2 = GetPlayerName
    L8_2 = A0_2
    L7_2 = L7_2(L8_2)
    L5_2 = L5_2 .. L6_2 .. L7_2
    L6_2 = "tried to spawn a tablet, but Config.ServerSideSpawn is disabled."
    return L2_2(L3_2, L4_2, L5_2, L6_2)
  else
    L2_2 = L0_1
    L2_2 = L2_2[A1_2]
    if L2_2 then
      L2_2 = L0_1
      L2_2 = L2_2[A1_2]
      return L2_2
    end
  end
  L2_2 = GetEntityCoords
  L3_2 = GetPlayerPed
  L4_2 = A0_2
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L3_2(L4_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  L3_2 = vector3
  L4_2 = 0.0
  L5_2 = 0.0
  L6_2 = 5.0
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L2_2 = L2_2 - L3_2
  L3_2 = CreateObject
  L4_2 = L1_1
  L5_2 = L2_2.x
  L6_2 = L2_2.y
  L7_2 = L2_2.z
  L8_2 = true
  L9_2 = true
  L10_2 = false
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  L4_2 = WaitForEntity
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = infoprint
    L5_2 = "warning"
    L6_2 = "Failed to create the tablet object (timed out)."
    return L4_2(L5_2, L6_2)
  end
  L4_2 = NetworkGetNetworkIdFromEntity
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = L0_1
  L5_2[A1_2] = L4_2
  L5_2 = SetEntityIgnoreRequestControlFilter
  L6_2 = L3_2
  L7_2 = true
  L5_2(L6_2, L7_2)
  return L4_2
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "tablet:failedControl"
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = source
  L1_2 = GetEquippedTablet
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  L2_2 = L0_1
  L2_2 = L2_2[L1_2]
  L3_2 = Config
  L3_2 = L3_2.ServerSideSpawn
  if not (L3_2 and L1_2) or not L2_2 then
    return
  end
  L3_2 = DeleteEntity
  L4_2 = NetworkGetEntityFromNetworkId
  L5_2 = L2_2
  L4_2, L5_2 = L4_2(L5_2)
  L3_2(L4_2, L5_2)
  L3_2 = L0_1
  L3_2[L1_2] = nil
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "tablet:setTabletObject"
function L4_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = source
  L2_2 = GetEquippedTablet
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = Config
  L3_2 = L3_2.ServerSideSpawn
  if L3_2 or not L2_2 then
    return
  end
  L3_2 = L0_1
  L3_2[L2_2] = A0_2
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "tablet:deleteTabletObject"
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = GetEquippedTablet
  L1_2 = source
  L0_2 = L0_2(L1_2)
  L1_2 = L0_2 or L1_2
  if L0_2 then
    L1_2 = L0_1
    L1_2 = L1_2[L0_2]
  end
  if L0_2 and L1_2 then
    L2_2 = Config
    L2_2 = L2_2.ServerSideSpawn
    if L2_2 then
      L2_2 = DeleteEntity
      L3_2 = NetworkGetEntityFromNetworkId
      L4_2 = L1_2
      L3_2, L4_2 = L3_2(L4_2)
      L2_2(L3_2, L4_2)
      L2_2 = L0_1
      L2_2[L0_2] = nil
    end
  end
end
L2_1(L3_1, L4_1)
L2_1 = OnTabletDisconnect
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = L0_1
  L2_2 = L2_2[A0_2]
  if L2_2 then
    L3_2 = debugprint
    L4_2 = "Deleting %s (%i)'s tablet entity"
    L5_2 = L4_2
    L4_2 = L4_2.format
    L6_2 = GetPlayerName
    L7_2 = A1_2
    L6_2 = L6_2(L7_2)
    L7_2 = A1_2
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2, L6_2, L7_2)
    L3_2(L4_2, L5_2, L6_2, L7_2)
    L3_2 = DeleteEntity
    L4_2 = NetworkGetEntityFromNetworkId
    L5_2 = L2_2
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    L3_2(L4_2, L5_2, L6_2, L7_2)
    L3_2 = L0_1
    L3_2[A0_2] = nil
  end
end
L2_1(L3_1)
