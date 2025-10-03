local L0_1, L1_1, L2_1
L0_1 = ReactCallback
L1_1 = "Clock"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = A0_2.action
  if "getAlarms" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "clock:getAlarms"
    return L2_2(L3_2)
  elseif "createAlarm" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "clock:createAlarm"
    L4_2 = A0_2.label
    L5_2 = A0_2.hours
    L6_2 = A0_2.minutes
    return L2_2(L3_2, L4_2, L5_2, L6_2)
  elseif "deleteAlarm" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "clock:deleteAlarm"
    L4_2 = A0_2.id
    return L2_2(L3_2, L4_2)
  elseif "updateAlarm" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "clock:updateAlarm"
    L4_2 = A0_2.id
    L5_2 = A0_2.label
    L6_2 = A0_2.hours
    L7_2 = A0_2.minutes
    return L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  elseif "toggleAlarm" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "clock:toggleAlarm"
    L4_2 = A0_2.id
    L5_2 = A0_2.enabled
    return L2_2(L3_2, L4_2, L5_2)
  end
end
L0_1(L1_1, L2_1)
