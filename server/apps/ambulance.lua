local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1
L0_1 = {}
L1_1 = {}
L2_1 = {}
L3_1 = {}
L4_1 = pairs
L5_1 = Config
L5_1 = L5_1.Ambulance
L5_1 = L5_1.Permissions
L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
for L8_1, L9_1 in L4_1, L5_1, L6_1, L7_1 do
  L10_1 = #L1_1
  L10_1 = L10_1 + 1
  L1_1[L10_1] = L8_1
end
L4_1 = {}
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = pairs
  L2_2 = L4_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = 1
    L8_2 = #L6_2
    L9_2 = 1
    for L10_2 = L7_2, L8_2, L9_2 do
      L11_2 = L6_2[L10_2]
      L11_2 = L11_2.id
      if L11_2 == A0_2 then
        L11_2 = L6_2[L10_2]
        L12_2 = L10_2
        return L11_2, L12_2
      end
    end
  end
end
L6_1 = MySQL
L6_1 = L6_1.ready
function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  while true do
    L0_2 = DatabaseCheckerFinished
    if L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 500
    L0_2(L1_2)
  end
  L0_2 = GetJobGrades
  L1_2 = L1_1
  L0_2 = L0_2(L1_2)
  L2_1 = L0_2
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = [[
        SELECT
            id,
            title,
            color,
            tag_type AS `type`

        FROM lbtablet_ambulance_tags
    ]]
  L0_2 = L0_2(L1_2)
  L3_1 = L0_2
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = [[
        SELECT
            co.id,
            co.severity,
            co.category_id,
            co.title,
            ca.title AS category
        FROM
            lbtablet_ambulance_conditions_categories ca
        LEFT JOIN
            lbtablet_ambulance_conditions co ON co.category_id = ca.id

        ORDER BY
            co.category_id ASC,
            co.severity DESC,
            co.id ASC
    ]]
  L0_2 = L0_2(L1_2)
  L1_2 = 1
  L2_2 = #L0_2
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = L0_2[L4_2]
    L7_2 = L5_2.category
    L6_2 = L4_1
    L6_2 = L6_2[L7_2]
    if not L6_2 then
      L7_2 = L5_2.category
      L6_2 = L4_1
      L8_2 = {}
      L6_2[L7_2] = L8_2
    end
    L7_2 = L5_2.category
    L6_2 = L4_1
    L6_2 = L6_2[L7_2]
    L7_2 = L5_2.id
    if L7_2 then
      L7_2 = #L6_2
      L7_2 = L7_2 + 1
      L6_2[L7_2] = L5_2
    end
  end
end
L6_1(L7_1)
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = 1
  L2_2 = L3_1
  L2_2 = #L2_2
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = L3_1
    L5_2 = L5_2[L4_2]
    L5_2 = L5_2.id
    if L5_2 == A0_2 then
      L5_2 = L3_1
      L5_2 = L5_2[L4_2]
      L6_2 = L4_2
      return L5_2, L6_2
    end
  end
end
L7_1 = 0
L8_1 = {}
function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = L7_1
  L3_2 = os
  L3_2 = L3_2.time
  L3_2 = L3_2()
  L3_2 = L3_2 + 60
  if L2_2 < L3_2 then
    L2_2 = GetIdentifiersWithJob
    L3_2 = L1_1
    L2_2 = L2_2(L3_2)
    L8_1 = L2_2
    L2_2 = os
    L2_2 = L2_2.time
    L2_2 = L2_2()
    L7_1 = L2_2
    L2_2 = debugprint
    L3_2 = "Fetched doctors"
    L4_2 = L8_1
    L4_2 = #L4_2
    L2_2(L3_2, L4_2)
  end
  A0_2.app = "Ambulance"
  L2_2 = NotifyTablets
  L3_2 = L8_1
  L4_2 = A0_2
  L5_2 = A1_2
  L2_2(L3_2, L4_2, L5_2)
end
function L10_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = BaseCallback
  L5_2 = "ambulance:"
  L6_2 = A0_2
  L5_2 = L5_2 .. L6_2
  function L6_2(A0_3, A1_3, ...)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L2_3 = GetJob
    L3_3 = A0_3
    L2_3 = L2_3(L3_3)
    if L2_3 then
      L3_3 = Config
      L3_3 = L3_3.Ambulance
      L3_3 = L3_3.Permissions
      L4_3 = L2_3.name
      L3_3 = L3_3[L4_3]
      if L3_3 then
        goto lbl_27
      end
    end
    L3_3 = debugprint
    L4_3 = "No permissions to access ambulance app. Identifier:"
    L5_3 = A1_3
    L6_3 = "Job:"
    if L2_3 then
      L7_3 = L2_3.name
      if L7_3 then
        goto lbl_24
      end
    end
    L7_3 = "nil"
    ::lbl_24::
    L3_3(L4_3, L5_3, L6_3, L7_3)
    L3_3 = false
    do return L3_3 end
    ::lbl_27::
    L3_3 = A1_2
    L4_3 = A0_3
    L5_3 = A1_3
    L6_3, L7_3 = ...
    return L3_3(L4_3, L5_3, L6_3, L7_3)
  end
  L7_2 = A2_2
  L8_2 = A3_2
  L4_2(L5_2, L6_2, L7_2, L8_2)
end
function L11_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = MySQL
  L1_2 = L1_2.scalar
  L1_2 = L1_2.await
  L2_2 = "SELECT 1 FROM lbtablet_ambulance_accounts WHERE callsign = ?"
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  L1_2 = L1_2(L2_2, L3_2)
  L1_2 = nil ~= L1_2
  return L1_2
end
function L12_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = Config
  L0_2 = L0_2.Ambulance
  L0_2 = L0_2.Callsign
  L0_2 = L0_2.Format
  if not L0_2 then
    L0_2 = "11-1111"
  end
  L1_2 = GenerateStringFromPattern
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  L2_2 = 0
  while true do
    L3_2 = L11_1
    L4_2 = L1_2
    L3_2 = L3_2(L4_2)
    if not L3_2 then
      break
    end
    L2_2 = L2_2 + 1
    if L2_2 > 50 then
      L3_2 = infoprint
      L4_2 = "error"
      L5_2 = "Failed to generate a unique callsign after 50 attempts. Consider changing Config.Ambulance.Callsign.Format"
      L3_2(L4_2, L5_2)
    end
    L3_2 = GenerateStringFromPattern
    L4_2 = L0_2
    L3_2 = L3_2(L4_2)
    L1_2 = L3_2
    L3_2 = Wait
    L4_2 = 0
    L3_2(L4_2)
  end
  return L1_2
end
function L13_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = Config
  L1_2 = L1_2.Ambulance
  L1_2 = L1_2.Callsign
  L1_2 = L1_2.RequireTemplate
  if not L1_2 then
    L1_2 = true
    return L1_2
  end
  L1_2 = GetStringMatchPattern
  L2_2 = Config
  L2_2 = L2_2.Ambulance
  L2_2 = L2_2.Callsign
  L2_2 = L2_2.Format
  L1_2 = L1_2(L2_2)
  L3_2 = A0_2
  L2_2 = A0_2.match
  L4_2 = L1_2
  L2_2 = L2_2(L3_2, L4_2)
  L2_2 = nil ~= L2_2
  return L2_2
end
L14_1 = L10_1
L15_1 = "getEmployees"
function L16_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = GetEmployees
  L3_2 = L1_1
  L4_2 = "lbtablet_ambulance_accounts"
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = 1
  L4_2 = #L2_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = L2_2[L6_2]
    L8_2 = GetSourceFromIdentifier
    L9_2 = L7_2.id
    L8_2 = L8_2(L9_2)
    if L8_2 then
      L9_2 = IsOnDuty
      L10_2 = L8_2
      L9_2 = L9_2(L10_2)
      L7_2.onDuty = L9_2
    end
  end
  L3_2 = {}
  L3_2.employees = L2_2
  L4_2 = L2_1.grades
  L3_2.ranks = L4_2
  L4_2 = L2_1.labels
  L3_2.labels = L4_2
  return L3_2
end
L14_1(L15_1, L16_1)
function L14_1(A0_2)
  local L1_2
  L1_2 = L0_1
  L1_2 = L1_2[A0_2]
  if L1_2 then
    L1_2 = L1_2.callsign
  end
  return L1_2
end
GetAmbulanceCallsign = L14_1
function L14_1(A0_2)
  local L1_2
  L1_2 = L0_1
  L1_2 = L1_2[A0_2]
  if L1_2 then
    L1_2 = L1_2.avatar
  end
  return L1_2
end
GetAmbulanceAvatar = L14_1
L14_1 = exports
L15_1 = "GetAmbulanceCallsign"
L16_1 = GetAmbulanceCallsign
L14_1(L15_1, L16_1)
L14_1 = exports
L15_1 = "GetAmbulanceAvatar"
L16_1 = GetAmbulanceAvatar
L14_1(L15_1, L16_1)
L14_1 = {}
function L15_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L2_2 = L0_1
  L2_2 = L2_2[A1_2]
  L3_2 = GetJob
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L2_2 then
    L4_2 = L3_2.grade_label
    L2_2.rank = L4_2
    return L2_2
  end
  L4_2 = MySQL
  L4_2 = L4_2.single
  L4_2 = L4_2.await
  L5_2 = "SELECT * FROM lbtablet_ambulance_accounts WHERE id = ?"
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L5_2 = L14_1
    L5_2 = L5_2[A1_2]
    if L5_2 then
      L5_2 = debugprint
      L6_2 = "Already generating ambulance account for tabletId"
      L7_2 = A1_2
      L5_2(L6_2, L7_2)
      while true do
        L5_2 = L14_1
        L5_2 = L5_2[A1_2]
        if not L5_2 then
          break
        end
        L5_2 = Wait
        L6_2 = 0
        L5_2(L6_2)
      end
      L5_2 = L0_1
      L5_2 = L5_2[A1_2]
      return L5_2
    end
    L5_2 = L14_1
    L5_2[A1_2] = true
    L5_2 = GetCharacterName
    L6_2 = A0_2
    L5_2, L6_2 = L5_2(L6_2)
    L7_2 = nil
    L8_2 = Config
    L8_2 = L8_2.Ambulance
    L8_2 = L8_2.Callsign
    L8_2 = L8_2.AutoGenerate
    if L8_2 then
      L8_2 = L12_1
      L8_2 = L8_2()
      L7_2 = L8_2
    end
    L8_2 = "id, display_name"
    L9_2 = {}
    L10_2 = A1_2
    L11_2 = L5_2
    L12_2 = " "
    L13_2 = L6_2
    L11_2 = L11_2 .. L12_2 .. L13_2
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    if L7_2 then
      L10_2 = L8_2
      L11_2 = ", callsign"
      L10_2 = L10_2 .. L11_2
      L8_2 = L10_2
      L10_2 = #L9_2
      L10_2 = L10_2 + 1
      L9_2[L10_2] = L7_2
    end
    L10_2 = MySQL
    L10_2 = L10_2.update
    L10_2 = L10_2.await
    L11_2 = "INSERT INTO lbtablet_ambulance_accounts ("
    L12_2 = L8_2
    L13_2 = ") VALUES ("
    L14_2 = "?, "
    L15_2 = L14_2
    L14_2 = L14_2.rep
    L16_2 = #L9_2
    L14_2 = L14_2(L15_2, L16_2)
    L15_2 = L14_2
    L14_2 = L14_2.sub
    L16_2 = 1
    L17_2 = -3
    L14_2 = L14_2(L15_2, L16_2, L17_2)
    L15_2 = ")"
    L11_2 = L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2
    L12_2 = L9_2
    L10_2(L11_2, L12_2)
    L10_2 = {}
    L10_2.id = A1_2
    L11_2 = L5_2
    L12_2 = " "
    L13_2 = L6_2
    L11_2 = L11_2 .. L12_2 .. L13_2
    L10_2.display_name = L11_2
    L10_2.callsign = L7_2
    L4_2 = L10_2
    L10_2 = SetTimeout
    L11_2 = 1000
    function L12_2()
      local L0_3, L1_3
      L1_3 = A1_2
      L0_3 = L14_1
      L0_3[L1_3] = nil
    end
    L10_2(L11_2, L12_2)
  end
  L5_2 = {}
  L6_2 = L4_2.id
  L5_2.id = L6_2
  L6_2 = L4_2.display_name
  L5_2.name = L6_2
  L6_2 = L4_2.avatar
  L5_2.avatar = L6_2
  L6_2 = L4_2.callsign
  L5_2.callsign = L6_2
  L6_2 = L3_2.grade_label
  L5_2.rank = L6_2
  L4_2 = L5_2
  L5_2 = L0_1
  L5_2[A1_2] = L4_2
  return L4_2
end
L16_1 = L10_1
L17_1 = "getLoggedIn"
L18_1 = L15_1
L16_1(L17_1, L18_1)
L16_1 = L10_1
L17_1 = "updateOwnAccount"
function L18_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = L0_1
  L4_2 = L4_2[A1_2]
  L5_2 = L4_2
  if L5_2 then
    L5_2 = L5_2.callsign
  end
  if L5_2 ~= A2_2 then
    L6_2 = L13_1
    L7_2 = A2_2
    L6_2 = L6_2(L7_2)
    if not L6_2 then
      L6_2 = debugprint
      L7_2 = "Invalid callsign"
      L6_2(L7_2)
      L6_2 = false
      return L6_2
    end
  end
  if L4_2 then
    L6_2 = L4_2.callsign
    if L6_2 == A2_2 then
      L6_2 = L4_2.avatar
      if L6_2 == A3_2 then
        L6_2 = debugprint
        L7_2 = "no changes made, not updating account"
        L6_2(L7_2)
        L6_2 = true
        return L6_2
      end
    end
  end
  L6_2 = MySQL
  L6_2 = L6_2.update
  L6_2 = L6_2.await
  L7_2 = "UPDATE lbtablet_ambulance_accounts SET callsign = ?, avatar = ? WHERE id = ?"
  L8_2 = {}
  L9_2 = A2_2
  L10_2 = A3_2
  L11_2 = A1_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L6_2 = L6_2(L7_2, L8_2)
  L6_2 = L6_2 > 0
  if L6_2 then
    L7_2 = L0_1
    L7_2 = L7_2[A1_2]
    if L7_2 then
      L7_2 = L0_1
      L7_2 = L7_2[A1_2]
      L7_2.callsign = A2_2
      L7_2 = L0_1
      L7_2 = L7_2[A1_2]
      L7_2.avatar = A3_2
      L7_2 = TriggerClientEvent
      L8_2 = "tablet:ambulance:updateCallsign"
      L9_2 = -1
      L10_2 = {}
      L10_2.source = A0_2
      L10_2.identifier = A1_2
      L10_2.callsign = A2_2
      L7_2(L8_2, L9_2, L10_2)
    end
  end
  return L6_2
