local L0_1, L1_1, L2_1, L3_1
L0_1 = BaseCallback
L1_1 = "voiceMemo:saveRecording"
function L2_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  if not A2_2 or not A3_2 then
    L5_2 = debugprint
    L6_2 = "VoiceMemo: no url/duration, not saving"
    L5_2(L6_2)
    return
  end
  L5_2 = MySQL
  L5_2 = L5_2.insert
  L5_2 = L5_2.await
  L6_2 = "INSERT INTO lbtablet_voice_memo_recordings (tablet_id, file_name, file_url, file_length) VALUES (?, ?, ?, ?)"
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = A4_2 or L9_2
  if not A4_2 then
    L9_2 = "??"
  end
  L10_2 = A2_2
  L11_2 = A3_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L7_2[4] = L11_2
  return L5_2(L6_2, L7_2)
end
L0_1(L1_1, L2_1)
L0_1 = BaseCallback
L1_1 = "voiceMemo:getMemos"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "SELECT id, file_name AS `title`, file_url AS `src`, file_length AS `duration`, created_at AS `timestamp` FROM lbtablet_voice_memo_recordings WHERE tablet_id = ? ORDER BY created_at DESC"
  L4_2 = {}
  L5_2 = A1_2
  L4_2[1] = L5_2
  return L2_2(L3_2, L4_2)
end
L3_1 = {}
L0_1(L1_1, L2_1, L3_1)
L0_1 = BaseCallback
L1_1 = "voiceMemo:deleteMemo"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = "DELETE FROM lbtablet_voice_memo_recordings WHERE id = ? AND tablet_id = ?"
  L5_2 = {}
  L6_2 = A2_2
  L7_2 = A1_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L3_2 = L3_2(L4_2, L5_2)
  L3_2 = L3_2 > 0
  return L3_2
end
L0_1(L1_1, L2_1)
L0_1 = BaseCallback
L1_1 = "renameMemo"
function L2_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = MySQL
  L4_2 = L4_2.update
  L4_2 = L4_2.await
  L5_2 = "UPDATE lbtablet_voice_memo_recordings SET file_name = ? WHERE id = ? AND tablet_id = ?"
  L6_2 = {}
  L7_2 = A3_2
  L8_2 = A2_2
  L9_2 = A1_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L4_2 = L4_2(L5_2, L6_2)
  L4_2 = L4_2 > 0
  return L4_2
end
L0_1(L1_1, L2_1)
