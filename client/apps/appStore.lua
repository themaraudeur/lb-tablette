local L0_1, L1_1, L2_1
L0_1 = ReactCallback
L1_1 = "AppStore"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = A0_2.action
  if "buyApp" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "appStore:buyApp"
    L4_2 = A0_2.price
    return L2_2(L3_2, L4_2)
  end
end
L0_1(L1_1, L2_1)
