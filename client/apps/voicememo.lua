local L0_1, L1_1, L2_1
L0_1 = ReactCallback
L1_1 = "VoiceMemo"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = A0_2.action
  if "upload" == L1_2 then
    L2_2 = A0_2.data
    L3_2 = AwaitCallback
    L4_2 = "voiceMemo:saveRecording"
    L5_2 = L2_2.src
    L6_2 = L2_2.duration
    L7_2 = L2_2.title
    return L3_2(L4_2, L5_2, L6_2, L7_2)
  elseif "get" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "voiceMemo:getMemos"
    return L2_2(L3_2)
  elseif "delete" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "voiceMemo:deleteMemo"
    L4_2 = A0_2.id
    return L2_2(L3_2, L4_2)
  elseif "rename" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "voiceMemo:renameMemo"
    L4_2 = A0_2.id
    L5_2 = A0_2.title
    return L2_2(L3_2, L4_2, L5_2)
  end
end
L0_1(L1_1, L2_1)
