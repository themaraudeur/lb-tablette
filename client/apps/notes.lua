local L0_1, L1_1, L2_1
L0_1 = RegisterNUICallback
L1_1 = "Notes"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = A0_2.action
  L3_2 = A0_2.data
  A0_2 = L3_2 or A0_2
  if not L3_2 then
  end
  if "create" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "notes:create"
    L5_2 = A1_2
    L6_2 = A0_2.title
    L7_2 = A0_2.content
    L3_2(L4_2, L5_2, L6_2, L7_2)
  elseif "save" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "notes:save"
    L5_2 = A1_2
    L6_2 = A0_2.id
    L7_2 = A0_2.title
    L8_2 = A0_2.content
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  elseif "fetch" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "notes:fetch"
    L5_2 = A1_2
    L6_2 = A0_2.page
    if not L6_2 then
      L6_2 = 0
    end
    L3_2(L4_2, L5_2, L6_2)
  elseif "remove" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "notes:remove"
    L5_2 = A1_2
    L6_2 = A0_2.id
    L3_2(L4_2, L5_2, L6_2)
  end
end
L0_1(L1_1, L2_1)