end
L16_1(L17_1, L18_1)
L16_1 = exports
L17_1 = "SetAmbulanceCallsign"
function L18_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = assert
  L4_2 = type
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L4_2 = "string" == L4_2
  L5_2 = "SetAmbulanceCallsign: identifier must be a string"
  L3_2(L4_2, L5_2)
  L3_2 = assert
  L4_2 = type
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  L4_2 = "string" == L4_2
  L5_2 = "SetAmbulanceCallsign: callsign must be a string"
  L3_2(L4_2, L5_2)
  if not A2_2 then
    L3_2 = L13_1
    L4_2 = A1_2
    L3_2 = L3_2(L4_2)
    if not L3_2 then
      L3_2 = infoprint
      L4_2 = "warning"
      L5_2 = "SetAmbulanceCallsign: Invalid callsign '"
      L6_2 = A1_2
      L7_2 = "'"
      L5_2 = L5_2 .. L6_2 .. L7_2
      L3_2(L4_2, L5_2)
      L3_2 = false
      return L3_2
    end
  end
  L3_2 = MySQL
  L3_2 = L3_2.update
  L4_2 = "UPDATE lbtablet_ambulance_accounts SET callsign = ? WHERE id = ?"
  L5_2 = {}
  L6_2 = A1_2
  L7_2 = A0_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L3_2(L4_2, L5_2)
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  if L3_2 then
    L3_2 = L0_1
    L3_2 = L3_2[A0_2]
    L3_2.callsign = A1_2
    L3_2 = TriggerClientEvent
    L4_2 = "tablet:ambulance:updateCallsign"
    L5_2 = -1
    L6_2 = {}
    L7_2 = source
    L6_2.source = L7_2
    L6_2.identifier = A0_2
    L6_2.callsign = A1_2
    L3_2(L4_2, L5_2, L6_2)
  end
  L3_2 = true
  return L3_2
end
L16_1(L17_1, L18_1)
function L16_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L6_2 = MySQL
  L6_2 = L6_2.insert
  L7_2 = "INSERT INTO lbtablet_ambulance_logs (created_by, related_id, log_type, log_action, title, content) VALUES (?, ?, ?, ?, ?, ?)"
  L8_2 = {}
  L9_2 = A0_2
  L10_2 = tostring
  L11_2 = A1_2
  L10_2 = L10_2(L11_2)
  L11_2 = A3_2
  L12_2 = A2_2
  L13_2 = A4_2
  L14_2 = A5_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L8_2[4] = L12_2
  L8_2[5] = L13_2
  L8_2[6] = L14_2
  L6_2(L7_2, L8_2)
  L6_2 = GetSourceFromIdentifier
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  if L6_2 then
    if "create" == A2_2 or "update" == A2_2 then
      L7_2 = "info"
      if L7_2 then
        goto lbl_29
      end
    end
    L7_2 = "warning"
    ::lbl_29::
    L8_2 = Log
    L9_2 = L6_2
    L10_2 = "Ambulance"
    L11_2 = L7_2
    L12_2 = A4_2
    L13_2 = {}
    L13_2.relatedId = A1_2
    L13_2.logType = A3_2
    L13_2.action = A2_2
    L13_2.content = A5_2
    L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  end
end
L17_1 = L10_1
L18_1 = "getLogs"
function L19_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L4_2 = HasPermission
  L5_2 = A0_2
  L6_2 = "Ambulance"
  L7_2 = "logs"
  L8_2 = "view"
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if not L4_2 then
    L4_2 = {}
    return L4_2
  end
  L4_2 = [[
        SELECT
            l.log_id, l.related_id, l.created_by, l.log_type, l.log_action, l.title, l.content, l.created_at,
            a.display_name, a.avatar
        FROM lbtablet_ambulance_logs l
        LEFT JOIN lbtablet_ambulance_accounts a ON a.id = l.created_by
        %s
        ORDER BY l.log_id DESC
        LIMIT 10
    ]]
  L5_2 = {}
  if A3_2 then
    L6_2 = #L5_2
    L6_2 = L6_2 + 1
    L5_2[L6_2] = A3_2
  end
  if A2_2 then
    L6_2 = #L5_2
    L6_2 = L6_2 + 1
    L7_2 = "%"
    L8_2 = A2_2
    L9_2 = "%"
    L7_2 = L7_2 .. L8_2 .. L9_2
    L5_2[L6_2] = L7_2
    L6_2 = #L5_2
    L6_2 = L6_2 + 1
    L7_2 = "%"
    L8_2 = A2_2
    L9_2 = "%"
    L7_2 = L7_2 .. L8_2 .. L9_2
    L5_2[L6_2] = L7_2
  end
  if A3_2 and A2_2 then
    L7_2 = L4_2
    L6_2 = L4_2.format
    L8_2 = "WHERE l.log_id < ? AND (l.title LIKE ? OR l.content LIKE ?)"
    L6_2 = L6_2(L7_2, L8_2)
    L4_2 = L6_2
  elseif A3_2 then
    L7_2 = L4_2
    L6_2 = L4_2.format
    L8_2 = "WHERE l.log_id < ?"
    L6_2 = L6_2(L7_2, L8_2)
    L4_2 = L6_2
  elseif A2_2 then
    L7_2 = L4_2
    L6_2 = L4_2.format
    L8_2 = "WHERE l.title LIKE ? OR l.content LIKE ?"
    L6_2 = L6_2(L7_2, L8_2)
    L4_2 = L6_2
  else
    L7_2 = L4_2
    L6_2 = L4_2.format
    L8_2 = ""
    L6_2 = L6_2(L7_2, L8_2)
    L4_2 = L6_2
  end
  L6_2 = MySQL
  L6_2 = L6_2.query
  L6_2 = L6_2.await
  L7_2 = L4_2
  L8_2 = L5_2
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = 1
  L8_2 = #L6_2
  L9_2 = 1
  for L10_2 = L7_2, L8_2, L9_2 do
    L11_2 = L6_2[L10_2]
    L12_2 = {}
    L13_2 = L11_2.display_name
    if not L13_2 then
      L13_2 = "??"
    end
    L12_2.username = L13_2
    L13_2 = L11_2.avatar
    L12_2.avatar = L13_2
    L13_2 = L11_2.created_by
    L12_2.identifier = L13_2
    L13_2 = L11_2.log_id
    L12_2.id = L13_2
    L13_2 = L11_2.related_id
    L12_2.relatedId = L13_2
    L13_2 = L11_2.log_type
    L12_2.type = L13_2
    L13_2 = L11_2.log_action
    L12_2.action = L13_2
    L13_2 = L11_2.title
    L12_2.title = L13_2
    L13_2 = L11_2.content
    L12_2.description = L13_2
    L13_2 = L11_2.created_at
    L12_2.timestamp = L13_2
    L6_2[L10_2] = L12_2
  end
  return L6_2
end
L20_1 = {}
L17_1(L18_1, L19_1, L20_1)
L17_1 = L10_1
L18_1 = "getConditions"
function L19_1(A0_2, A1_2)
  local L2_2
  L2_2 = L4_1
  return L2_2
