local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = Config
L0_1 = L0_1.Voice
L0_1 = L0_1.RecordNearby
if not L0_1 then
  return
end
L0_1 = GetEntityCoords
L1_1 = {}
L2_1 = nil
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = GetVoiceMaxDistance
  L1_2 = L1_2()
  if A0_2 <= 0 then
    L2_2 = 1.0
    return L2_2
  elseif A0_2 >= L1_2 then
    L2_2 = 0.0
    return L2_2
  end
  L2_2 = A0_2 / L1_2
  L3_2 = 1
  L2_2 = L3_2 - L2_2
  L2_2 = L2_2 ^ 2
  L3_2 = math
  L3_2 = L3_2.floor
  L4_2 = L2_2 * 100
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2 / 100
  return L3_2
end
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = L0_1
  L1_2 = PlayerPedId
  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L1_2()
  L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L1_2 = 1
  L2_2 = L1_1
  L2_2 = #L2_2
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = L1_1
    L5_2 = L5_2[L4_2]
    L6_2 = L0_1
    L7_2 = L5_2.ped
    L6_2 = L6_2(L7_2)
    L6_2 = L0_2 - L6_2
    L6_2 = #L6_2
    L7_2 = L3_1
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    L8_2 = L5_2.volume
    if L7_2 == L8_2 then
    else
      L5_2.volume = L7_2
      L8_2 = SendReactMessage
      L9_2 = "voice:setVolume"
      L10_2 = {}
      L11_2 = L5_2.channel
      L10_2.channel = L11_2
      L10_2.volume = L7_2
      L8_2(L9_2, L10_2)
    end
  end
end
L5_1 = SetInterval
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L0_2 = {}
  L1_2 = GetNearbyPlayers
  L1_2 = L1_2()
  L2_2 = L0_1
  L3_2 = PlayerPedId
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L3_2()
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  L3_2 = 1
  L4_2 = #L1_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = L1_2[L6_2]
    L8_2 = Player
    L9_2 = L7_2.source
    L8_2 = L8_2(L9_2)
    L8_2 = L8_2.state
    L9_2 = L8_2
    if L9_2 then
      L9_2 = L9_2.lbTabletListeningPeerId
    end
    if not L9_2 then
    else
      L9_2 = L0_1
      L10_2 = L7_2.ped
      L9_2 = L9_2(L10_2)
      L9_2 = L2_2 - L9_2
      L9_2 = #L9_2
      if L9_2 > 25.0 then
      else
        L10_2 = #L0_2
        L10_2 = L10_2 + 1
        L11_2 = {}
        L12_2 = L7_2.source
        L11_2.source = L12_2
        L12_2 = L7_2.ped
        L11_2.ped = L12_2
        L12_2 = L8_2.lbTabletListeningPeerId
        L11_2.channel = L12_2
        L0_2[L10_2] = L11_2
        L10_2 = 1
        L11_2 = L1_1
        L11_2 = #L11_2
        L12_2 = 1
        for L13_2 = L10_2, L11_2, L12_2 do
          L14_2 = L1_1
          L14_2 = L14_2[L13_2]
          L15_2 = L14_2.source
          L16_2 = L7_2.source
          if L15_2 == L16_2 then
            L15_2 = #L0_2
            L15_2 = L0_2[L15_2]
            L16_2 = L14_2.volume
            L15_2.volume = L16_2
            goto lbl_80
          end
        end
        L10_2 = #L0_2
        L10_2 = L0_2[L10_2]
        L11_2 = L3_1
        L12_2 = L9_2
        L11_2 = L11_2(L12_2)
        L10_2.volume = L11_2
        L10_2 = SendReactMessage
        L11_2 = "voice:joinChannel"
        L12_2 = {}
        L13_2 = L8_2.lbTabletListeningPeerId
        L12_2.channel = L13_2
        L13_2 = L3_1
        L14_2 = L9_2
        L13_2 = L13_2(L14_2)
        L12_2.volume = L13_2
        L10_2(L11_2, L12_2)
      end
    end
    ::lbl_80::
  end
  L1_1 = L0_2
  L3_2 = L1_1
  L3_2 = #L3_2
  if L3_2 > 0 then
    L3_2 = L2_1
    if not L3_2 then
      L3_2 = SetInterval
      L4_2 = L4_1
      L5_2 = 50
      L3_2 = L3_2(L4_2, L5_2)
      L2_1 = L3_2
  end
  else
    L3_2 = L1_1
    L3_2 = #L3_2
    if 0 == L3_2 then
      L3_2 = L2_1
      if L3_2 then
        L3_2 = ClearInterval
        L4_2 = L2_1
        L3_2 = L3_2(L4_2)
        L2_1 = L3_2
      end
    end
  end
