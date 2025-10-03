local L0_1, L1_1, L2_1
L0_1 = BaseCallback
L1_1 = "notes:create"
function L2_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = MySQL
  L4_2 = L4_2.insert
  L4_2 = L4_2.await
  L5_2 = "INSERT INTO lbtablet_notes (tablet_id, title, content) VALUES (?, ?, ?)"
  L6_2 = {}
  L7_2 = A1_2
  L8_2 = A2_2
  L9_2 = A3_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L4_2 = L4_2(L5_2, L6_2)
  return L4_2
end
L0_1(L1_1, L2_1)
L0_1 = BaseCallback
L1_1 = "notes:save"
function L2_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = MySQL
  L5_2 = L5_2.update
  L5_2 = L5_2.await
  L6_2 = "UPDATE lbtablet_notes SET title = ?, content = ? WHERE id = ? AND tablet_id = ?"
  L7_2 = {}
  L8_2 = A3_2
  L9_2 = A4_2
  L10_2 = A2_2
  L11_2 = A1_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L7_2[4] = L11_2
  L5_2 = L5_2(L6_2, L7_2)
  L5_2 = L5_2 > 0
  return L5_2
end
L0_1(L1_1, L2_1)
L0_1 = BaseCallback
L1_1 = "notes:fetch"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = MySQL
  L3_2 = L3_2.query
  L3_2 = L3_2.await
  L4_2 = [[
        SELECT id, title, content, updated_at
        FROM lbtablet_notes
        WHERE tablet_id=?
        ORDER BY updated_at DESC
        LIMIT ?, 15
    ]]
  L5_2 = {}
  L6_2 = A1_2
  L7_2 = A2_2 or L7_2
  if not A2_2 then
    L7_2 = 0
  end
  L7_2 = L7_2 * 15
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  return L3_2(L4_2, L5_2)
end
L0_1(L1_1, L2_1)
L0_1 = BaseCallback
L1_1 = "notes:remove"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = "DELETE FROM lbtablet_notes WHERE id = ? AND tablet_id = ?"
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
