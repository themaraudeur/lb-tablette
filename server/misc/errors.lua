local L0_1, L1_1, L2_1, L3_1
L0_1 = 0
L1_1 = RegisterNetEvent
L2_1 = "tablet:logError"
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L3_2 = L0_1
  if L3_2 >= 5 then
    return
  end
  L3_2 = L0_1
  L3_2 = L3_2 + 1
  L0_1 = L3_2
  L3_2 = SetTimeout
  L4_2 = 3600000
  function L5_2()
    local L0_3, L1_3
    L0_3 = L0_1
    L0_3 = L0_3 - 1
    L0_1 = L0_3
  end
  L3_2(L4_2, L5_2)
  L3_2 = [[
**Message**: `%s`
**Stack**:```%s```**Component Stack**:```%s```**Version**: `%s`]]
  L4_2 = L3_2
  L3_2 = L3_2.format
  L5_2 = A0_2
  L7_2 = A1_2
  L6_2 = A1_2.sub
  L8_2 = 1
  L9_2 = 800
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L8_2 = A2_2
  L7_2 = A2_2.sub
  L9_2 = 1
  L10_2 = 800
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L8_2 = GetResourceMetadata
  L9_2 = GetCurrentResourceName
  L9_2 = L9_2()
  L10_2 = "version"
  L11_2 = 0
  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L8_2(L9_2, L10_2, L11_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L4_2 = PerformHttpRequest
  L5_2 = ""
  function L6_2(A0_3, A1_3, A2_3)
  end
  L7_2 = "POST"
  L8_2 = json
  L8_2 = L8_2.encode
  L9_2 = {}
  L11_2 = L3_2
  L10_2 = L3_2.sub
  L12_2 = 1
  L13_2 = 2000
  L10_2 = L10_2(L11_2, L12_2, L13_2)
  L9_2.content = L10_2
  L10_2 = GetConvar
  L11_2 = "sv_hostname"
  L12_2 = "unknown server"
  L10_2 = L10_2(L11_2, L12_2)
  L9_2.username = L10_2
  L8_2 = L8_2(L9_2)
  L9_2 = {}
  L9_2["Content-Type"] = "application/json"
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
end
L1_1(L2_1, L3_1)