end
L7_1 = 1000
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "tablet:startedListening"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L2_2 = GetPlayerFromServerId
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L3_2 = PlayerId
    L3_2 = L3_2()
    if L2_2 ~= L3_2 and -1 ~= L2_2 then
      goto lbl_13
    end
  end
  do return end
  ::lbl_13::
  L3_2 = PlayerPedId
  L3_2 = L3_2()
  L4_2 = GetPlayerPed
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  L5_2 = L0_1
  L6_2 = L3_2
  L5_2 = L5_2(L6_2)
  L6_2 = L0_1
  L7_2 = L4_2
  L6_2 = L6_2(L7_2)
  L5_2 = L5_2 - L6_2
  L5_2 = #L5_2
  L6_2 = DoesEntityExist
  L7_2 = L4_2
  L6_2 = L6_2(L7_2)
  if not L6_2 or L4_2 == L3_2 or L5_2 > 25.0 then
    return
  end
  L6_2 = 1
  L7_2 = L1_1
  L7_2 = #L7_2
  L8_2 = 1
  for L9_2 = L6_2, L7_2, L8_2 do
    L10_2 = L1_1
    L10_2 = L10_2[L9_2]
    L11_2 = L10_2.source
    if L11_2 == A0_2 then
      L11_2 = L10_2.channel
      if L11_2 == A1_2 then
        L11_2 = debugprint
        L12_2 = "tablet:startedListening: already listening"
        L13_2 = A0_2
        L14_2 = A1_2
        do return L11_2(L12_2, L13_2, L14_2) end
        break
      end
      L11_2 = L1_1
      L11_2[L9_2] = nil
      L11_2 = debugprint
      L12_2 = "tablet:startedListening: leaving channel"
      L13_2 = A0_2
      L14_2 = A1_2
      L11_2(L12_2, L13_2, L14_2)
      L11_2 = SendReactMessage
      L12_2 = "voice:leaveChannel"
      L13_2 = L10_2.channel
      L11_2(L12_2, L13_2)
      break
    end
  end
  L6_2 = L1_1
  L6_2 = #L6_2
  L7_2 = L6_2 + 1
  L6_2 = L1_1
  L8_2 = {}
  L8_2.source = A0_2
  L8_2.ped = L4_2
  L8_2.channel = A1_2
  L9_2 = L3_1
  L10_2 = L5_2
  L9_2 = L9_2(L10_2)
  L8_2.volume = L9_2
  L6_2[L7_2] = L8_2
  L6_2 = SendReactMessage
  L7_2 = "voice:joinChannel"
  L8_2 = {}
  L8_2.channel = A1_2
  L9_2 = L3_1
  L10_2 = L5_2
  L9_2 = L9_2(L10_2)
  L8_2.volume = L9_2
  L6_2(L7_2, L8_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "tablet:stoppedListening"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = debugprint
  L2_2 = "stoppedListening"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
  L1_2 = SendReactMessage
  L2_2 = "voice:leaveChannel"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L5_1(L6_1, L7_1)
L5_1 = ReactCallback
L6_1 = "setListeningPeerId"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = TriggerServerEvent
  L2_2 = "tablet:setListeningPeerId"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L8_1 = "ok"
L5_1(L6_1, L7_1, L8_1)
L5_1 = ReactCallback
L6_1 = "voice:getConfig"
function L7_1()
  local L0_2, L1_2
  L0_2 = {}
  L1_2 = Config
  L1_2 = L1_2.Voice
  L1_2 = L1_2.RecordNearby
  L0_2.RecordNearbyVoices = L1_2
  L1_2 = Config
  L1_2 = L1_2.RTCConfig
  L0_2.RTCConfig = L1_2
  return L0_2
end
L5_1(L6_1, L7_1)
