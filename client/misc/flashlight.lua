local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = false
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L1_2 = GetPedBoneCoords
  L2_2 = A0_2
  L3_2 = 28422
  L4_2 = 0.05
  L5_2 = 0.01
  L6_2 = -0.04
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  L2_2 = GetEntityForwardVector
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = DrawSpotLightWithShadow
  L4_2 = L1_2.x
  L5_2 = L1_2.y
  L6_2 = L1_2.z
  L7_2 = L2_2.x
  L8_2 = L2_2.y
  L9_2 = L2_2.z
  L10_2 = 255
  L11_2 = 255
  L12_2 = 255
  L13_2 = 15.0
  L14_2 = 3.0
  L15_2 = 0.0
  L16_2 = 50.0
  L17_2 = 100.0
  L18_2 = 1
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L3_2 = DrawSpotLightWithShadow
  L4_2 = L1_2.x
  L5_2 = L1_2.y
  L6_2 = L1_2.z
  L7_2 = L2_2.x
  L8_2 = L2_2.y
  L9_2 = L2_2.z
  L10_2 = 255
  L11_2 = 255
  L12_2 = 255
  L13_2 = 30.0
  L14_2 = 10.0
  L15_2 = 0.0
  L16_2 = 20.0
  L17_2 = 25.0
  L18_2 = 1
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
end
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  A0_2 = true == A0_2
  L1_2 = L0_1
  if L1_2 == A0_2 then
    L1_2 = debugprint
    L2_2 = "toggleFlashlight: flashlight is already"
    L3_2 = A0_2
    L1_2(L2_2, L3_2)
    return
  end
  L0_1 = A0_2
  L1_2 = TriggerServerEvent
  L2_2 = "tablet:toggleFlashlight"
  L3_2 = L0_1
  L1_2(L2_2, L3_2)
  L1_2 = L0_1
  if not L1_2 then
    return
  end
  L1_2 = Citizen
  L1_2 = L1_2.CreateThreadNow
  function L2_2()
    local L0_3, L1_3, L2_3
    L0_3 = PlayerPedId
    L0_3 = L0_3()
    while true do
      L1_3 = L0_1
      if not L1_3 then
        break
      end
      L1_3 = L1_1
      L2_3 = L0_3
      L1_3(L2_3)
      L1_3 = Wait
      L2_3 = 0
      L1_3(L2_3)
    end
  end
  L1_2(L2_2)
end
L3_1 = ReactCallback
L4_1 = "toggleFlashlight"
function L5_1(A0_2)
  local L1_2, L2_2
  L1_2 = L2_1
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = Wait
  L2_2 = 100
  L1_2(L2_2)
end
L6_1 = "ok"
L3_1(L4_1, L5_1, L6_1)
L3_1 = exports
L4_1 = "ToggleFlashlight"
function L5_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L2_1
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = SendReactMessage
  L2_2 = "toggleFlashlight"
  L3_2 = L0_1
  L1_2(L2_2, L3_2)
end
L3_1(L4_1, L5_1)
L3_1 = Config
L3_1 = L3_1.SyncFlashlight
if not L3_1 then
  return
end
L3_1 = {}
L4_1 = nil
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = 1
  L1_2 = L3_1
  L1_2 = #L1_2
  L2_2 = 1
  for L3_2 = L0_2, L1_2, L2_2 do
    L4_2 = L1_1
    L5_2 = L3_1
    L5_2 = L5_2[L3_2]
    L4_2(L5_2)
  end
end
function L6_1()
  local L0_2, L1_2, L2_2
  L0_2 = L3_1
  L0_2 = #L0_2
  L0_2 = L0_2 > 0
  if L0_2 then
    L1_2 = L4_1
    if not L1_2 then
      L1_2 = SetInterval
      L2_2 = L5_1
      L1_2 = L1_2(L2_2)
      L4_1 = L1_2
  end
  elseif not L0_2 then
    L1_2 = L4_1
    if L1_2 then
      L1_2 = ClearInterval
      L2_2 = L4_1
      L1_2 = L1_2(L2_2)
      L4_1 = L1_2
    end
  end
end
L7_1 = AddStateBagChangeHandler
L8_1 = "lbTabletFlashlight"
L9_1 = nil
function L10_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = GetPlayerFromStateBagName
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  if L5_2 and 0 ~= L5_2 then
    L6_2 = PlayerId
    L6_2 = L6_2()
    if L5_2 ~= L6_2 then
      goto lbl_13
    end
  end
  do return end
  ::lbl_13::
  L6_2 = GetPlayerPed
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = GetEntityCoords
  L8_2 = PlayerPedId
  L8_2, L9_2, L10_2, L11_2 = L8_2()
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
  L8_2 = GetEntityCoords
  L9_2 = L6_2
  L8_2 = L8_2(L9_2)
  L7_2 = L7_2 - L8_2
  L7_2 = #L7_2
  if L7_2 > 30.0 then
    return
  end
  L7_2 = contains
  L8_2 = L3_1
  L9_2 = L6_2
  L7_2, L8_2 = L7_2(L8_2, L9_2)
  if not L7_2 and A2_2 then
    L9_2 = L3_1
    L9_2 = #L9_2
    L10_2 = L9_2 + 1
    L9_2 = L3_1
    L9_2[L10_2] = L6_2
  elseif L7_2 and not A2_2 then
    L9_2 = table
    L9_2 = L9_2.remove
    L10_2 = L3_1
    L11_2 = L8_2
    L9_2(L10_2, L11_2)
  end
  L9_2 = L6_1
  L9_2()
end
L7_1(L8_1, L9_1, L10_1)
L7_1 = CreateThread
function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  while true do
    L0_2 = L3_1
    L0_2 = #L0_2
    if L0_2 > 0 then
      L0_2 = table
      L0_2 = L0_2.wipe
      L1_2 = L3_1
      L0_2(L1_2)
    end
    L0_2 = GetEntityCoords
    L1_2 = PlayerPedId
    L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L1_2()
    L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
    L1_2 = GetNearbyPlayers
    L1_2 = L1_2()
    L2_2 = 1
    L3_2 = #L1_2
    L4_2 = 1
    for L5_2 = L2_2, L3_2, L4_2 do
      L6_2 = L1_2[L5_2]
      L7_2 = Player
      L8_2 = L6_2.source
      L7_2 = L7_2(L8_2)
      L7_2 = L7_2.state
      L8_2 = L7_2.lbTabletFlashlight
      if L8_2 then
        L8_2 = L7_2.lbTabletOpen
        if L8_2 then
          L8_2 = GetEntityCoords
          L9_2 = L6_2.ped
          L8_2 = L8_2(L9_2)
          L8_2 = L0_2 - L8_2
          L8_2 = #L8_2
          if L8_2 <= 30.0 then
            L8_2 = L3_1
            L8_2 = #L8_2
            L9_2 = L8_2 + 1
            L8_2 = L3_1
            L10_2 = L6_2.ped
            L8_2[L9_2] = L10_2
          end
        end
      end
    end
    L2_2 = L6_1
    L2_2()
    L2_2 = Wait
    L3_2 = 1000
    L2_2(L3_2)
  end
end
L7_1(L8_1)
