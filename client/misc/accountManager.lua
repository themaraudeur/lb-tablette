local L0_1, L1_1, L2_1, L3_1
L0_1 = {}
L0_1.Mail = "mail"
L1_1 = RegisterNUICallback
L2_1 = "AccountSwitcher"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = A0_2.action
  L4_2 = A0_2.app
  L3_2 = L0_1
  L3_2 = L3_2[L4_2]
  if not L3_2 then
    L4_2 = A1_2
    L5_2 = false
    return L4_2(L5_2)
  end
  if "switch" == L2_2 then
    L4_2 = TriggerCallback
    L5_2 = "accountManager:switch"
    L6_2 = A1_2
    L7_2 = L3_2
    L8_2 = A0_2.account
    L4_2(L5_2, L6_2, L7_2, L8_2)
  elseif "getAccounts" == L2_2 then
    L4_2 = TriggerCallback
    L5_2 = "accountManager:getAccounts"
    L6_2 = A1_2
    L7_2 = L3_2
    L4_2(L5_2, L6_2, L7_2)
  end
end
L1_1(L2_1, L3_1)
