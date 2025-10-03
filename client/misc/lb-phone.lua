local L0_1, L1_1, L2_1, L3_1
L0_1 = Config
L0_1 = L0_1.LBPhone
if not L0_1 then
  return
end
L0_1 = RegisterNetEvent
L1_1 = "lb-phone:numberChanged"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "setHasPhone"
  L3_2 = nil ~= A0_2
  L1_2(L2_2, L3_2)
end
L0_1(L1_1, L2_1)
while true do
  L0_1 = GetResourceState
  L1_1 = "lb-phone"
  L0_1 = L0_1(L1_1)
  if "started" == L0_1 then
    break
  end
  L0_1 = Wait
  L1_1 = 0
  L0_1(L1_1)
end
L0_1 = Wait
L1_1 = 1000
L0_1(L1_1)
function L0_1(A0_2, ...)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = pcall
  L2_2 = exports
  L2_2 = L2_2["lb-phone"]
  L2_2 = L2_2[A0_2]
  L3_2, L4_2, L5_2, L6_2 = ...
  L1_2, L2_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  if not L1_2 then
    L3_2 = debugprint
    L4_2 = "Error calling lb-phone export "
    L5_2 = A0_2
    L6_2 = ": "
    L4_2 = L4_2 .. L5_2 .. L6_2
    L3_2(L4_2)
    L3_2 = debugprint
    L4_2 = L2_2
    L3_2(L4_2)
    return
  end
  return L2_2
end
function L1_1()
  local L0_2, L1_2
  L0_2 = L0_1
  L1_2 = "GetEquippedPhoneNumber"
  return L0_2(L1_2)
end
GetPhoneNumber = L1_1
function L1_1()
  local L0_2, L1_2
  L0_2 = L0_1
  L1_2 = "GetCompanyCallsStatus"
  return L0_2(L1_2)
end
GetCompanyCallsStatus = L1_1
function L1_1()
  local L0_2, L1_2
  L0_2 = L0_1
  L1_2 = "ToggleCompanyCalls"
  return L0_2(L1_2)
end
ToggleCompanyCalls = L1_1
while true do
  L1_1 = GetPhoneNumber
  L1_1 = L1_1()
  if L1_1 then
    break
  end
  L1_1 = Wait
  L2_1 = 500
  L1_1(L2_1)
end
L1_1 = LoadedNUI
if L1_1 then
  L1_1 = SendReactMessage
  L2_1 = "setHasPhone"
  L3_1 = true
  L1_1(L2_1, L3_1)
end
