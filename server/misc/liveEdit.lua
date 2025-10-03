local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = Config
L0_1 = L0_1.LiveEdit
if L0_1 then
  L0_1 = Config
  L0_1 = L0_1.LiveEdit
  L0_1 = L0_1.Enabled
  if L0_1 then
    goto lbl_12
  end
end
do return end
::lbl_12::
L0_1 = {}
L1_1 = {}
function L2_1(A0_2, A1_2, A2_2, ...)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  if not L3_2 then
    return
  end
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  L3_2 = L3_2.sources
  L4_2 = 1
  L5_2 = #L3_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = L3_2[L7_2]
    if L8_2 ~= A2_2 then
      L9_2 = TriggerLatentClientEvent
      L10_2 = A1_2
      L11_2 = L8_2
      L12_2 = -1
      L13_2 = A0_2
      L14_2 = ...
      L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    end
  end
end
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = L1_1
  L1_2 = L1_2[A0_2]
  if L1_2 then
    L1_2 = L1_1
    L1_2 = L1_2[A0_2]
    L1_2 = L1_2.document
  end
  if L1_2 then
    L2_2 = L0_1
    L2_2 = L2_2[L1_2]
    if L2_2 then
      goto lbl_15
    end
  end
  do return end
  ::lbl_15::
  L2_2 = L0_1
  L2_2 = L2_2[L1_2]
  L2_2 = L2_2.sources
  L3_2 = 1
  L4_2 = #L2_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = L2_2[L6_2]
    L8_2 = L1_1
    L8_2 = L8_2[L7_2]
    if L7_2 ~= A0_2 and L8_2 then
      L9_2 = L8_2.document
      if L9_2 == L1_2 then
        L9_2 = L8_2.awareness
        if L9_2 then
          L9_2 = TriggerClientEvent
          L10_2 = "liveEdit:awarenessUpdate"
          L11_2 = A0_2
          L12_2 = L1_2
          L13_2 = L8_2.clientId
          L14_2 = L8_2.awareness
          L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
        end
      end
    end
  end
end
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = L1_1
  L1_2 = L1_2[A0_2]
  L2_2 = L1_2 or L2_2
  if L1_2 then
    L2_2 = L1_2.document
  end
  if not L1_2 or not L2_2 then
    return
  end
  L3_2 = L0_1
  L3_2 = L3_2[L2_2]
  if not L3_2 then
    return
  end
  L4_2 = L2_1
  L5_2 = L2_2
  L6_2 = "liveEdit:awarenessUpdate"
  L7_2 = A0_2
  L8_2 = L1_2.clientId
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = 1
  L5_2 = L3_2.sources
  L5_2 = #L5_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = L3_2.sources
    L8_2 = L8_2[L7_2]
    if L8_2 == A0_2 then
      L8_2 = table
      L8_2 = L8_2.remove
      L9_2 = L3_2.sources
      L10_2 = L7_2
      L8_2(L9_2, L10_2)
      break
    end
  end
  L4_2 = L1_1
  L4_2[A0_2] = nil
  L4_2 = L3_2.sources
  L4_2 = #L4_2
  if 0 == L4_2 then
    L4_2 = L0_1
    L4_2[L2_2] = nil
  end
end
L5_1 = BaseCallback
L6_1 = "liveEdit:getDocument"
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = L4_1
  L5_2 = A0_2
  L4_2(L5_2)
  L4_2 = L0_1
  L4_2 = L4_2[A2_2]
  if L4_2 then
    L4_2 = L0_1
    L4_2 = L4_2[A2_2]
    L4_2 = L4_2.sources
    L5_2 = false
    L6_2 = 1
    L7_2 = #L4_2
    L8_2 = 1
    for L9_2 = L6_2, L7_2, L8_2 do
      L10_2 = L4_2[L9_2]
      if L10_2 == A0_2 then
        L5_2 = true
        break
      end
    end
    if not L5_2 then
      L6_2 = L0_1
      L6_2 = L6_2[A2_2]
      L6_2 = L6_2.sources
      L7_2 = L0_1
      L7_2 = L7_2[A2_2]
      L7_2 = L7_2.sources
      L7_2 = #L7_2
      L7_2 = L7_2 + 1
      L6_2[L7_2] = A0_2
    end
    L6_2 = L1_1
    L7_2 = {}
    L7_2.document = A2_2
    L7_2.clientId = A3_2
    L6_2[A0_2] = L7_2
  else
    L4_2 = L0_1
    L5_2 = {}
    L6_2 = {}
    L7_2 = A0_2
    L6_2[1] = L7_2
    L5_2.sources = L6_2
    L4_2[A2_2] = L5_2
  end
  L4_2 = L1_1
  L5_2 = {}
  L5_2.document = A2_2
  L5_2.clientId = A3_2
  L4_2[A0_2] = L5_2
  L4_2 = L0_1
  L4_2 = L4_2[A2_2]
  L4_2 = L4_2.data
  return L4_2
end
L5_1(L6_1, L7_1)
L5_1 = BaseCallback
L6_1 = "liveEdit:crdtUpdate"
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = L0_1
  L4_2 = L4_2[A2_2]
  if not L4_2 then
    L4_2 = debugprint
    L5_2 = "crdtUpdate: Document not found"
    L6_2 = A2_2
    return L4_2(L5_2, L6_2)
  end
  L4_2 = L0_1
  L4_2 = L4_2[A2_2]
  L4_2.data = A3_2
  L4_2 = L2_1
  L5_2 = A2_2
  L6_2 = "liveEdit:crdtBroadcast"
  L7_2 = A0_2
  L8_2 = A3_2
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = true
  return L4_2
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "liveEdit:updateAwareness"
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = source
  L4_2 = L1_1
  L4_2 = L4_2[L3_2]
  L4_2.awareness = A2_2
  L4_2 = L2_1
  L5_2 = A0_2
  L6_2 = "liveEdit:awarenessUpdate"
  L7_2 = L3_2
  L8_2 = A1_2
  L9_2 = A2_2
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "liveEdit:leaveDocument"
function L7_1()
  local L0_2, L1_2, L2_2
  L0_2 = source
  L1_2 = L4_1
  L2_2 = L0_2
  L1_2(L2_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "liveEdit:saveFullDocState"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = source
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  if not L3_2 then
    L3_2 = debugprint
    L4_2 = "saveFullDocState: Document not found"
    L5_2 = A0_2
    return L3_2(L4_2, L5_2)
  end
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  L3_2.data = A1_2
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "liveEdit:refreshAwareness"
function L7_1()
  local L0_2, L1_2, L2_2
  L0_2 = source
  L1_2 = Wait
  L2_2 = 500
  L1_2(L2_2)
  L1_2 = L3_1
  L2_2 = L0_2
  L1_2(L2_2)
end
L5_1(L6_1, L7_1)
L5_1 = OnPlayerDisconnect
function L6_1(A0_2)
  local L1_2, L2_2
  L1_2 = L4_1
  L2_2 = A0_2
  L1_2(L2_2)
end
L5_1(L6_1)