end
L17_1(L18_1, L19_1)
L17_1 = L10_1
L18_1 = "addConditionCategory"
function L19_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = HasPermission
  L4_2 = A0_2
  L5_2 = "Ambulance"
  L6_2 = "condition"
  L7_2 = "create"
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  if not L3_2 then
    L3_2 = debugprint
    L4_2 = "No permissions to create category"
    L3_2(L4_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = MySQL
  L3_2 = L3_2.scalar
  L3_2 = L3_2.await
  L4_2 = "SELECT 1 FROM lbtablet_ambulance_conditions_categories WHERE title = ?"
  L5_2 = {}
  L6_2 = A2_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L3_2 = debugprint
    L4_2 = "Category already exists"
    L3_2(L4_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = MySQL
  L3_2 = L3_2.insert
  L3_2 = L3_2.await
  L4_2 = "INSERT INTO lbtablet_ambulance_conditions_categories (title) VALUES (?) "
  L5_2 = {}
  L6_2 = A2_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L4_2 = debugprint
    L5_2 = "Failed to insert category"
    L4_2(L5_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = L4_1
  L5_2 = {}
  L4_2[A2_2] = L5_2
  L4_2 = TriggerClientEvent
  L5_2 = "tablet:ambulance:addConditionCategory"
  L6_2 = -1
  L7_2 = A2_2
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L16_1
  L5_2 = A1_2
  L6_2 = L3_2
  L7_2 = "create"
  L8_2 = "condition_category"
  L9_2 = L
  L10_2 = "BACKEND.AMBULANCE.LOGS.CREATE_CONDITION_CATEGORY.TITLE"
  L9_2 = L9_2(L10_2)
  L10_2 = L
  L11_2 = "BACKEND.AMBULANCE.LOGS.CREATE_CONDITION_CATEGORY.DESCRIPTION"
  L12_2 = {}
  L12_2.name = A2_2
  L10_2, L11_2, L12_2 = L10_2(L11_2, L12_2)
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  L4_2 = true
  return L4_2
end
L20_1 = nil
L21_1 = true
L17_1(L18_1, L19_1, L20_1, L21_1)
L17_1 = L10_1
L18_1 = "updateConditionCategory"
function L19_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L4_2 = HasPermission
  L5_2 = A0_2
  L6_2 = "Ambulance"
  L7_2 = "condition"
  L8_2 = "edit"
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if not L4_2 then
    L4_2 = debugprint
    L5_2 = "No permissions to edit category"
    L4_2(L5_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = L4_1
  L4_2 = L4_2[A2_2]
  if not L4_2 then
    L4_2 = debugprint
    L5_2 = "Old category doesn't exist"
    L4_2(L5_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = MySQL
  L4_2 = L4_2.update
  L4_2 = L4_2.await
  L5_2 = "UPDATE lbtablet_ambulance_conditions_categories SET title = ? WHERE title = ?"
  L6_2 = {}
  L7_2 = A3_2
  L8_2 = A2_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L4_2 = L4_2(L5_2, L6_2)
  L4_2 = L4_2 > 0
  if not L4_2 then
    L5_2 = debugprint
    L6_2 = "Failed to change condition category title"
    L5_2(L6_2)
    L5_2 = false
    return L5_2
  end
  L5_2 = L4_1
  L6_2 = L4_1
  L6_2 = L6_2[A2_2]
  L5_2[A3_2] = L6_2
  L5_2 = L4_1
  L5_2[A2_2] = nil
  L5_2 = TriggerClientEvent
  L6_2 = "tablet:ambulance:updateConditionCategory"
  L7_2 = -1
  L8_2 = A2_2
  L9_2 = A3_2
  L5_2(L6_2, L7_2, L8_2, L9_2)
  L5_2 = L16_1
  L6_2 = A1_2
  L7_2 = A2_2
  L8_2 = "update"
  L9_2 = "condition_category"
  L10_2 = L
  L11_2 = "BACKEND.AMBULANCE.LOGS.UPDATE_CONDITION_CATEGORY.TITLE"
  L10_2 = L10_2(L11_2)
  L11_2 = L
  L12_2 = "BACKEND.AMBULANCE.LOGS.UPDATE_CONDITION_CATEGORY.DESCRIPTION"
  L13_2 = {}
  L13_2.oldName = A2_2
  L13_2.newName = A3_2
  L11_2, L12_2, L13_2 = L11_2(L12_2, L13_2)
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L5_2 = true
  return L5_2
end
L20_1 = nil
L21_1 = true
L17_1(L18_1, L19_1, L20_1, L21_1)
L17_1 = L10_1
L18_1 = "deleteConditionCategory"
function L19_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = HasPermission
  L4_2 = A0_2
  L5_2 = "Ambulance"
  L6_2 = "condition"
  L7_2 = "delete"
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  if not L3_2 then
    L3_2 = debugprint
    L4_2 = "No permissions to delete category"
    L3_2(L4_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = L4_1
  L3_2 = L3_2[A2_2]
  if not L3_2 then
    L3_2 = debugprint
    L4_2 = "Category does not exist"
    L3_2(L4_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = L4_1
  L3_2 = L3_2[A2_2]
  L3_2 = #L3_2
  if L3_2 > 0 then
    L3_2 = debugprint
    L4_2 = "Category is not empty"
    L3_2(L4_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = "DELETE FROM lbtablet_ambulance_conditions_categories WHERE title = ?"
  L5_2 = {}
  L6_2 = A2_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  L3_2 = L3_2 > 0
  if L3_2 then
    L4_2 = L4_1
    L4_2[A2_2] = nil
    L4_2 = TriggerClientEvent
    L5_2 = "tablet:ambulance:deleteConditionCategory"
    L6_2 = -1
    L7_2 = A2_2
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = L16_1
    L5_2 = A1_2
    L6_2 = A2_2
    L7_2 = "delete"
    L8_2 = "condition_category"
    L9_2 = L
    L10_2 = "BACKEND.AMBULANCE.LOGS.DELETE_CONDITION_CATEGORY.TITLE"
    L9_2 = L9_2(L10_2)
    L10_2 = L
    L11_2 = "BACKEND.AMBULANCE.LOGS.DELETE_CONDITION_CATEGORY.DESCRIPTION"
    L12_2 = {}
    L12_2.name = A2_2
    L10_2, L11_2, L12_2 = L10_2(L11_2, L12_2)
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  end
  return L3_2
end
L20_1 = nil
L21_1 = true
L17_1(L18_1, L19_1, L20_1, L21_1)
L17_1 = L10_1
L18_1 = "addCondition"
function L19_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L5_2 = HasPermission
  L6_2 = A0_2
  L7_2 = "Ambulance"
  L8_2 = "condition"
  L9_2 = "create"
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  if not L5_2 then
    L5_2 = debugprint
    L6_2 = "No permissions to create condition"
    L5_2(L6_2)
    L5_2 = false
    return L5_2
  end
  L5_2 = Config
  L5_2 = L5_2.Ambulance
  L5_2 = L5_2.Severities
  L5_2 = L5_2[A4_2]
  if not L5_2 then
    L5_2 = debugprint
    L6_2 = "Invalid severity"
    L7_2 = A4_2
    L5_2(L6_2, L7_2)
    L5_2 = false
    return L5_2
  end
  L5_2 = MySQL
  L5_2 = L5_2.scalar
  L5_2 = L5_2.await
  L6_2 = "SELECT id FROM lbtablet_ambulance_conditions_categories WHERE title = ?"
  L7_2 = {}
  L8_2 = A2_2
  L7_2[1] = L8_2
  L5_2 = L5_2(L6_2, L7_2)
  if L5_2 then
    L6_2 = L4_1
    L6_2 = L6_2[A2_2]
    if L6_2 then
      goto lbl_46
    end
  end
  L6_2 = debugprint
  L7_2 = "Category does not exist"
  L6_2(L7_2)
  L6_2 = false
  do return L6_2 end
  ::lbl_46::
  L6_2 = MySQL
  L6_2 = L6_2.insert
  L6_2 = L6_2.await
  L7_2 = "INSERT INTO lbtablet_ambulance_conditions (severity, category_id, title) VALUES (?, ?, ?)"
  L8_2 = {}
  L9_2 = A4_2
  L10_2 = L5_2
  L11_2 = A3_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L6_2 = L6_2(L7_2, L8_2)
  if not L6_2 then
    L7_2 = debugprint
    L8_2 = "Failed to insert condition"
    L7_2(L8_2)
    L7_2 = false
    return L7_2
  end
  L7_2 = L4_1
  L7_2 = L7_2[A2_2]
  L8_2 = {}
  L8_2.id = L6_2
  L8_2.severity = A4_2
  L8_2.category = A2_2
  L8_2.categoryId = L5_2
  L8_2.title = A3_2
  L9_2 = #L7_2
  L9_2 = L9_2 + 1
  L7_2[L9_2] = L8_2
  L9_2 = TriggerClientEvent
  L10_2 = "tablet:ambulance:addCondition"
  L11_2 = -1
  L12_2 = L8_2
  L9_2(L10_2, L11_2, L12_2)
  L9_2 = L16_1
  L10_2 = A1_2
  L11_2 = L6_2
  L12_2 = "create"
  L13_2 = "condition"
  L14_2 = L
  L15_2 = "BACKEND.AMBULANCE.LOGS.CREATE_CONDITION.TITLE"
  L14_2 = L14_2(L15_2)
  L15_2 = L
  L16_2 = "BACKEND.AMBULANCE.LOGS.CREATE_CONDITION.DESCRIPTION"
  L17_2 = {}
  L17_2.severity = A4_2
  L17_2.name = A3_2
  L17_2.category = A2_2
  L15_2, L16_2, L17_2 = L15_2(L16_2, L17_2)
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  return L6_2
end
L17_1(L18_1, L19_1)
L17_1 = L10_1
L18_1 = "updateCondition"
function L19_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L5_2 = HasPermission
  L6_2 = A0_2
  L7_2 = "Ambulance"
  L8_2 = "condition"
  L9_2 = "edit"
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  if not L5_2 then
    L5_2 = debugprint
    L6_2 = "No permissions to edit condition"
    L5_2(L6_2)
    L5_2 = false
    return L5_2
  end
  L5_2 = Config
  L5_2 = L5_2.Ambulance
  L5_2 = L5_2.Severities
  L5_2 = L5_2[A4_2]
  if not L5_2 then
    L5_2 = debugprint
    L6_2 = "Invalid severity"
    L7_2 = A4_2
    L5_2(L6_2, L7_2)
    L5_2 = false
    return L5_2
  end
  L5_2 = L5_1
  L6_2 = A2_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L6_2 = debugprint
    L7_2 = "updateCondition: invalid condition"
    L8_2 = A2_2
    L6_2(L7_2, L8_2)
    L6_2 = false
    return L6_2
  end
  L5_2.title = A3_2
  L5_2.severity = A4_2
  L6_2 = MySQL
  L6_2 = L6_2.update
  L6_2 = L6_2.await
  L7_2 = [[
        UPDATE lbtablet_ambulance_conditions
        SET severity = ?, title = ?
        WHERE id = ?
    ]]
  L8_2 = {}
  L9_2 = A4_2
  L10_2 = A3_2
  L11_2 = A2_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L6_2 = L6_2(L7_2, L8_2)
  L6_2 = L6_2 > 0
  if not L6_2 then
    L7_2 = debugprint
    L8_2 = "Failed to update condition"
    L7_2(L8_2)
    L7_2 = false
    return L7_2
  end
  L7_2 = TriggerClientEvent
  L8_2 = "tablet:ambulance:updateCondition"
  L9_2 = -1
  L10_2 = L5_2
  L7_2(L8_2, L9_2, L10_2)
  L7_2 = L16_1
  L8_2 = A1_2
  L9_2 = A2_2
  L10_2 = "update"
  L11_2 = "condition"
  L12_2 = L
  L13_2 = "BACKEND.AMBULANCE.LOGS.UPDATE_CONDITION.TITLE"
  L12_2 = L12_2(L13_2)
  L13_2 = L
  L14_2 = "BACKEND.AMBULANCE.LOGS.UPDATE_CONDITION.DESCRIPTION"
  L15_2 = {}
  L15_2.name = A3_2
  L15_2.severity = A4_2
  L16_2 = L5_2.category
  L15_2.category = L16_2
  L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2, L15_2)
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  L7_2 = true
  return L7_2
end
L20_1 = nil
L21_1 = true
L17_1(L18_1, L19_1, L20_1, L21_1)
L17_1 = L10_1
L18_1 = "deleteCondition"
function L19_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L3_2 = HasPermission
  L4_2 = A0_2
  L5_2 = "Ambulance"
  L6_2 = "condition"
  L7_2 = "delete"
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  if not L3_2 then
    L3_2 = debugprint
    L4_2 = "No permissions to delete condition"
    L3_2(L4_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = L5_1
  L4_2 = A2_2
  L3_2, L4_2 = L3_2(L4_2)
  if not L3_2 then
    L5_2 = debugprint
    L6_2 = "Condition does not exist"
    L5_2(L6_2)
    L5_2 = false
    return L5_2
  end
  L5_2 = MySQL
  L5_2 = L5_2.update
  L5_2 = L5_2.await
  L6_2 = "DELETE FROM lbtablet_ambulance_conditions WHERE id = ?"
  L7_2 = {}
  L8_2 = A2_2
  L7_2[1] = L8_2
  L5_2 = L5_2(L6_2, L7_2)
  L5_2 = L5_2 > 0
  if L5_2 then
    L7_2 = L3_2.category
    L6_2 = L4_1
    L6_2 = L6_2[L7_2]
    L7_2 = table
    L7_2 = L7_2.remove
    L8_2 = L6_2
    L9_2 = L4_2
    L7_2(L8_2, L9_2)
    L7_2 = TriggerClientEvent
    L8_2 = "tablet:ambulance:deleteCondition"
    L9_2 = -1
    L10_2 = A2_2
    L7_2(L8_2, L9_2, L10_2)
    L7_2 = L16_1
    L8_2 = A1_2
    L9_2 = A2_2
    L10_2 = "delete"
    L11_2 = "condition"
    L12_2 = L
    L13_2 = "BACKEND.AMBULANCE.LOGS.DELETE_CONDITION.TITLE"
    L12_2 = L12_2(L13_2)
    L13_2 = L
    L14_2 = "BACKEND.AMBULANCE.LOGS.DELETE_CONDITION.DESCRIPTION"
    L15_2 = {}
    L16_2 = L3_2.category
    L15_2.category = L16_2
    L16_2 = L3_2.title
    L15_2.name = L16_2
    L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2, L15_2)
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  end
  return L5_2
end
L20_1 = nil
L21_1 = true
L17_1(L18_1, L19_1, L20_1, L21_1)
L17_1 = L10_1
L18_1 = "getBulletinBoard"
function L19_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if not A2_2 then
    A2_2 = 0
  end
  if "" ~= A3_2 then
    L4_2 = type
    L5_2 = A3_2
    L4_2 = L4_2(L5_2)
    if "string" == L4_2 then
      goto lbl_12
    end
  end
  A3_2 = nil
  ::lbl_12::
  L4_2 = {}
  if A3_2 then
    L5_2 = #L4_2
    L5_2 = L5_2 + 1
    L6_2 = "%"
    L7_2 = A3_2
    L8_2 = "%"
    L6_2 = L6_2 .. L7_2 .. L8_2
    L4_2[L5_2] = L6_2
  end
  L5_2 = #L4_2
  L5_2 = L5_2 + 1
  L6_2 = A2_2 * 25
  L4_2[L5_2] = L6_2
  L5_2 = #L4_2
  L5_2 = L5_2 + 1
  L4_2[L5_2] = 25
  L5_2 = [[
        SELECT
            b.id, b.title, b.content, b.pinned, b.created_at AS `timestamp`, b.created_by AS created,
            a.display_name AS author, a.avatar
        FROM lbtablet_ambulance_bulletin b
        LEFT JOIN lbtablet_ambulance_accounts a ON a.id = b.created_by
    ]]
  if A3_2 then
    L6_2 = "WHERE b.title LIKE ?"
    if L6_2 then
      goto lbl_41
    end
  end
  L6_2 = ""
  ::lbl_41::
  L7_2 = [[
        ORDER BY pinned DESC, created_at DESC
        LIMIT ?, ?
    ]]
  L5_2 = L5_2 .. L6_2 .. L7_2
  L6_2 = MySQL
  L6_2 = L6_2.query
  L6_2 = L6_2.await
  L7_2 = L5_2
  L8_2 = L4_2
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = 1
  L8_2 = #L6_2
  L9_2 = 1
  for L10_2 = L7_2, L8_2, L9_2 do
    L11_2 = L6_2[L10_2]
    L12_2 = L11_2.created
    L12_2 = L12_2 == A1_2
    L11_2.created = L12_2
  end
  return L6_2
end
L17_1(L18_1, L19_1)
L17_1 = L10_1
L18_1 = "toggleBulletinPinned"
function L19_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L4_2 = HasPermission
  L5_2 = A0_2
  L6_2 = "Ambulance"
  L7_2 = "bulletin"
  L8_2 = "pin"
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if not L4_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = MySQL
  L4_2 = L4_2.update
  L4_2 = L4_2.await
  L5_2 = "UPDATE lbtablet_ambulance_bulletin SET pinned = ? WHERE id = ?"
  L6_2 = {}
  L7_2 = A3_2
  L8_2 = A2_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L4_2 = L4_2(L5_2, L6_2)
  L4_2 = L4_2 > 0
  if L4_2 and A3_2 then
    L5_2 = L16_1
    L6_2 = A1_2
    L7_2 = A2_2
    L8_2 = "update"
    L9_2 = "bulletin"
    L10_2 = L
    L11_2 = "BACKEND.AMBULANCE.LOGS.PIN_BULLETIN.TITLE"
    L10_2 = L10_2(L11_2)
    L11_2 = L
    L12_2 = "BACKEND.AMBULANCE.LOGS.PIN_BULLETIN.DESCRIPTION"
    L13_2 = {}
    L13_2.id = A2_2
    L11_2, L12_2, L13_2 = L11_2(L12_2, L13_2)
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  elseif L4_2 then
    L5_2 = L16_1
    L6_2 = A1_2
    L7_2 = A2_2
    L8_2 = "update"
    L9_2 = "bulletin"
    L10_2 = L
    L11_2 = "BACKEND.AMBULANCE.LOGS.UNPIN_BULLETIN.TITLE"
    L10_2 = L10_2(L11_2)
    L11_2 = L
    L12_2 = "BACKEND.AMBULANCE.LOGS.UNPIN_BULLETIN.DESCRIPTION"
    L13_2 = {}
    L13_2.id = A2_2
    L11_2, L12_2, L13_2 = L11_2(L12_2, L13_2)
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  end
  return L4_2
end
L17_1(L18_1, L19_1)
function L17_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L5_2 = HasPermission
  L6_2 = A0_2
  L7_2 = "Ambulance"
  L8_2 = "bulletin"
  L9_2 = "edit"
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  if not L5_2 then
    L5_2 = MySQL
    L5_2 = L5_2.scalar
    L5_2 = L5_2.await
    L6_2 = "SELECT created_by FROM lbtablet_ambulance_bulletin WHERE id = ?"
    L7_2 = {}
    L8_2 = A2_2
    L7_2[1] = L8_2
    L5_2 = L5_2(L6_2, L7_2)
    if L5_2 ~= A1_2 then
      L5_2 = debugprint
      L6_2 = "No permissions to edit bulletin"
      L5_2(L6_2)
      L5_2 = false
      return L5_2
    end
  end
  L5_2 = MySQL
  L5_2 = L5_2.update
  L5_2 = L5_2.await
  L6_2 = "UPDATE lbtablet_ambulance_bulletin SET title = ?, content = ? WHERE id = ?"
  L7_2 = {}
  L8_2 = A3_2
  L9_2 = A4_2
  L10_2 = A2_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L5_2(L6_2, L7_2)
  L5_2 = L16_1
  L6_2 = A1_2
  L7_2 = A2_2
  L8_2 = "create"
  L9_2 = "bulletin"
  L10_2 = L
  L11_2 = "BACKEND.AMBULANCE.LOGS.UPDATE_BULLETIN.TITLE"
  L10_2 = L10_2(L11_2)
  L11_2 = L
  L12_2 = "BACKEND.AMBULANCE.LOGS.UPDATE_BULLETIN.DESCRIPTION"
  L13_2 = {}
  L13_2.title = A3_2
  L11_2, L12_2, L13_2 = L11_2(L12_2, L13_2)
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L5_2 = TriggerClientEvent
  L6_2 = "tablet:ambulance:bulletinUpdated"
  L7_2 = -1
  L8_2 = {}
  L8_2.id = A2_2
  L8_2.title = A3_2
  L8_2.content = A4_2
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = true
  return L5_2
end
function L18_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L4_2 = HasPermission
  L5_2 = A0_2
  L6_2 = "Ambulance"
  L7_2 = "bulletin"
  L8_2 = "create"
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if not L4_2 then
    L4_2 = debugprint
    L5_2 = "No permissions to create bulletin"
    L4_2(L5_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = MySQL
  L4_2 = L4_2.insert
  L4_2 = L4_2.await
  L5_2 = "INSERT INTO lbtablet_ambulance_bulletin (title, content, created_by) VALUES (?, ?, ?)"
  L6_2 = {}
  L7_2 = A2_2
  L8_2 = A3_2
  L9_2 = A1_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L5_2 = debugprint
    L6_2 = "Failed to create bulletin"
    L5_2(L6_2)
    L5_2 = false
    return L5_2
  end
  L5_2 = GetCharacterName
  L6_2 = A0_2
  L5_2, L6_2 = L5_2(L6_2)
  L7_2 = L5_2
  L8_2 = " "
  L9_2 = L6_2
  L7_2 = L7_2 .. L8_2 .. L9_2
  L8_2 = Config
  L8_2 = L8_2.Ambulance
  L8_2 = L8_2.Notifications
  L8_2 = L8_2.NewBulletin
  if L8_2 then
    L8_2 = L9_1
    L9_2 = {}
    L10_2 = L
    L11_2 = "BACKEND.AMBULANCE.NOTIFICATIONS.NEW_BULLETIN.TITLE"
    L10_2 = L10_2(L11_2)
    L9_2.title = L10_2
    L10_2 = L
    L11_2 = "BACKEND.AMBULANCE.NOTIFICATIONS.NEW_BULLETIN.CONTENT"
    L12_2 = {}
    L12_2.title = A2_2
    L12_2.content = A3_2
    L10_2 = L10_2(L11_2, L12_2)
    L9_2.content = L10_2
    L10_2 = {}
    L11_2 = A1_2
    L10_2[1] = L11_2
    L8_2(L9_2, L10_2)
  end
  L8_2 = L16_1
  L9_2 = A1_2
  L10_2 = L4_2
  L11_2 = "create"
  L12_2 = "bulletin"
  L13_2 = L
  L14_2 = "BACKEND.AMBULANCE.LOGS.CREATE_BULLETIN.TITLE"
  L13_2 = L13_2(L14_2)
  L14_2 = L
  L15_2 = "BACKEND.AMBULANCE.LOGS.CREATE_BULLETIN.DESCRIPTION"
  L16_2 = {}
  L16_2.title = A2_2
  L14_2, L15_2, L16_2 = L14_2(L15_2, L16_2)
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  L8_2 = TriggerClientEvent
  L9_2 = "tablet:ambulance:bulletinCreated"
  L10_2 = -1
  L11_2 = {}
  L11_2.id = L4_2
  L11_2.title = A2_2
  L11_2.content = A3_2
  L12_2 = os
  L12_2 = L12_2.time
  L12_2 = L12_2()
  L12_2 = L12_2 * 1000
  L11_2.timestamp = L12_2
  L11_2.createdBy = A1_2
  L11_2.author = L7_2
  L12_2 = GetAmbulanceAvatar
  L13_2 = A1_2
  L12_2 = L12_2(L13_2)
  L11_2.avatar = L12_2
  L8_2(L9_2, L10_2, L11_2)
  return L4_2
end
L19_1 = L10_1
L20_1 = "saveBulletin"
function L21_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A2_2 then
    L5_2 = L17_1
    L6_2 = A0_2
    L7_2 = A1_2
    L8_2 = A2_2
    L9_2 = A3_2
    L10_2 = A4_2
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
    if L5_2 then
      return A2_2
    end
    L5_2 = false
    return L5_2
  end
  L5_2 = L18_1
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = A3_2
  L9_2 = A4_2
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  A2_2 = L5_2
  L5_2 = A2_2 or L5_2
  if not A2_2 then
    L5_2 = false
  end
  return L5_2
end
L22_1 = nil
L23_1 = true
L19_1(L20_1, L21_1, L22_1, L23_1)
L19_1 = L10_1
L20_1 = "deleteBulletin"
function L21_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = nil
  L4_2 = HasPermission
  L5_2 = A0_2
  L6_2 = "Ambulance"
  L7_2 = "bulletin"
  L8_2 = "delete"
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if L4_2 then
    L4_2 = MySQL
    L4_2 = L4_2.update
    L4_2 = L4_2.await
    L5_2 = "DELETE FROM lbtablet_ambulance_bulletin WHERE id = ?"
    L6_2 = {}
    L7_2 = A2_2
    L6_2[1] = L7_2
    L4_2 = L4_2(L5_2, L6_2)
    L3_2 = L4_2 > 0
  else
    L4_2 = MySQL
    L4_2 = L4_2.update
    L4_2 = L4_2.await
    L5_2 = "DELETE FROM lbtablet_ambulance_bulletin WHERE id = ? AND created_by = ?"
    L6_2 = {}
    L7_2 = A2_2
    L8_2 = A1_2
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L4_2 = L4_2(L5_2, L6_2)
    L3_2 = L4_2 > 0
  end
  if L3_2 then
    L4_2 = TriggerClientEvent
    L5_2 = "tablet:ambulance:bulletinDeleted"
    L6_2 = -1
    L7_2 = A2_2
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = L16_1
    L5_2 = A1_2
    L6_2 = A2_2
    L7_2 = "delete"
    L8_2 = "bulletin"
    L9_2 = L
    L10_2 = "BACKEND.AMBULANCE.LOGS.DELETE_BULLETIN.TITLE"
    L9_2 = L9_2(L10_2)
    L10_2 = L
    L11_2 = "BACKEND.AMBULANCE.LOGS.DELETE_BULLETIN.DESCRIPTION"
    L12_2 = {}
    L12_2.id = A2_2
    L10_2, L11_2, L12_2 = L10_2(L11_2, L12_2)
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  end
  return L3_2
end
L19_1(L20_1, L21_1)
L19_1 = L10_1
L20_1 = "getUnreadChats"
function L21_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = GetUndreadChatNotifications
  L3_2 = "ambulance"
  L4_2 = A1_2
  return L2_2(L3_2, L4_2)
end
L19_1(L20_1, L21_1)
L19_1 = L10_1
L20_1 = "getPublicChatRooms"
function L21_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = GetPublicChatRooms
  L5_2 = "ambulance"
  L6_2 = A1_2
  L7_2 = A2_2
  L8_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2)
end
L19_1(L20_1, L21_1)
L19_1 = L10_1
L20_1 = "getChatRooms"
function L21_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = GetChatRooms
  L5_2 = "ambulance"
  L6_2 = A1_2
  L7_2 = A2_2
  L8_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2)
end
L19_1(L20_1, L21_1)
L19_1 = L10_1
L20_1 = "createChat"
function L21_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = HasPermission
  L5_2 = A0_2
  L6_2 = "Ambulance"
  L7_2 = "chat"
  L8_2 = "create"
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if not L4_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = CreateChatRoom
  L5_2 = "ambulance"
  L6_2 = A1_2
  L7_2 = A2_2
  L8_2 = A3_2
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if not A3_2 then
    L5_2 = Config
    L5_2 = L5_2.Ambulance
    L5_2 = L5_2.Notifications
    L5_2 = L5_2.NewChat
    if L5_2 then
      L5_2 = L9_1
      L6_2 = {}
      L7_2 = L
      L8_2 = "BACKEND.AMBULANCE.NOTIFICATIONS.CHAT.NEW_CHANNEL.TITLE"
      L7_2 = L7_2(L8_2)
      L6_2.title = L7_2
      L7_2 = L
      L8_2 = "BACKEND.AMBULANCE.NOTIFICATIONS.CHAT.NEW_CHANNEL.CONTENT"
      L9_2 = {}
      L9_2.channel = A2_2
      L7_2 = L7_2(L8_2, L9_2)
      L6_2.content = L7_2
      L7_2 = {}
      L8_2 = A1_2
      L7_2[1] = L8_2
      L5_2(L6_2, L7_2)
    end
  end
  return L4_2
end
L22_1 = nil
L23_1 = true
L19_1(L20_1, L21_1, L22_1, L23_1)
L19_1 = L10_1
L20_1 = "toggleChatPrivate"
function L21_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = MySQL
  L4_2 = L4_2.scalar
  L4_2 = L4_2.await
  L5_2 = "SELECT creator FROM lbtablet_chat_rooms WHERE id = ?"
  L6_2 = {}
  L7_2 = A2_2
  L6_2[1] = L7_2
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 ~= A1_2 then
    L5_2 = HasPermission
    L6_2 = A0_2
    L7_2 = "Ambulance"
    L8_2 = "chat"
    L9_2 = "edit"
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    if not L5_2 then
      L5_2 = false
      return L5_2
    end
  end
  A3_2 = true == A3_2
  L5_2 = ToggleChatRoomPrivate
  L6_2 = A2_2
  L7_2 = A3_2
  return L5_2(L6_2, L7_2)
end
L19_1(L20_1, L21_1)
L19_1 = L10_1
L20_1 = "setChatIcon"
function L21_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = MySQL
  L4_2 = L4_2.scalar
  L4_2 = L4_2.await
  L5_2 = "SELECT creator FROM lbtablet_chat_rooms WHERE id = ?"
  L6_2 = {}
  L7_2 = A2_2
  L6_2[1] = L7_2
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 ~= A1_2 then
    L5_2 = HasPermission
    L6_2 = A0_2
    L7_2 = "Ambulance"
    L8_2 = "chat"
    L9_2 = "edit"
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    if not L5_2 then
      L5_2 = false
      return L5_2
    end
  end
  L5_2 = SetChatRoomIcon
  L6_2 = A2_2
  L7_2 = A3_2
  return L5_2(L6_2, L7_2)
end
L19_1(L20_1, L21_1)
L19_1 = L10_1
L20_1 = "getChatMembers"
function L21_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = GetChatRoomMembers
  L4_2 = "ambulance"
  L5_2 = A2_2
  return L3_2(L4_2, L5_2)
end
L19_1(L20_1, L21_1)
L19_1 = L10_1
L20_1 = "inviteToChat"
function L21_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if A3_2 == A1_2 then
    L4_2 = debugprint
    L5_2 = "Can't invite self to chat"
    L4_2(L5_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = MySQL
  L4_2 = L4_2.scalar
  L4_2 = L4_2.await
  L5_2 = "SELECT 1 FROM lbtablet_chat_rooms_members WHERE room_id = ? AND account = ?"
  L6_2 = {}
  L7_2 = A2_2
  L8_2 = A1_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L4_2 = debugprint
    L5_2 = "User not in chat"
    L4_2(L5_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = MySQL
  L4_2 = L4_2.scalar
  L4_2 = L4_2.await
  L5_2 = "SELECT creator FROM lbtablet_chat_rooms WHERE id = ?"
  L6_2 = {}
  L7_2 = A2_2
  L6_2[1] = L7_2
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 ~= A1_2 then
    L5_2 = HasPermission
    L6_2 = A0_2
    L7_2 = "Ambulance"
    L8_2 = "chat"
    L9_2 = "invite"
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    if not L5_2 then
      L5_2 = false
      return L5_2
    end
  end
  L5_2 = AddToChatRoom
  L6_2 = "ambulance"
  L7_2 = A2_2
  L8_2 = A3_2
  return L5_2(L6_2, L7_2, L8_2)
end
L19_1(L20_1, L21_1)
L19_1 = L10_1
L20_1 = "kickFromChat"
function L21_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if A3_2 == A1_2 then
    L4_2 = debugprint
    L5_2 = "Can't kick self from chat"
    L4_2(L5_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = MySQL
  L4_2 = L4_2.scalar
  L4_2 = L4_2.await
  L5_2 = "SELECT creator FROM lbtablet_chat_rooms WHERE id = ?"
  L6_2 = {}
  L7_2 = A2_2
  L6_2[1] = L7_2
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 ~= A1_2 then
    L5_2 = HasPermission
    L6_2 = A0_2
    L7_2 = "Ambulance"
    L8_2 = "chat"
    L9_2 = "kick"
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    if not L5_2 then
      L5_2 = false
      return L5_2
    end
  end
  L5_2 = RemoveMemberFromChatRoom
  L6_2 = A2_2
  L7_2 = A3_2
  return L5_2(L6_2, L7_2)
end
L19_1(L20_1, L21_1)
L19_1 = L10_1
L20_1 = "joinChat"
function L21_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = MySQL
  L3_2 = L3_2.scalar
  L3_2 = L3_2.await
  L4_2 = "SELECT private FROM lbtablet_chat_rooms WHERE id = ?"
  L5_2 = {}
  L6_2 = A2_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = MySQL
  L4_2 = L4_2.update
  L4_2 = L4_2.await
  L5_2 = "INSERT INTO lbtablet_chat_rooms_members (room_id, account) VALUES (?, ?) ON DUPLICATE KEY UPDATE account = ?"
  L6_2 = {}
  L7_2 = A2_2
  L8_2 = A1_2
  L9_2 = A1_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L4_2 = L4_2(L5_2, L6_2)
  L4_2 = L4_2 > 0
  return L4_2
end
L19_1(L20_1, L21_1)
L19_1 = L10_1
L20_1 = "leaveChat"
function L21_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = LeaveChatRoom
  L4_2 = A1_2
  L5_2 = A2_2
  return L3_2(L4_2, L5_2)
end
L19_1(L20_1, L21_1)
L19_1 = L10_1
L20_1 = "getChatMessages"
function L21_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2
  L4_2 = GetChatMessages
  L5_2 = "ambulance"
  L6_2 = A2_2
  L7_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2)
end
L19_1(L20_1, L21_1)
L19_1 = L10_1
L20_1 = "sendMessage"
function L21_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L5_2 = SendChatMessage
  L6_2 = {}
  L6_2.id = A1_2
  L7_2 = L0_1
  L7_2 = L7_2[A1_2]
  if L7_2 then
    L7_2 = L7_2.name
  end
  if not L7_2 then
    L7_2 = ""
  end
  L6_2.name = L7_2
  L7_2 = L0_1
  L7_2 = L7_2[A1_2]
  if L7_2 then
    L7_2 = L7_2.avatar
  end
  L6_2.avatar = L7_2
  L7_2 = A2_2
  L8_2 = A3_2
  L9_2 = A4_2
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  if not L5_2 then
    L6_2 = false
    return L6_2
  end
  L6_2 = Config
  L6_2 = L6_2.Ambulance
  L6_2 = L6_2.Notifications
  L6_2 = L6_2.ChatMessage
  if L6_2 then
    L6_2 = MySQL
    L6_2 = L6_2.single
    L6_2 = L6_2.await
    L7_2 = "SELECT label, private FROM lbtablet_chat_rooms WHERE id = ?"
    L8_2 = {}
    L9_2 = A2_2
    L8_2[1] = L9_2
    L6_2 = L6_2(L7_2, L8_2)
    if L6_2 then
      L7_2 = {}
      L8_2 = L
      L9_2 = "BACKEND.AMBULANCE.NOTIFICATIONS.CHAT.NEW_MESSAGE.TITLE"
      L10_2 = {}
      L11_2 = L6_2.label
      if not L11_2 then
        L11_2 = ""
      end
      L10_2.channel = L11_2
      L8_2 = L8_2(L9_2, L10_2)
      L7_2.title = L8_2
      L8_2 = L
      L9_2 = "BACKEND.AMBULANCE.NOTIFICATIONS.CHAT.NEW_MESSAGE.CONTENT"
      L10_2 = {}
      L11_2 = A3_2 or L11_2
      if not A3_2 then
        L11_2 = "attachment"
      end
      L10_2.message = L11_2
      L8_2 = L8_2(L9_2, L10_2)
      L7_2.content = L8_2
      L7_2.app = "Ambulance"
      L8_2 = L6_2.private
      if not L8_2 then
        L8_2 = L9_1
        L9_2 = L7_2
        L10_2 = {}
        L11_2 = A1_2
        L10_2[1] = L11_2
        L8_2(L9_2, L10_2)
      else
        L8_2 = MySQL
        L8_2 = L8_2.query
        L8_2 = L8_2.await
        L9_2 = "SELECT account FROM lbtablet_chat_rooms_members WHERE room_id = ? AND account != ?"
        L10_2 = {}
        L11_2 = A2_2
        L12_2 = A1_2
        L10_2[1] = L11_2
        L10_2[2] = L12_2
        L8_2 = L8_2(L9_2, L10_2)
        L9_2 = {}
        L10_2 = 1
        L11_2 = #L8_2
        L12_2 = 1
        for L13_2 = L10_2, L11_2, L12_2 do
          L14_2 = #L9_2
          L14_2 = L14_2 + 1
          L15_2 = L8_2[L13_2]
          L15_2 = L15_2.account
          L9_2[L14_2] = L15_2
        end
        L10_2 = NotifyTablets
        L11_2 = L9_2
        L12_2 = L7_2
        L13_2 = {}
        L14_2 = A1_2
        L13_2[1] = L14_2
        L10_2(L11_2, L12_2, L13_2)
      end
    end
  end
  return L5_2
end
L22_1 = nil
L23_1 = true
L19_1(L20_1, L21_1, L22_1, L23_1)
L19_1 = L10_1
L20_1 = "clearChatNotifications"
function L21_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = "UPDATE lbtablet_chat_rooms_members SET notifications = 0 WHERE room_id = ? AND account = ?"
  L5_2 = {}
  L6_2 = A2_2
  L7_2 = A1_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L3_2 = L3_2(L4_2, L5_2)
  L3_2 = L3_2 > 0
  return L3_2
end
L19_1(L20_1, L21_1)
L19_1 = L10_1
L20_1 = "getDispatches"
function L21_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = GetJobDispatches
  L3_2 = "ambulance"
  return L2_2(L3_2)
end
L19_1(L20_1, L21_1)
L19_1 = L10_1
L20_1 = "getActiveUnits"
function L21_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = {}
  L3_2 = GetOnDutyEmployees
  L4_2 = Config
  L4_2 = L4_2.Ambulance
  L4_2 = L4_2.Permissions
  L3_2 = L3_2(L4_2)
  L4_2 = 1
  L5_2 = #L3_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = L3_2[L7_2]
    L9_2 = {}
    L10_2 = L8_2.source
    L9_2.source = L10_2
    L10_2 = L8_2.name
    L9_2.name = L10_2
    L10_2 = L8_2.rank
    L9_2.rank = L10_2
    L10_2 = GetAmbulanceCallsign
    L11_2 = L8_2.identifier
    L10_2 = L10_2(L11_2)
    L9_2.callsign = L10_2
    L2_2[L7_2] = L9_2
  end
  return L2_2
end
L19_1(L20_1, L21_1)
L19_1 = L10_1
L20_1 = "getUnits"
function L21_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = {}
  L3_2 = GetUnits
  L4_2 = "ambulance"
  L3_2 = L3_2(L4_2)
  L4_2 = pairs
  L5_2 = L3_2
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = #L2_2
    L10_2 = L10_2 + 1
    L2_2[L10_2] = L9_2
  end
  return L2_2
end
L22_1 = {}
L19_1(L20_1, L21_1, L22_1)
L19_1 = L10_1
L20_1 = "addUnit"
function L21_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = HasPermission
  L4_2 = A0_2
  L5_2 = "Ambulance"
  L6_2 = "unit"
  L7_2 = "create"
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  if not L3_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = CreateUnit
  L4_2 = "ambulance"
  L5_2 = A2_2
  L6_2 = Config
  L6_2 = L6_2.Ambulance
  L6_2 = L6_2.DefaultUnitStatus
  return L3_2(L4_2, L5_2, L6_2)
end
L19_1(L20_1, L21_1)
L19_1 = L10_1
L20_1 = "deleteUnit"
function L21_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = HasPermission
  L4_2 = A0_2
  L5_2 = "Ambulance"
  L6_2 = "unit"
  L7_2 = "delete"
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  if not L3_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = RemoveUnit
  L4_2 = "ambulance"
  L5_2 = A2_2
  return L3_2(L4_2, L5_2)
end
L19_1(L20_1, L21_1)
L19_1 = L10_1
L20_1 = "updateUnitStatus"
function L21_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = HasPermission
  L5_2 = A0_2
  L6_2 = "Ambulance"
  L7_2 = "unit"
  L8_2 = "edit"
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if not L4_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = Config
  L4_2 = L4_2.Ambulance
  L4_2 = L4_2.UnitStatuses
  if L4_2 then
    L4_2 = Config
    L4_2 = L4_2.Ambulance
    L4_2 = L4_2.UnitStatuses
    L4_2 = L4_2[A3_2]
    if L4_2 then
      goto lbl_28
    end
  end
  L4_2 = debugprint
  L5_2 = "Invalid unit status"
  L6_2 = A3_2
  L4_2(L5_2, L6_2)
  L4_2 = false
  do return L4_2 end
  ::lbl_28::
  L4_2 = SetUnitStatus
  L5_2 = "ambulance"
  L6_2 = A2_2
  L7_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2)
end
L19_1(L20_1, L21_1)
L19_1 = L10_1
L20_1 = "renameUnit"
function L21_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = HasPermission
  L5_2 = A0_2
  L6_2 = "Ambulance"
  L7_2 = "unit"
  L8_2 = "edit"
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if not L4_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = RenameUnit
  L5_2 = "ambulance"
  L6_2 = A2_2
  L7_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2)
end
L19_1(L20_1, L21_1)
L19_1 = L10_1
L20_1 = "assignOfficerToUnit"
function L21_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = HasPermission
  L5_2 = A0_2
  L6_2 = "Ambulance"
  L7_2 = "unit"
  L8_2 = "edit"
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if not L4_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = GetPlayerName
  L5_2 = A3_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = debugprint
    L5_2 = "Invalid officer source"
    L6_2 = A3_2
    L4_2(L5_2, L6_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = SetPlayerUnit
  L5_2 = A3_2
  L6_2 = "ambulance"
  L7_2 = A2_2
  return L4_2(L5_2, L6_2, L7_2)
end
L19_1(L20_1, L21_1)
L19_1 = L10_1
L20_1 = "removeOfficerFromUnit"
function L21_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = HasPermission
  L4_2 = A0_2
  L5_2 = "Ambulance"
  L6_2 = "unit"
  L7_2 = "edit"
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  if not L3_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = GetPlayerName
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = debugprint
    L4_2 = "Invalid officer source"
    L5_2 = A2_2
    L3_2(L4_2, L5_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = ResetPlayerUnit
  L4_2 = A2_2
  L3_2(L4_2)
  L3_2 = true
  return L3_2
end
L19_1(L20_1, L21_1)
function L19_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = MySQL
  L3_2 = L3_2.query
  L3_2 = L3_2.await
  L4_2 = "SELECT tag_id FROM "
  L5_2 = A0_2
  L6_2 = " WHERE "
  L7_2 = A1_2
  L8_2 = " = ?"
  L4_2 = L4_2 .. L5_2 .. L6_2 .. L7_2 .. L8_2
  L5_2 = {}
  L6_2 = A2_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = {}
  L5_2 = 1
  L6_2 = #L3_2
  L7_2 = 1
  for L8_2 = L5_2, L6_2, L7_2 do
    L9_2 = L6_1
    L10_2 = L3_2[L8_2]
    L10_2 = L10_2.tag_id
    L9_2 = L9_2(L10_2)
    if L9_2 then
      L10_2 = #L4_2
      L10_2 = L10_2 + 1
      L4_2[L10_2] = L9_2
    end
  end
  return L4_2
end
L20_1 = L10_1
L21_1 = "getTags"
function L22_1(A0_2, A1_2)
  local L2_2
  L2_2 = L3_1
  return L2_2
end
L20_1(L21_1, L22_1)
function L20_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = 1
  L4_2 = L3_1
  L4_2 = #L4_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = L3_1
    L7_2 = L7_2[L6_2]
    L8_2 = L7_2.title
    if L8_2 == A0_2 then
      L8_2 = L7_2.type
      if L8_2 == A2_2 then
        L8_2 = debugprint
        L9_2 = "Tag already exists"
        L8_2(L9_2)
        return
      end
    end
  end
  L3_2 = MySQL
  L3_2 = L3_2.insert
  L3_2 = L3_2.await
  L4_2 = "INSERT INTO lbtablet_ambulance_tags (title, color, tag_type) VALUES (?, ?, ?)"
  L5_2 = {}
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = A2_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L4_2 = {}
    L4_2.id = L3_2
    L4_2.title = A0_2
    L4_2.color = A1_2
    L4_2.type = A2_2
    L5_2 = L3_1
    L5_2 = #L5_2
    L6_2 = L5_2 + 1
    L5_2 = L3_1
    L5_2[L6_2] = L4_2
    L5_2 = TriggerClientEvent
    L6_2 = "tablet:ambulance:createdTag"
    L7_2 = -1
    L8_2 = L4_2
    L5_2(L6_2, L7_2, L8_2)
  end
  return L3_2
end
L21_1 = L10_1
L22_1 = "createTag"
function L23_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2
  L5_2 = HasPermission
  L6_2 = A0_2
  L7_2 = "Ambulance"
  L8_2 = "tag"
  L9_2 = "create"
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  if not L5_2 then
    L5_2 = debugprint
    L6_2 = "No permissions to create tag"
    L5_2(L6_2)
    L5_2 = false
    return L5_2
  end
  L5_2 = L20_1
  L6_2 = A2_2
  L7_2 = A3_2
  L8_2 = A4_2
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  return L5_2
end
L24_1 = nil
L25_1 = true
L21_1(L22_1, L23_1, L24_1, L25_1)
L21_1 = exports
L22_1 = "CreateAmbulanceTag"
L23_1 = L20_1
L21_1(L22_1, L23_1)
L21_1 = L10_1
L22_1 = "deleteTag"
function L23_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L3_2 = HasPermission
  L4_2 = A0_2
  L5_2 = "Ambulance"
  L6_2 = "tag"
  L7_2 = "delete"
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  if not L3_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = L6_1
  L4_2 = A2_2
  L3_2, L4_2 = L3_2(L4_2)
  if not L3_2 then
    L5_2 = false
    return L5_2
  end
  L5_2 = MySQL
  L5_2 = L5_2.update
  L5_2 = L5_2.await
  L6_2 = "DELETE FROM lbtablet_ambulance_tags WHERE id = ?"
  L7_2 = {}
  L8_2 = A2_2
  L7_2[1] = L8_2
  L5_2 = L5_2(L6_2, L7_2)
  L5_2 = L5_2 > 0
  if not L5_2 then
    L6_2 = false
    return L6_2
  end
  L6_2 = L16_1
  L7_2 = A1_2
  L8_2 = A2_2
  L9_2 = "delete"
  L10_2 = "tag"
  L11_2 = L
  L12_2 = "BACKEND.AMBULANCE.LOGS.DELETE_TAG.TITLE"
  L11_2 = L11_2(L12_2)
  L12_2 = L
  L13_2 = "BACKEND.AMBULANCE.LOGS.DELETE_TAG.DESCRIPTION"
  L14_2 = {}
  L15_2 = L
  L16_2 = "BACKEND.AMBULANCE.TAG_TYPES."
  L17_2 = L3_2.type
  L18_2 = L17_2
  L17_2 = L17_2.upper
  L17_2 = L17_2(L18_2)
  L16_2 = L16_2 .. L17_2
  L15_2 = L15_2(L16_2)
  L14_2.type = L15_2
  L15_2 = L3_2.title
  L14_2.name = L15_2
  L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L12_2(L13_2, L14_2)
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L6_2 = table
  L6_2 = L6_2.remove
  L7_2 = L3_1
  L8_2 = L4_2
  L6_2(L7_2, L8_2)
  L6_2 = TriggerClientEvent
  L7_2 = "tablet:ambulance:deletedTag"
  L8_2 = -1
  L9_2 = A2_2
  L6_2(L7_2, L8_2, L9_2)
  L6_2 = true
  return L6_2
end
L21_1(L22_1, L23_1)
L21_1 = exports
L22_1 = "DeleteAmbulanceTag"
function L23_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = L6_1
  L2_2 = A0_2
  L1_2, L2_2 = L1_2(L2_2)
  if not L1_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = "DELETE FROM lbtablet_ambulance_tags WHERE id = ?"
  L5_2 = {}
  L6_2 = A0_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  L3_2 = L3_2 > 0
  if L3_2 then
    L4_2 = table
    L4_2 = L4_2.remove
    L5_2 = L3_1
    L6_2 = L2_2
    L4_2(L5_2, L6_2)
    L4_2 = TriggerClientEvent
    L5_2 = "tablet:ambulance:deletedTag"
    L6_2 = -1
    L7_2 = A0_2
    L4_2(L5_2, L6_2, L7_2)
  end
  return L3_2
end
L21_1(L22_1, L23_1)
L21_1 = L10_1
L22_1 = "searchUsers"
function L23_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L5_2 = {}
  if A3_2 then
    L6_2 = A3_2.doctorOnly
    if L6_2 then
      L6_2 = L1_1
      L5_2.jobs = L6_2
    end
  end
  L6_2 = SearchUsers
  L7_2 = A2_2 or L7_2
  if not A2_2 then
    L7_2 = ""
  end
  L8_2 = L5_2
  L9_2 = "lbtablet_ambulance_profiles"
  L10_2 = A4_2
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
  L7_2 = 1
  L8_2 = #L6_2
  L9_2 = 1
  for L10_2 = L7_2, L8_2, L9_2 do
    L11_2 = L6_2[L10_2]
    L12_2 = L19_1
    L13_2 = "lbtablet_ambulance_profile_tags"
    L14_2 = "id"
    L15_2 = L11_2.id
    L12_2 = L12_2(L13_2, L14_2, L15_2)
    L11_2.tags = L12_2
  end
  return L6_2
end
L24_1 = {}
L21_1(L22_1, L23_1, L24_1)
L21_1 = L10_1
L22_1 = "fetchProfile"
function L23_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = Queries
  L3_2 = L3_2.Users
  L3_2 = L3_2.FetchProfile
  L5_2 = L3_2
  L4_2 = L3_2.gsub
  L6_2 = "{PROFILE_JOIN}"
  L7_2 = "lbtablet_ambulance_profiles"
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = L4_2
  L4_2 = L4_2.gsub
  L6_2 = "{USERS_COLLATE}"
  L7_2 = UsersCollate
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L3_2 = L4_2
  L4_2 = MySQL
  L4_2 = L4_2.single
  L4_2 = L4_2.await
  L5_2 = L3_2
  L6_2 = {}
  L7_2 = A2_2
  L6_2[1] = L7_2
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L5_2 = false
    return L5_2
  end
  L5_2 = Config
  L5_2 = L5_2.LBPhone
  if L5_2 then
    L5_2 = GetSourceFromIdentifier
    L6_2 = A2_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      L6_2 = exports
      L6_2 = L6_2["lb-phone"]
      L7_2 = L6_2
      L6_2 = L6_2.GetEquippedPhoneNumber
      L8_2 = L5_2
      L6_2 = L6_2(L7_2, L8_2)
      L4_2.phoneNumber = L6_2
    end
    L6_2 = L4_2.phoneNumber
    if not L6_2 then
      L6_2 = exports
      L6_2 = L6_2["lb-phone"]
      L7_2 = L6_2
      L6_2 = L6_2.GetEquippedPhoneNumber
      L8_2 = A2_2
      L6_2 = L6_2(L7_2, L8_2)
      L4_2.phoneNumber = L6_2
    end
  end
  L5_2 = L19_1
  L6_2 = "lbtablet_ambulance_profile_tags"
  L7_2 = "id"
  L8_2 = A2_2
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L4_2.tags = L5_2
  L5_2 = MySQL
  L5_2 = L5_2.query
  L5_2 = L5_2.await
  L6_2 = "SELECT id, title FROM lbtablet_ambulance_reports WHERE patient = ?"
  L7_2 = {}
  L8_2 = A2_2
  L7_2[1] = L8_2
  L5_2 = L5_2(L6_2, L7_2)
  L4_2.reports = L5_2
  L5_2 = MySQL
  L5_2 = L5_2.query
  L5_2 = L5_2.await
  L6_2 = [[
        SELECT
            c.id,
            c.title,
            c.severity

        FROM lbtablet_ambulance_profile_conditions pc

        LEFT JOIN lbtablet_ambulance_conditions c
            ON c.id = pc.condition_id

        WHERE pc.profile_id = ?
    ]]
  L7_2 = {}
  L8_2 = A2_2
  L7_2[1] = L8_2
  L5_2 = L5_2(L6_2, L7_2)
  L4_2.diagnoses = L5_2
  return L4_2
end
L21_1(L22_1, L23_1)
L21_1 = L10_1
L22_1 = "updateProfile"
function L23_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L3_2 = HasPermission
  L4_2 = A0_2
  L5_2 = "Ambulance"
  L6_2 = "profile"
  L7_2 = "edit"
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  if not L3_2 then
    L3_2 = debugprint
    L4_2 = "No permissions to edit profile"
    L3_2(L4_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = [[
        INSERT INTO lbtablet_ambulance_profiles (id, avatar, notes)
        VALUES (?, ?, ?)
        ON DUPLICATE KEY UPDATE avatar = VALUES(avatar), notes = VALUES(notes)
    ]]
  L5_2 = {}
  L6_2 = A2_2.id
  L7_2 = A2_2.avatar
  L8_2 = A2_2.notes
  if not L8_2 then
    L8_2 = ""
  end
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L3_2 = L3_2(L4_2, L5_2)
  L3_2 = L3_2 > 0
  if L3_2 then
    L4_2 = A2_2.id
    L5_2 = A2_2.diagnoses
    if not L5_2 then
      L5_2 = {}
    end
    L6_2 = MySQL
    L6_2 = L6_2.rawExecute
    L6_2 = L6_2.await
    L7_2 = "DELETE FROM lbtablet_ambulance_profile_conditions WHERE profile_id = ?"
    L8_2 = {}
    L9_2 = L4_2
    L8_2[1] = L9_2
    L6_2(L7_2, L8_2)
    L6_2 = #L5_2
    if L6_2 > 0 then
      L6_2 = {}
      L7_2 = 1
      L8_2 = #L5_2
      L9_2 = 1
      for L10_2 = L7_2, L8_2, L9_2 do
        L11_2 = #L6_2
        L11_2 = L11_2 + 1
        L12_2 = {}
        L13_2 = L4_2
        L14_2 = L5_2[L10_2]
        L12_2[1] = L13_2
        L12_2[2] = L14_2
        L6_2[L11_2] = L12_2
      end
      L7_2 = debugprint
      L8_2 = "Inserting diagnoses"
      L9_2 = L6_2
      L7_2(L8_2, L9_2)
      L7_2 = MySQL
      L7_2 = L7_2.rawExecute
      L7_2 = L7_2.await
      L8_2 = "INSERT INTO lbtablet_ambulance_profile_conditions (profile_id, condition_id) VALUES (?, ?) ON DUPLICATE KEY UPDATE condition_id = VALUES(condition_id)"
      L9_2 = L6_2
      L7_2(L8_2, L9_2)
    end
    L6_2 = L16_1
    L7_2 = A1_2
    L8_2 = A2_2.id
    L9_2 = "update"
    L10_2 = "profile"
    L11_2 = L
    L12_2 = "BACKEND.AMBULANCE.LOGS.UPDATE_PROFILE.TITLE"
    L11_2 = L11_2(L12_2)
    L12_2 = L
    L13_2 = "BACKEND.AMBULANCE.LOGS.UPDATE_PROFILE.DESCRIPTION"
    L14_2 = {}
    L15_2 = GetCharacterNameFromIdentifier
    L16_2 = A2_2.id
    L15_2 = L15_2(L16_2)
    if not L15_2 then
      L15_2 = "??"
    end
    L14_2.name = L15_2
    L12_2, L13_2, L14_2, L15_2, L16_2 = L12_2(L13_2, L14_2)
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    L6_2 = TriggerClientEvent
    L7_2 = "tablet:ambulance:profileUpdated"
    L8_2 = -1
    L9_2 = A2_2
    L6_2(L7_2, L8_2, L9_2)
  end
  return L3_2
end
L24_1 = nil
L25_1 = true
L21_1(L22_1, L23_1, L24_1, L25_1)
function L21_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = L6_1
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L3_2 = L2_2
    if L3_2 then
      L3_2 = L3_2.type
    end
    if "profile" == L3_2 then
      goto lbl_18
    end
  end
  L3_2 = debugprint
  L4_2 = "Invalid tag or tag type"
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
  L3_2 = false
  do return L3_2 end
  ::lbl_18::
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = "INSERT INTO lbtablet_ambulance_profile_tags (id, tag_id) VALUES (?, ?)"
  L5_2 = {}
  L6_2 = A0_2
  L7_2 = A1_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L3_2 = L3_2(L4_2, L5_2)
  L3_2 = L3_2 > 0
  if L3_2 then
    L4_2 = TriggerClientEvent
    L5_2 = "tablet:ambulance:addedTag"
    L6_2 = -1
    L7_2 = A0_2
    L8_2 = L2_2.type
    L9_2 = A1_2
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  end
  return L3_2
end
L22_1 = L10_1
L23_1 = "addTag"
function L24_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = HasPermission
  L5_2 = A0_2
  L6_2 = "Ambulance"
  L7_2 = "profile"
  L8_2 = "edit"
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if not L4_2 then
    L4_2 = debugprint
    L5_2 = "No permissions to add tag to profile"
    L4_2(L5_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = L6_1
  L5_2 = A3_2
  L4_2 = L4_2(L5_2)
  if L4_2 then
    L5_2 = L4_2
    if L5_2 then
      L5_2 = L5_2.type
    end
    if "profile" == L5_2 then
      goto lbl_31
    end
  end
  L5_2 = debugprint
  L6_2 = "Invalid tag or tag type"
  L7_2 = L4_2
  L5_2(L6_2, L7_2)
  L5_2 = false
  do return L5_2 end
  ::lbl_31::
  L5_2 = HasPermission
  L6_2 = A0_2
  L7_2 = "Ambulance"
  L8_2 = "profile"
  L9_2 = "edit"
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  if not L5_2 then
    L5_2 = debugprint
    L6_2 = "No permissions to add tag to profile"
    L5_2(L6_2)
    L5_2 = false
    return L5_2
  end
  L5_2 = L21_1
  L6_2 = A2_2
  L7_2 = A3_2
  L5_2 = L5_2(L6_2, L7_2)
  return L5_2
end
L25_1 = nil
L26_1 = true
L22_1(L23_1, L24_1, L25_1, L26_1)
L22_1 = exports
L23_1 = "AddTagToAmbulanceProfile"
L24_1 = L21_1
L22_1(L23_1, L24_1)
function L22_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = MySQL
  L2_2 = L2_2.update
  L2_2 = L2_2.await
  L3_2 = "DELETE FROM lbtablet_ambulance_profile_tags WHERE id = ? AND tag_id = ?"
  L4_2 = {}
  L5_2 = A0_2
  L6_2 = A1_2
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L2_2 = L2_2(L3_2, L4_2)
  L2_2 = L2_2 > 0
  if L2_2 then
    L3_2 = TriggerClientEvent
    L4_2 = "tablet:ambulance:removedTag"
    L5_2 = -1
    L6_2 = A0_2
    L7_2 = A1_2
    L3_2(L4_2, L5_2, L6_2, L7_2)
  end
  return L2_2
end
L23_1 = L10_1
L24_1 = "removeTag"
function L25_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = HasPermission
  L5_2 = A0_2
  L6_2 = "Ambulance"
  L7_2 = "profile"
  L8_2 = "edit"
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if not L4_2 then
    L4_2 = debugprint
    L5_2 = "No permissions to remove tag from profile"
    L4_2(L5_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = L6_1
  L5_2 = A3_2
  L4_2 = L4_2(L5_2)
  if L4_2 then
    L5_2 = L4_2
    if L5_2 then
      L5_2 = L5_2.type
    end
    L5_2 = not L5_2
    if "profile" == L5_2 then
      goto lbl_32
    end
  end
  L5_2 = debugprint
  L6_2 = "Invalid tag or tag type"
  L7_2 = L4_2
  L5_2(L6_2, L7_2)
  L5_2 = false
  do return L5_2 end
  ::lbl_32::
  L5_2 = HasPermission
  L6_2 = A0_2
  L7_2 = "Ambulance"
  L8_2 = "profile"
  L9_2 = "edit"
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  if not L5_2 then
    L5_2 = debugprint
    L6_2 = "No permissions to add tag to profile"
    L5_2(L6_2)
    L5_2 = false
    return L5_2
  end
  L5_2 = L22_1
  L6_2 = A2_2
  L7_2 = A3_2
  L5_2 = L5_2(L6_2, L7_2)
  return L5_2
end
L23_1(L24_1, L25_1)
L23_1 = exports
L24_1 = "RemoveTagFromAmbulanceProfile"
L25_1 = L22_1
L23_1(L24_1, L25_1)
L23_1 = L10_1
L24_1 = "billPlayer"
function L25_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L5_2 = BillPlayer
  if not L5_2 then
    L5_2 = infoprint
    L6_2 = "warning"
    L7_2 = "The BillPlayer function is not defined. Please set it up to work with your billing script."
    L5_2(L6_2, L7_2)
    L5_2 = false
    return L5_2
  end
  if not (A2_2 and A3_2) or A3_2 < 0 or not A4_2 then
    L5_2 = debugprint
    L6_2 = "Invalid bill data"
    L7_2 = A2_2
    L8_2 = A3_2
    L9_2 = A4_2
    L5_2(L6_2, L7_2, L8_2, L9_2)
    L5_2 = false
    return L5_2
  end
  if A2_2 == A1_2 then
    L5_2 = Config
    L5_2 = L5_2.Debug
    if L5_2 then
      L5_2 = infoprint
      L6_2 = "warning"
      L7_2 = "Normally you cannot bill yourself, but this is allowed in debug mode."
      L5_2(L6_2, L7_2)
    else
      L5_2 = SendNotification
      L6_2 = {}
      L6_2.source = A0_2
      L6_2.app = "Police"
      L7_2 = L
      L8_2 = "BACKEND.POLICE.CANT_FINE_YOURSELF_NOTIFICATION.TITLE"
      L7_2 = L7_2(L8_2)
      L6_2.title = L7_2
      L7_2 = L
      L8_2 = "BACKEND.POLICE.CANT_FINE_YOURSELF_NOTIFICATION.CONTENT"
      L7_2 = L7_2(L8_2)
      L6_2.content = L7_2
      L5_2(L6_2)
      L5_2 = false
      return L5_2
    end
  end
  L5_2 = BillPlayer
  L6_2 = A1_2
  L7_2 = A2_2
  L8_2 = "ambulance"
  L9_2 = A3_2
  L10_2 = A4_2
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  if not L5_2 then
    L5_2 = debugprint
    L6_2 = "Failed to bill player"
    L7_2 = A2_2
    L8_2 = A3_2
    L9_2 = A4_2
    L5_2(L6_2, L7_2, L8_2, L9_2)
    L5_2 = false
    return L5_2
  end
  L5_2 = true
  return L5_2
end
L26_1 = {}
L27_1 = {}
L28_1 = {}
L29_1 = "profile"
L30_1 = "bill"
L28_1[1] = L29_1
L28_1[2] = L30_1
L27_1[1] = L28_1
L26_1.permissions = L27_1
L23_1(L24_1, L25_1, L26_1)
L23_1 = L10_1
L24_1 = "getReports"
function L25_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  if not A2_2 then
    A2_2 = 0
  end
  if "" ~= A3_2 then
    L4_2 = type
    L5_2 = A3_2
    L4_2 = L4_2(L5_2)
    if "string" == L4_2 then
      goto lbl_12
    end
  end
  A3_2 = nil
  ::lbl_12::
  L4_2 = {}
  L5_2 = ""
  if A3_2 then
    L6_2 = #L4_2
    L6_2 = L6_2 + 1
    L7_2 = "%"
    L8_2 = A3_2
    L9_2 = "%"
    L7_2 = L7_2 .. L8_2 .. L9_2
    L4_2[L6_2] = L7_2
    L5_2 = " WHERE r.title LIKE ?"
  end
  if A3_2 then
    L7_2 = A3_2
    L6_2 = A3_2.match
    L8_2 = "^%d+$"
    L6_2 = L6_2(L7_2, L8_2)
    if nil ~= L6_2 then
      L6_2 = tonumber
      L7_2 = A3_2
      L6_2 = L6_2(L7_2)
      if L6_2 then
        L6_2 = L5_2
        L7_2 = " OR r.id = ?"
        L6_2 = L6_2 .. L7_2
        L5_2 = L6_2
        L6_2 = #L4_2
        L6_2 = L6_2 + 1
        L7_2 = tonumber
        L8_2 = A3_2
        L7_2 = L7_2(L8_2)
        L4_2[L6_2] = L7_2
      end
    end
  end
  L6_2 = #L4_2
  L6_2 = L6_2 + 1
  L7_2 = A2_2 or L7_2
  if not A2_2 then
    L7_2 = 0
  end
  L7_2 = L7_2 * 10
  L4_2[L6_2] = L7_2
  L6_2 = #L4_2
  L6_2 = L6_2 + 1
  L4_2[L6_2] = 10
  L6_2 = [[
        SELECT
            r.id,
            r.title,
            r.report_type,
            r.`description`,
            r.created_at AS created,
            r.updated_at AS lastUpdated,
            r.created_by AS createdBy,
            a.display_name AS author,
            a.avatar

        FROM lbtablet_ambulance_reports r

        LEFT JOIN lbtablet_ambulance_accounts a
            ON a.id = r.created_by

        %s

        ORDER BY r.updated_at DESC
        LIMIT ?, ?
    ]]
  L7_2 = L6_2
  L6_2 = L6_2.format
  L8_2 = L5_2
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = L6_2
  L9_2 = L4_2
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = 1
  L9_2 = #L7_2
  L10_2 = 1
  for L11_2 = L8_2, L9_2, L10_2 do
    L12_2 = L7_2[L11_2]
    L13_2 = L19_1
    L14_2 = "lbtablet_ambulance_reports_tags"
    L15_2 = "report_id"
    L16_2 = L12_2.id
    L13_2 = L13_2(L14_2, L15_2, L16_2)
    L12_2.tags = L13_2
  end
  return L7_2
end
L23_1(L24_1, L25_1)
function L23_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = [[
        SELECT
            r.id,
            r.title,
            r.report_type AS `type`,
            r.`description`,
            r.created_at AS created,
            r.updated_at AS lastUpdated,
            r.created_by AS createdBy,
            a.display_name AS author,
            a.avatar,
            r.patient,
            {SELECT_NAME} AS patient_name,
            {SELECT_DOB} AS patient_dob,
            p.avatar AS patient_avatar

        FROM lbtablet_ambulance_reports r

        LEFT JOIN lbtablet_ambulance_accounts a
            ON a.id = r.created_by

        LEFT JOIN lbtablet_ambulance_profiles p
            ON p.id = r.patient

        {JOIN_NAME}

        WHERE r.id = ?
    ]]
  L3_2 = L1_2
  L2_2 = L1_2.gsub
  L4_2 = "{SELECT_NAME}"
  L5_2 = Queries
  L5_2 = L5_2.Users
  L5_2 = L5_2.Select
  L5_2 = L5_2.name
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = L2_2
  L2_2 = L2_2.gsub
  L4_2 = "{SELECT_DOB}"
  L5_2 = Queries
  L5_2 = L5_2.Users
  L5_2 = L5_2.Select
  L5_2 = L5_2.dob
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = L2_2
  L2_2 = L2_2.gsub
  L4_2 = "{JOIN_NAME}"
  L5_2 = FormatString
  L6_2 = "LEFT JOIN {USERS_TABLE} user ON {IDENTIFIER} {USERS_COLLATE} = r.patient"
  L7_2 = {}
  L8_2 = Queries
  L8_2 = L8_2.Users
  L8_2 = L8_2.Table
  L7_2.USERS_TABLE = L8_2
  L8_2 = Queries
  L8_2 = L8_2.Users
  L8_2 = L8_2.Select
  L8_2 = L8_2.identifier
  L7_2.IDENTIFIER = L8_2
  L8_2 = UsersCollate
  L7_2.USERS_COLLATE = L8_2
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L5_2(L6_2, L7_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  L1_2 = L2_2
  L2_2 = MySQL
  L2_2 = L2_2.single
  L2_2 = L2_2.await
  L3_2 = L1_2
  L4_2 = {}
  L5_2 = A0_2
  L4_2[1] = L5_2
  L2_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = MySQL
  L3_2 = L3_2.query
  L3_2 = L3_2.await
  L4_2 = "SELECT attachment FROM lbtablet_ambulance_reports_attachments WHERE report_id = ?"
  L5_2 = {}
  L6_2 = A0_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  L2_2.gallery = L3_2
  L3_2 = L19_1
  L4_2 = "lbtablet_ambulance_reports_tags"
  L5_2 = "report_id"
  L6_2 = A0_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L2_2.tags = L3_2
  L3_2 = MySQL
  L3_2 = L3_2.query
  L3_2 = L3_2.await
  L4_2 = [[
        SELECT
            c.id,
            c.title,
            c.severity

        FROM lbtablet_ambulance_reports_conditions rc

        LEFT JOIN lbtablet_ambulance_conditions c
            ON c.id = rc.condition_id

        WHERE rc.report_id = ?
    ]]
  L5_2 = {}
  L6_2 = A0_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  L2_2.injuries = L3_2
  L3_2 = [[
        SELECT
            d.doctor AS id,
            {SELECT_NAME} AS `name`

        FROM lbtablet_ambulance_reports_doctors d

        {JOIN_NAME}

        WHERE d.report_id = ?
    ]]
  L5_2 = L3_2
  L4_2 = L3_2.gsub
  L6_2 = "{SELECT_NAME}"
  L7_2 = Queries
  L7_2 = L7_2.Users
  L7_2 = L7_2.Select
  L7_2 = L7_2.name
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = L4_2
  L4_2 = L4_2.gsub
  L6_2 = "{JOIN_NAME}"
  L7_2 = FormatString
  L8_2 = "LEFT JOIN {USERS_TABLE} user ON {IDENTIFIER} {USERS_COLLATE} = d.doctor"
  L9_2 = {}
  L10_2 = Queries
  L10_2 = L10_2.Users
  L10_2 = L10_2.Table
  L9_2.USERS_TABLE = L10_2
  L10_2 = Queries
  L10_2 = L10_2.Users
  L10_2 = L10_2.Select
  L10_2 = L10_2.identifier
  L9_2.IDENTIFIER = L10_2
  L10_2 = UsersCollate
  L9_2.USERS_COLLATE = L10_2
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2, L9_2)
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  L3_2 = L4_2
  L4_2 = MySQL
  L4_2 = L4_2.query
  L4_2 = L4_2.await
  L5_2 = L3_2
  L6_2 = {}
  L7_2 = A0_2
  L6_2[1] = L7_2
  L4_2 = L4_2(L5_2, L6_2)
  L2_2.doctorsInvolved = L4_2
  return L2_2
end
L24_1 = L10_1
L25_1 = "getReport"
function L26_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  L3_2 = L23_1
  L4_2 = A2_2
  return L3_2(L4_2)
end
L24_1(L25_1, L26_1)
function L24_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L3_2 = type
  L4_2 = A2_2
  if L4_2 then
    L4_2 = L4_2.title
  end
  L3_2 = L3_2(L4_2)
  if "string" == L3_2 then
    L3_2 = A2_2.title
    L3_2 = #L3_2
    if not (L3_2 < 3) then
      L3_2 = type
      L4_2 = A2_2
      if L4_2 then
        L4_2 = L4_2.description
      end
      L3_2 = L3_2(L4_2)
      if "string" == L3_2 then
        L3_2 = A2_2.description
        L3_2 = #L3_2
        if not (L3_2 < 3) then
          L3_2 = type
          L4_2 = A2_2
          if L4_2 then
            L4_2 = L4_2.type
          end
          L3_2 = L3_2(L4_2)
          if "string" == L3_2 then
            L3_2 = type
            L4_2 = A2_2
            if L4_2 then
              L4_2 = L4_2.patient
            end
            L3_2 = L3_2(L4_2)
            if "string" == L3_2 then
              goto lbl_47
            end
          end
        end
      end
    end
  end
  L3_2 = debugprint
  L4_2 = "saveReport: Invalid data"
  L5_2 = A2_2
  L3_2(L4_2, L5_2)
  L3_2 = false
  do return L3_2 end
  ::lbl_47::
  L3_2 = A2_2.id
  L4_2 = A2_2.title
  L5_2 = A2_2.description
  L6_2 = A2_2.type
  L7_2 = A2_2.patient
  L8_2 = A2_2.gallery
  if not L8_2 then
    L8_2 = {}
  end
  L9_2 = A2_2.doctors
  if not L9_2 then
    L9_2 = {}
  end
  L10_2 = A2_2.tags
  if not L10_2 then
    L10_2 = {}
  end
  L11_2 = A2_2.injuries
  if not L11_2 then
    L11_2 = {}
  end
  if not L3_2 then
    L12_2 = HasPermission
    L13_2 = A0_2
    L14_2 = "Ambulance"
    L15_2 = "report"
    L16_2 = "create"
    L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2)
    if not L12_2 then
      L12_2 = debugprint
      L13_2 = "No permissions to create report"
      L12_2(L13_2)
      L12_2 = false
      return L12_2
    end
    L12_2 = MySQL
    L12_2 = L12_2.insert
    L12_2 = L12_2.await
    L13_2 = "INSERT INTO lbtablet_ambulance_reports (created_by, patient, title, `description`, report_type) VALUES (?, ?, ?, ?, ?)"
    L14_2 = {}
    L15_2 = A1_2
    L16_2 = L7_2
    L17_2 = L4_2
    L18_2 = L5_2
    L19_2 = L6_2
    L14_2[1] = L15_2
    L14_2[2] = L16_2
    L14_2[3] = L17_2
    L14_2[4] = L18_2
    L14_2[5] = L19_2
    L12_2 = L12_2(L13_2, L14_2)
    L3_2 = L12_2
    L12_2 = L16_1
    L13_2 = A1_2
    L14_2 = L3_2
    L15_2 = "create"
    L16_2 = "report"
    L17_2 = L
    L18_2 = "BACKEND.AMBULANCE.LOGS.CREATE_REPORT.TITLE"
    L17_2 = L17_2(L18_2)
    L18_2 = L
    L19_2 = "BACKEND.AMBULANCE.LOGS.CREATE_REPORT.DESCRIPTION"
    L20_2 = {}
    L20_2.title = L4_2
    L21_2 = A2_2.type
    L20_2.type = L21_2
    L21_2 = GetCharacterNameFromIdentifier
    L22_2 = L7_2
    L21_2 = L21_2(L22_2)
    if not L21_2 then
      L21_2 = "??"
    end
    L20_2.patient = L21_2
    L20_2.patientId = L7_2
    L20_2.id = L3_2
    L18_2, L19_2, L20_2, L21_2, L22_2 = L18_2(L19_2, L20_2)
    L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
    L12_2 = Config
    L12_2 = L12_2.Ambulance
    L12_2 = L12_2.Notifications
    L12_2 = L12_2.NewReport
    if L12_2 then
      L12_2 = L9_1
      L13_2 = {}
      L14_2 = L
      L15_2 = "BACKEND.AMBULANCE.NOTIFICATIONS.NEW_REPORT.TITLE"
      L14_2 = L14_2(L15_2)
      L13_2.title = L14_2
      L14_2 = L
      L15_2 = "BACKEND.AMBULANCE.NOTIFICATIONS.NEW_REPORT.CONTENT"
      L16_2 = {}
      L16_2.title = L4_2
      L16_2.description = L5_2
      L14_2 = L14_2(L15_2, L16_2)
      L13_2.content = L14_2
      L14_2 = {}
      L15_2 = A1_2
      L14_2[1] = L15_2
      L12_2(L13_2, L14_2)
    end
  else
    L12_2 = HasPermission
    L13_2 = A0_2
    L14_2 = "Ambulance"
    L15_2 = "report"
    L16_2 = "edit"
    L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2)
    if not L12_2 then
      L12_2 = debugprint
      L13_2 = "No permissions to create report"
      L12_2(L13_2)
      L12_2 = false
      return L12_2
    end
    L12_2 = MySQL
    L12_2 = L12_2.rawExecute
    L12_2 = L12_2.await
    L13_2 = "UPDATE lbtablet_ambulance_reports SET title = ?, `description` = ?, report_type = ?, patient = ? WHERE id = ?"
    L14_2 = {}
    L15_2 = L4_2
    L16_2 = L5_2
    L17_2 = L6_2
    L18_2 = L7_2
    L19_2 = L3_2
    L14_2[1] = L15_2
    L14_2[2] = L16_2
    L14_2[3] = L17_2
    L14_2[4] = L18_2
    L14_2[5] = L19_2
    L12_2(L13_2, L14_2)
    L12_2 = MySQL
    L12_2 = L12_2.rawExecute
    L12_2 = L12_2.await
    L13_2 = "DELETE FROM lbtablet_ambulance_reports_conditions WHERE report_id = ?"
    L14_2 = {}
    L15_2 = L3_2
    L14_2[1] = L15_2
    L12_2(L13_2, L14_2)
    L12_2 = MySQL
    L12_2 = L12_2.rawExecute
    L12_2 = L12_2.await
    L13_2 = "DELETE FROM lbtablet_ambulance_reports_attachments WHERE report_id = ?"
    L14_2 = {}
    L15_2 = L3_2
    L14_2[1] = L15_2
    L12_2(L13_2, L14_2)
    L12_2 = MySQL
    L12_2 = L12_2.rawExecute
    L12_2 = L12_2.await
    L13_2 = "DELETE FROM lbtablet_ambulance_reports_tags WHERE report_id = ?"
    L14_2 = {}
    L15_2 = L3_2
    L14_2[1] = L15_2
    L12_2(L13_2, L14_2)
    L12_2 = MySQL
    L12_2 = L12_2.rawExecute
    L12_2 = L12_2.await
    L13_2 = "DELETE FROM lbtablet_ambulance_reports_doctors WHERE report_id = ?"
    L14_2 = {}
    L15_2 = L3_2
    L14_2[1] = L15_2
    L12_2(L13_2, L14_2)
    L12_2 = TriggerClientEvent
    L13_2 = "tablet:ambulance:reportUpdated"
    L14_2 = -1
    L15_2 = A2_2
    L12_2(L13_2, L14_2, L15_2)
    L12_2 = L16_1
    L13_2 = A1_2
    L14_2 = L3_2
    L15_2 = "update"
    L16_2 = "report"
    L17_2 = L
    L18_2 = "BACKEND.AMBULANCE.LOGS.UPDATE_REPORT.TITLE"
    L17_2 = L17_2(L18_2)
    L18_2 = L
    L19_2 = "BACKEND.AMBULANCE.LOGS.UPDATE_REPORT.DESCRIPTION"
    L20_2 = {}
    L20_2.title = L4_2
    L21_2 = A2_2.type
    L20_2.type = L21_2
    L20_2.id = L3_2
    L18_2, L19_2, L20_2, L21_2, L22_2 = L18_2(L19_2, L20_2)
    L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
  end
  if not L3_2 then
    L12_2 = false
    return L12_2
  end
  L12_2 = #L8_2
  if L12_2 > 0 then
    L12_2 = {}
    L13_2 = 1
    L14_2 = #L8_2
    L15_2 = 1
    for L16_2 = L13_2, L14_2, L15_2 do
      L17_2 = #L12_2
      L17_2 = L17_2 + 1
      L18_2 = {}
      L19_2 = L3_2
      L20_2 = L8_2[L16_2]
      L18_2[1] = L19_2
      L18_2[2] = L20_2
      L12_2[L17_2] = L18_2
    end
    L13_2 = MySQL
    L13_2 = L13_2.rawExecute
    L13_2 = L13_2.await
    L14_2 = "INSERT INTO lbtablet_ambulance_reports_attachments (report_id, attachment) VALUES (?, ?)"
    L15_2 = L12_2
    L13_2(L14_2, L15_2)
  end
  L12_2 = #L9_2
  if L12_2 > 0 then
    L12_2 = {}
    L13_2 = 1
    L14_2 = #L9_2
    L15_2 = 1
    for L16_2 = L13_2, L14_2, L15_2 do
      L17_2 = #L12_2
      L17_2 = L17_2 + 1
      L18_2 = {}
      L19_2 = L3_2
      L20_2 = L9_2[L16_2]
      L18_2[1] = L19_2
      L18_2[2] = L20_2
      L12_2[L17_2] = L18_2
    end
    L13_2 = MySQL
    L13_2 = L13_2.rawExecute
    L13_2 = L13_2.await
    L14_2 = "INSERT INTO lbtablet_ambulance_reports_doctors (report_id, doctor) VALUES (?, ?)"
    L15_2 = L12_2
    L13_2(L14_2, L15_2)
  end
  L12_2 = #L10_2
  if L12_2 > 0 then
    L12_2 = {}
    L13_2 = 1
    L14_2 = #L10_2
    L15_2 = 1
    for L16_2 = L13_2, L14_2, L15_2 do
      L17_2 = #L12_2
      L17_2 = L17_2 + 1
      L18_2 = {}
      L19_2 = L3_2
      L20_2 = L10_2[L16_2]
      L18_2[1] = L19_2
      L18_2[2] = L20_2
      L12_2[L17_2] = L18_2
    end
    L13_2 = MySQL
    L13_2 = L13_2.rawExecute
    L13_2 = L13_2.await
    L14_2 = "INSERT INTO lbtablet_ambulance_reports_tags (report_id, tag_id) VALUES (?, ?)"
    L15_2 = L12_2
    L13_2(L14_2, L15_2)
  end
  L12_2 = #L11_2
  if L12_2 > 0 then
    L12_2 = {}
    L13_2 = 1
    L14_2 = #L11_2
    L15_2 = 1
    for L16_2 = L13_2, L14_2, L15_2 do
      L17_2 = #L12_2
      L17_2 = L17_2 + 1
      L18_2 = {}
      L19_2 = L3_2
      L20_2 = L11_2[L16_2]
      L18_2[1] = L19_2
      L18_2[2] = L20_2
      L12_2[L17_2] = L18_2
    end
    L13_2 = MySQL
    L13_2 = L13_2.rawExecute
    L13_2 = L13_2.await
    L14_2 = "INSERT INTO lbtablet_ambulance_reports_conditions (report_id, condition_id) VALUES (?, ?)"
    L15_2 = L12_2
    L13_2(L14_2, L15_2)
  end
  return L3_2
end
L25_1 = L10_1
L26_1 = "saveReport"
function L27_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = L24_1
  L4_2 = A0_2
  L5_2 = A1_2
  L6_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2)
end
L28_1 = nil
L29_1 = true
L25_1(L26_1, L27_1, L28_1, L29_1)
L25_1 = L10_1
L26_1 = "deleteReport"
function L27_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = HasPermission
  L4_2 = A0_2
  L5_2 = "Ambulance"
  L6_2 = "report"
  L7_2 = "delete"
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  if not L3_2 then
    L3_2 = debugprint
    L4_2 = "No permissions to delete report"
    L3_2(L4_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = "DELETE FROM lbtablet_ambulance_reports WHERE id = ?"
  L5_2 = {}
  L6_2 = A2_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  L3_2 = L3_2 > 0
  if L3_2 then
    L4_2 = TriggerClientEvent
    L5_2 = "tablet:ambulance:reportDeleted"
    L6_2 = -1
    L7_2 = A2_2
    L4_2(L5_2, L6_2, L7_2)
  end
  return L3_2
end
L25_1(L26_1, L27_1)
L25_1 = exports
L26_1 = "CreateAmbulanceReport"
function L27_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = GetEquippedTablet
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = debugprint
    L4_2 = "CreateAmbulanceReport: No tablet found"
    L3_2(L4_2)
    L3_2 = false
    L4_2 = "no_tablet"
    return L3_2, L4_2
  end
  A1_2.id = nil
  L3_2 = L24_1
  L4_2 = A0_2
  L5_2 = L2_2
  L6_2 = A1_2
  return L3_2(L4_2, L5_2, L6_2)
end
L25_1(L26_1, L27_1)
L25_1 = exports
L26_1 = "GetAmbulanceReport"
L27_1 = L23_1
L25_1(L26_1, L27_1)
L25_1 = exports
L26_1 = "UpdateAmbulanceReport"
function L27_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = GetEquippedTablet
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = debugprint
    L4_2 = "UpdateAmbulanceReport: No tablet found"
    L3_2(L4_2)
    L3_2 = false
    L4_2 = "no_tablet"
    return L3_2, L4_2
  end
  L3_2 = A1_2
  if L3_2 then
    L3_2 = L3_2.id
  end
  if not L3_2 then
    L3_2 = debugprint
    L4_2 = "UpdateAmbulanceReport: No ID provided"
    L3_2(L4_2)
    L3_2 = false
    L4_2 = "no_id"
    return L3_2, L4_2
  end
  L3_2 = L24_1
  L4_2 = A0_2
  L5_2 = L2_2
  L6_2 = A1_2
  return L3_2(L4_2, L5_2, L6_2)
end
L25_1(L26_1, L27_1)
L25_1 = exports
L26_1 = "DeleteAmbulanceReport"
function L27_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = MySQL
  L1_2 = L1_2.update
  L1_2 = L1_2.await
  L2_2 = "DELETE FROM lbtablet_ambulance_reports WHERE id = ?"
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  L1_2 = L1_2(L2_2, L3_2)
  L1_2 = L1_2 > 0
  if L1_2 then
    L2_2 = TriggerClientEvent
    L3_2 = "tablet:ambulance:reportDeleted"
    L4_2 = -1
    L5_2 = A0_2
    L2_2(L3_2, L4_2, L5_2)
  end
  return L1_2
end
L25_1(L26_1, L27_1)
L25_1 = AddEventHandler
L26_1 = "lb-tablet:jobUpdated"
function L27_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = GetEquippedTablet
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = Config
  L3_2 = L3_2.Ambulance
  L3_2 = L3_2.Permissions
  L3_2 = L3_2[A1_2]
  if L3_2 then
    L3_2 = L15_1
    L4_2 = A0_2
    L5_2 = L2_2
    L3_2(L4_2, L5_2)
  else
    L3_2 = L0_1
    L3_2[L2_2] = nil
  end
end
L25_1(L26_1, L27_1)
L25_1 = OnTabletDisconnect
function L26_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = L0_1
  L2_2 = L2_2[A0_2]
  if L2_2 then
    L2_2 = L0_1
    L2_2[A0_2] = nil
    L2_2 = debugprint
    L3_2 = "Removed ambulance user from cache"
    L4_2 = A0_2
    L5_2 = A1_2
    L2_2(L3_2, L4_2, L5_2)
  end
end
L25_1(L26_1)
