local L0_1, L1_1, L2_1, L3_1
L0_1 = BaseCallback
L1_1 = "airShare:share"
function L2_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2
  L5_2 = Player
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  L5_2 = L5_2.state
  L5_2 = L5_2.lbTabletName
  if not L5_2 then
    L6_2 = debugprint
    L7_2 = "No sender name"
    L6_2(L7_2)
    L6_2 = false
    return L6_2
  end
  L6_2 = {}
  L6_2.name = L5_2
  L6_2.source = A0_2
  L6_2.device = "tablet"
  A4_2.sender = L6_2
  if "tablet" == A3_2 then
    L6_2 = GetResourceState
    L7_2 = "lb-tablet"
    L6_2 = L6_2(L7_2)
    if "started" == L6_2 then
      L6_2 = Player
      L7_2 = A2_2
      L6_2 = L6_2(L7_2)
      L6_2 = L6_2.state
      L6_2 = L6_2.lbTabletOpen
      if L6_2 then
        goto lbl_35
      end
    end
    L6_2 = false
    do return L6_2 end
    ::lbl_35::
    L6_2 = TriggerClientEvent
    L7_2 = "tablet:airShare:received"
    L8_2 = A2_2
    L9_2 = A4_2
    L6_2(L7_2, L8_2, L9_2)
  elseif "phone" == A3_2 then
    L6_2 = Player
    L7_2 = A2_2
    L6_2 = L6_2(L7_2)
    L6_2 = L6_2.state
    L6_2 = L6_2.phoneOpen
    if not L6_2 then
      L6_2 = false
      return L6_2
    end
    L6_2 = TriggerClientEvent
    L7_2 = "phone:airShare:received"
    L8_2 = A2_2
    L9_2 = A4_2
    L6_2(L7_2, L8_2, L9_2)
  end
  L6_2 = true
  return L6_2
end
L3_1 = false
L0_1(L1_1, L2_1, L3_1)
L0_1 = RegisterNetEvent
L1_1 = "tablet:airShare:interacted"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = source
  L4_2 = type
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if "number" == L4_2 then
    L4_2 = type
    L5_2 = A2_2
    L4_2 = L4_2(L5_2)
    if "boolean" == L4_2 then
      if "tablet" == A1_2 then
        L4_2 = TriggerClientEvent
        L5_2 = "tablet:airShare:interacted"
        L6_2 = A0_2
        L7_2 = L3_2
        L8_2 = A2_2
        L4_2(L5_2, L6_2, L7_2, L8_2)
      elseif "phone" == A1_2 then
        L4_2 = TriggerClientEvent
        L5_2 = "phone:airShare:interacted"
        L6_2 = A0_2
        L7_2 = L3_2
        L8_2 = A2_2
        L4_2(L5_2, L6_2, L7_2, L8_2)
      end
    end
  end
end
L0_1(L1_1, L2_1)
