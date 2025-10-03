local L0_1, L1_1, L2_1, L3_1
L0_1 = BaseCallback
L1_1 = "clock:getAlarms"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "SELECT id, hours, minutes, label, enabled FROM lbtablet_clock_alarms WHERE tablet_id = ?"
  L4_2 = {}
  L5_2 = A1_2
  L4_2[1] = L5_2
  return L2_2(L3_2, L4_2)
end
L3_1 = {}
L0_1(L1_1, L2_1, L3_1)
L0_1 = BaseCallback
L1_1 = "clock:createAlarm"
function L2_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2
  L5_2 = MySQL
  L5_2 = L5_2.insert
  L5_2 = L5_2.await
  L6_2 = "INSERT INTO lbtablet_clock_alarms (tablet_id, label, hours, minutes) VALUES (@tabletId, @label, @hours, @minutes)"
  L7_2 = {}
  L7_2["@tabletId"] = A1_2
  L7_2["@label"] = A2_2
  L7_2["@hours"] = A3_2
  L7_2["@minutes"] = A4_2
  return L5_2(L6_2, L7_2)
end
L0_1(L1_1, L2_1)
L0_1 = BaseCallback
L1_1 = "clock:deleteAlarm"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.awiat
  L4_2 = "DELETE FROM lbtablet_clock_alarms WHERE id = ? AND tablet_id = ?"
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
L1_1 = "clock:updateAlarm"
function L2_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2
  L6_2 = MySQL
  L6_2 = L6_2.insert
  L6_2 = L6_2.await
  L7_2 = "UPDATE lbtablet_clock_alarms SET label = @label, hours = @hours, minutes = @minutes WHERE id = @id AND tablet_id = @tabletId"
  L8_2 = {}
  L8_2["@id"] = A2_2
  L8_2["@tabletId"] = A1_2
  L8_2["@hours"] = A4_2
  L8_2["@minutes"] = A5_2
  L8_2["@label"] = A3_2
  return L6_2(L7_2, L8_2)
end
L0_1(L1_1, L2_1)
L0_1 = BaseCallback
L1_1 = "clock:toggleAlarm"
function L2_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = MySQL
  L4_2 = L4_2.update
  L4_2 = L4_2.await
  L5_2 = "UPDATE lbtablet_clock_alarms SET enabled = ? WHERE id = ? AND tablet_id = ?"
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
