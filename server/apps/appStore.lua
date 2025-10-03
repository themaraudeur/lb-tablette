local L0_1, L1_1, L2_1
L0_1 = BaseCallback
L1_1 = "appStore:buyApp"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  if not A2_2 or A2_2 < 0 then
    L3_2 = false
    return L3_2
  end
  L3_2 = RemoveMoney
  L4_2 = A0_2
  L5_2 = A2_2
  return L3_2(L4_2, L5_2)
end
L0_1(L1_1, L2_1)
