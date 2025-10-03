local L0_1, L1_1, L2_1
L0_1 = RegisterNetEvent
L1_1 = "tablet:chat:setIcon"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = SendReactMessage
  L3_2 = "chat:setChatAvatar"
  L4_2 = {}
  L4_2.id = A0_2
  L4_2.avatar = A1_2
  L2_2(L3_2, L4_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "tablet:chat:joinRoom"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "chat:joinChatRoom"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "tablet:chat:leaveRoom"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "chat:leaveChatRoom"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "tablet:chat:newMessage"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "chat:newMessage"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "tablet:chat:setPrivate"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = SendReactMessage
  L3_2 = "chat:setPrivate"
  L4_2 = {}
  L4_2.id = A0_2
  L4_2.private = A1_2
  L2_2(L3_2, L4_2)
end
L0_1(L1_1, L2_1)
