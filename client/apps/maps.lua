local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = PlayerPedId
L0_1 = L0_1()
L1_1 = vector3
L2_1 = 0
L3_1 = 0
L4_1 = 0
L1_1 = L1_1(L2_1, L3_1, L4_1)
L2_1 = 0.0
L3_1 = nil
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = TabletOpen
  if not L0_2 then
    return
  end
  L0_2 = GetEntityCoords
  L1_2 = L0_1
  L0_2 = L0_2(L1_2)
  L1_2 = GetEntityHeading
  L2_2 = L0_1
  L1_2 = L1_2(L2_2)
  L2_2 = L1_1
  L2_2 = L2_2 - L0_2
  L2_2 = #L2_2
  if L2_2 < 1.0 then
    L2_2 = math
    L2_2 = L2_2.abs
    L3_2 = L2_1
    L3_2 = L3_2 - L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 < 5.0 then
      return
    end
  end
  L1_1 = L0_2
  L2_1 = L1_2
  L2_2 = SendReactMessage
  L3_2 = "maps:updateCoords"
  L4_2 = {}
  L5_2 = math
  L5_2 = L5_2.floor
  L6_2 = L0_2.x
  L6_2 = L6_2 + 0.5
  L5_2 = L5_2(L6_2)
  L4_2.x = L5_2
  L5_2 = math
  L5_2 = L5_2.floor
  L6_2 = L0_2.y
  L6_2 = L6_2 + 0.5
  L5_2 = L5_2(L6_2)
  L4_2.y = L5_2
  L5_2 = math
  L5_2 = L5_2.floor
  L6_2 = L1_2 + 0.5
  L5_2 = L5_2(L6_2)
  L4_2.heading = L5_2
  L2_2(L3_2, L4_2)
end
L5_1 = ReactCallback
L6_1 = "Maps"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = A0_2.action
  if "toggleUpdateCoords" == L1_2 then
    L2_2 = A0_2.toggle
    if L2_2 then
      L2_2 = L3_1
      if not L2_2 then
        L2_2 = PlayerPedId
        L2_2 = L2_2()
        L0_1 = L2_2
        L2_2 = GetEntityCoords
        L3_2 = L0_1
        L2_2 = L2_2(L3_2)
        L1_1 = L2_2
        L2_2 = GetEntityHeading
        L3_2 = L0_1
        L2_2 = L2_2(L3_2)
        L2_1 = L2_2
        L2_2 = SetInterval
        L3_2 = L4_1
        L4_2 = 250
        L2_2 = L2_2(L3_2, L4_2)
        L3_1 = L2_2
        L2_2 = SendReactMessage
        L3_2 = "maps:updateCoords"
        L4_2 = {}
        L5_2 = L1_1.x
        L4_2.x = L5_2
        L5_2 = L1_1.y
        L4_2.y = L5_2
        L5_2 = L2_1
        L4_2.heading = L5_2
        L2_2(L3_2, L4_2)
    end
    else
      L2_2 = A0_2.toggle
      if not L2_2 then
        L2_2 = L3_1
        if L2_2 then
          L2_2 = ClearInterval
          L3_2 = L3_1
          L2_2 = L2_2(L3_2)
          L3_1 = L2_2
        end
      end
    end
    L2_2 = "ok"
    return L2_2
  elseif "getCurrentLocation" == L1_2 then
    L2_2 = GetEntityCoords
    L3_2 = PlayerPedId
    L3_2, L4_2, L5_2, L6_2, L7_2 = L3_2()
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
    L3_2 = {}
    L4_2 = L2_2.x
    L3_2.x = L4_2
    L4_2 = L2_2.y
    L3_2.y = L4_2
    return L3_2
  elseif "setWaypoint" == L1_2 then
    L2_2 = A0_2.coords
    L3_2 = tonumber
    L4_2 = L2_2.x
    L3_2 = L3_2(L4_2)
    L4_2 = tonumber
    L5_2 = L2_2.y
    L4_2 = L4_2(L5_2)
    if L3_2 and L4_2 then
      L5_2 = SetNewWaypoint
      L6_2 = L3_2 / 1
      L7_2 = L4_2 / 1
      L5_2(L6_2, L7_2)
    end
    L5_2 = "ok"
    return L5_2
  end
end
L5_1(L6_1, L7_1)
