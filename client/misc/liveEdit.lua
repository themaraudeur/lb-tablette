local L0_1, L1_1, L2_1
L0_1 = ReactCallback
L1_1 = "LiveEdit"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = A0_2.action
  L2_2 = A0_2.docId
  if "getDocument" == L1_2 then
    L3_2 = AwaitCallback
    L4_2 = "liveEdit:getDocument"
    L5_2 = L2_2
    L6_2 = A0_2.clientId
    return L3_2(L4_2, L5_2, L6_2)
  elseif "leaveDocument" == L1_2 then
    L3_2 = TriggerServerEvent
    L4_2 = "liveEdit:leaveDocument"
    L3_2(L4_2)
  elseif "refreshAwareness" == L1_2 then
    L3_2 = TriggerServerEvent
    L4_2 = "liveEdit:refreshAwareness"
    L5_2 = L2_2
    L3_2(L4_2, L5_2)
  elseif "crdtUpdate" == L1_2 then
    L3_2 = AwaitCallback
    L4_2 = "liveEdit:crdtUpdate"
    L5_2 = L2_2
    L6_2 = A0_2.update
    return L3_2(L4_2, L5_2, L6_2)
  elseif "awarenessUpdate" == L1_2 then
    L3_2 = TriggerServerEvent
    L4_2 = "liveEdit:updateAwareness"
    L5_2 = L2_2
    L6_2 = A0_2.originClientId
    L7_2 = A0_2.state
    L3_2(L4_2, L5_2, L6_2, L7_2)
    L3_2 = "ok"
    return L3_2
  elseif "saveFullDocState" == L1_2 then
    L3_2 = TriggerServerEvent
    L4_2 = "liveEdit:saveFullDocState"
    L5_2 = L2_2
    L6_2 = A0_2.fullState
    L3_2(L4_2, L5_2, L6_2)
    L3_2 = "ok"
    return L3_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "liveEdit:crdtBroadcast"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = SendReactMessage
  L3_2 = "liveEdit:crdtBroadcast"
  L4_2 = {}
  L4_2.docId = A0_2
  L4_2.update = A1_2
  L2_2(L3_2, L4_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "liveEdit:awarenessUpdate"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = debugprint
  L4_2 = "awarenessUpdate"
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  L3_2(L4_2, L5_2, L6_2, L7_2)
  L3_2 = SendReactMessage
  L4_2 = "liveEdit:awarenessUpdate"
  L5_2 = {}
  L5_2.docId = A0_2
  L5_2.clientId = A1_2
  L5_2.state = A2_2
  L3_2(L4_2, L5_2)
end
L0_1(L1_1, L2_1)
