local L0_1, L1_1, L2_1
L0_1 = RegisterNetEvent
L1_1 = "tablet:setPlayerUnit"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = SendReactMessage
  L3_2 = "setUserUnit"
  L4_2 = {}
  L4_2.job = A0_2
  L5_2 = A1_2.unit
  L4_2.unit = L5_2
  L5_2 = A1_2.source
  L4_2.source = L5_2
  L2_2(L3_2, L4_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "tablet:unitCreated"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = SendReactMessage
  L4_2 = "addUnit"
  L5_2 = {}
  L5_2.job = A0_2
  L5_2.name = A1_2
  L5_2.status = A2_2
  L3_2(L4_2, L5_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "tablet:unitRemoved"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = SendReactMessage
  L3_2 = "removeUnit"
  L4_2 = {}
  L4_2.job = A0_2
  L4_2.unit = A1_2
  L2_2(L3_2, L4_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "tablet:unitUpdated"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = SendReactMessage
  L3_2 = "updateUnit"
  L4_2 = {}
  L4_2.job = A0_2
  L5_2 = A1_2.unit
  L4_2.unit = L5_2
  L5_2 = A1_2.status
  L4_2.status = L5_2
  L5_2 = A1_2.newName
  L4_2.newName = L5_2
  L2_2(L3_2, L4_2)
end
L0_1(L1_1, L2_1)
