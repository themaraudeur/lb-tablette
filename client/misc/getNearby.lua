local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = {}
function L1_1()
  local L0_2, L1_2
  L0_2 = L0_1
  return L0_2
end
GetNearbyPlayers = L1_1
while true do
  L1_1 = GetEntityCoords
  L2_1 = PlayerPedId
  L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L2_1()
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
  L2_1 = GetActivePlayers
  L2_1 = L2_1()
  L3_1 = PlayerId
  L3_1 = L3_1()
  L4_1 = {}
  L5_1 = 1
  L6_1 = #L2_1
  L7_1 = 1
  for L8_1 = L5_1, L6_1, L7_1 do
    L9_1 = L2_1[L8_1]
    if L9_1 == L3_1 then
    else
      L10_1 = GetPlayerPed
      L11_1 = L9_1
      L10_1 = L10_1(L11_1)
      L11_1 = GetEntityCoords
      L12_1 = L10_1
      L11_1 = L11_1(L12_1)
      L12_1 = L1_1 - L11_1
      L12_1 = #L12_1
      if L12_1 > 60.0 then
      else
        L12_1 = #L4_1
        L12_1 = L12_1 + 1
        L13_1 = {}
        L13_1.player = L9_1
        L14_1 = GetPlayerServerId
        L15_1 = L9_1
        L14_1 = L14_1(L15_1)
        L13_1.source = L14_1
        L13_1.ped = L10_1
        L4_1[L12_1] = L13_1
      end
    end
  end
  L0_1 = L4_1
  L5_1 = Wait
  L6_1 = 5000
  L5_1(L6_1)
end
