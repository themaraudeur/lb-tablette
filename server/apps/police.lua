local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1
L0_1 = {}
L1_1 = {}
L2_1 = {}
L3_1 = {}
L4_1 = pairs
L5_1 = Config
L5_1 = L5_1.Police
L5_1 = L5_1.Permissions
L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1)
for L8_1, L9_1 in L4_1, L5_1, L6_1, L7_1 do
  L10_1 = #L3_1
  L10_1 = L10_1 + 1
  L3_1[L10_1] = L8_1
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
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = "SELECT * FROM lbtablet_police_tags"
  L0_2 = L0_2(L1_2)
  L0_1 = L0_2
  L0_2 = GetJobGrades
  L1_2 = L3_1
  L0_2 = L0_2(L1_2)
  L2_1 = L0_2
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = [[
        SELECT
            o.id,
            o.category_id AS categoryId,
            o.class,
            o.title,
            o.`description`,
            o.fine,
            o.jail_time AS jailTime,
            oc.title AS category
        FROM
            lbtablet_police_offences_categories oc
        LEFT JOIN
            lbtablet_police_offences o ON o.category_id = oc.id

        ORDER BY
            o.category_id ASC,
            o.class DESC,
            o.id ASC
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
  L2_2 = L0_1
  L2_2 = #L2_2
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = L0_1
    L5_2 = L5_2[L4_2]
    L5_2 = L5_2.id
    if L5_2 == A0_2 then
      L5_2 = L0_1
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
  L2_2 = L1_1
  L2_2 = L2_2[A0_2]
  if L2_2 then
    L2_2 = L1_1
    L2_2 = L2_2[A0_2]
    L2_2 = L2_2.callsign
    return L2_2
  end
  if A1_2 then
    return
  end
  L2_2 = MySQL
  L2_2 = L2_2.scalar
  L2_2 = L2_2.await
  L3_2 = "SELECT callsign FROM lbtablet_police_accounts WHERE id = ?"
  L4_2 = {}
  L5_2 = A0_2
  L4_2[1] = L5_2
  return L2_2(L3_2, L4_2)
end
GetPoliceCallsign = L9_1
function L9_1(A0_2)
  local L1_2
  L1_2 = L1_1
  L1_2 = L1_2[A0_2]
  if L1_2 then
    L1_2 = L1_2.avatar
  end
  return L1_2
end
GetPoliceAvatar = L9_1
L9_1 = exports
L10_1 = "GetPoliceCallsign"
L11_1 = GetPoliceCallsign
L9_1(L10_1, L11_1)
L9_1 = exports
L10_1 = "GetPoliceAvatar"
L11_1 = GetPoliceAvatar
L9_1(L10_1, L11_1)
function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = L7_1
  L3_2 = os
  L3_2 = L3_2.time
  L3_2 = L3_2()
  L3_2 = L3_2 + 60
  if L2_2 < L3_2 then
    L2_2 = GetIdentifiersWithJob
    L3_2 = L3_1
    L2_2 = L2_2(L3_2)
    L8_1 = L2_2
    L2_2 = os
    L2_2 = L2_2.time
    L2_2 = L2_2()
    L7_1 = L2_2
    L2_2 = debugprint
    L3_2 = "Fetched officers"
    L4_2 = L8_1
    L4_2 = #L4_2
    L2_2(L3_2, L4_2)
  end
  A0_2.app = "Police"
  L2_2 = NotifyTablets
  L3_2 = L8_1
  L4_2 = A0_2
  L5_2 = A1_2
  L2_2(L3_2, L4_2, L5_2)
end
function L10_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L6_2 = MySQL
  L6_2 = L6_2.insert
  L7_2 = "INSERT INTO lbtablet_police_logs (created_by, related_id, log_type, log_action, title, content) VALUES (?, ?, ?, ?, ?, ?)"
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
    L10_2 = "Police"
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
function L11_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
  L3_2 = false
  if not A2_2 then
    L4_2 = {}
    A2_2 = L4_2
  end
  L4_2 = A2_2.antiSpam
  if L4_2 then
    L3_2 = true
  end
  L4_2 = A2_2.permissions
  if L4_2 then
    L4_2 = pairs
    L5_2 = Config
    L5_2 = L5_2.Police
    L5_2 = L5_2.Permissions
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
      L10_2 = 1
      L11_2 = A2_2.permissions
      L11_2 = #L11_2
      L12_2 = 1
      for L13_2 = L10_2, L11_2, L12_2 do
        L14_2 = A2_2.permissions
        L14_2 = L14_2[L13_2]
        L15_2 = L14_2[1]
        L15_2 = L9_2[L15_2]
        if L15_2 then
          L15_2 = L14_2[1]
          L15_2 = L9_2[L15_2]
          L16_2 = L14_2[2]
          L15_2 = L15_2[L16_2]
          if L15_2 then
            goto lbl_50
          end
        end
        L15_2 = infoprint
        L16_2 = "error"
        L17_2 = "Permission ^5"
        L18_2 = L14_2[1]
        L19_2 = "."
        L20_2 = L14_2[2]
        L21_2 = "^7 does not exist for ^5"
        L22_2 = L8_2
        L23_2 = "^7. Used in police callback ^5"
        L24_2 = A0_2
        L17_2 = L17_2 .. L18_2 .. L19_2 .. L20_2 .. L21_2 .. L22_2 .. L23_2 .. L24_2
        L18_2 = "^7"
        L15_2(L16_2, L17_2, L18_2)
        ::lbl_50::
      end
    end
  end
  L4_2 = BaseCallback
  L5_2 = "police:"
  L6_2 = A0_2
  L5_2 = L5_2 .. L6_2
  function L6_2(A0_3, A1_3, ...)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3
    L2_3 = GetJob
    L3_3 = A0_3
    L2_3 = L2_3(L3_3)
    if L2_3 then
      L3_3 = Config
      L3_3 = L3_3.Police
      L3_3 = L3_3.Permissions
      L4_3 = L2_3.name
      L3_3 = L3_3[L4_3]
      if L3_3 then
        goto lbl_22
      end
    end
    L3_3 = debugprint
    L4_3 = "No permissions to access police app. Identifier:"
    L5_3 = A1_3
    L6_3 = "Job:"
    L7_3 = L2_3
    L3_3(L4_3, L5_3, L6_3, L7_3)
    L3_3 = false
    do return L3_3 end
    ::lbl_22::
    L3_3 = A2_2.permissions
    if L3_3 then
      L3_3 = 1
      L4_3 = A2_2.permissions
      L4_3 = #L4_3
      L5_3 = 1
      for L6_3 = L3_3, L4_3, L5_3 do
        L7_3 = A2_2.permissions
        L7_3 = L7_3[L6_3]
        L8_3 = HasPermission
        L9_3 = A0_3
        L10_3 = "Police"
        L11_3 = L7_3[1]
        L12_3 = L7_3[2]
        L8_3 = L8_3(L9_3, L10_3, L11_3, L12_3)
        if not L8_3 then
          L8_3 = debugprint
          L9_3 = "No permission to access police callback:"
          L10_3 = A0_2
          L11_3 = "Identifier:"
          L12_3 = A1_3
          L13_3 = "Permission:"
          L14_3 = L7_3[1]
          L15_3 = "."
          L14_3 = L14_3 .. L15_3
          L15_3 = L7_3[2]
          L16_3 = "Job:"
          L17_3 = L2_3
          L8_3(L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
          L8_3 = false
          return L8_3
        end
      end
    end
    L3_3 = A1_2
    L4_3 = A0_3
    L5_3 = A1_3
    L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = ...
    return L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
  end
  L7_2 = A2_2.defaultReturn
  L8_2 = L3_2
  L4_2(L5_2, L6_2, L7_2, L8_2)
end
L12_1 = L11_1
L13_1 = "getEmployees"
function L14_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = GetEmployees
  L3_2 = L3_1
  L4_2 = "lbtablet_police_accounts"
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
L12_1(L13_1, L14_1)
L12_1 = L11_1
L13_1 = "getActiveUnits"
function L14_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = {}
  L3_2 = GetOnDutyEmployees
  L4_2 = Config
  L4_2 = L4_2.Police
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
    L10_2 = GetPoliceCallsign
    L11_2 = L8_2.identifier
    L10_2 = L10_2(L11_2)
    L9_2.callsign = L10_2
    L10_2 = GetPlayerUnit
    L11_2 = L8_2.source
    L10_2 = L10_2(L11_2)
    L9_2.unit = L10_2
    L2_2[L7_2] = L9_2
  end
  return L2_2
end
L12_1(L13_1, L14_1)
L12_1 = L11_1
L13_1 = "getUnits"
function L14_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = {}
  L3_2 = GetUnits
  L4_2 = "police"
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
L15_1 = {}
L16_1 = {}
L15_1.defaultReturn = L16_1
L12_1(L13_1, L14_1, L15_1)
L12_1 = L11_1
L13_1 = "addUnit"
function L14_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = CreateUnit
  L4_2 = "police"
  L5_2 = A2_2
  L6_2 = Config
  L6_2 = L6_2.Police
  L6_2 = L6_2.DefaultUnitStatus
  return L3_2(L4_2, L5_2, L6_2)
end
L15_1 = {}
L16_1 = {}
L17_1 = {}
L18_1 = "unit"
L19_1 = "create"
L17_1[1] = L18_1
L17_1[2] = L19_1
L16_1[1] = L17_1
L15_1.permissions = L16_1
L12_1(L13_1, L14_1, L15_1)
L12_1 = L11_1
L13_1 = "deleteUnit"
function L14_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = RemoveUnit
  L4_2 = "police"
  L5_2 = A2_2
  return L3_2(L4_2, L5_2)
end
L15_1 = {}
L16_1 = {}
L17_1 = {}
L18_1 = "unit"
L19_1 = "delete"
L17_1[1] = L18_1
L17_1[2] = L19_1
L16_1[1] = L17_1
L15_1.permissions = L16_1
L12_1(L13_1, L14_1, L15_1)
L12_1 = L11_1
L13_1 = "updateUnitStatus"
function L14_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2
  L4_2 = Config
  L4_2 = L4_2.Police
  L4_2 = L4_2.UnitStatuses
  if L4_2 then
    L4_2 = Config
    L4_2 = L4_2.Police
    L4_2 = L4_2.UnitStatuses
    L4_2 = L4_2[A3_2]
    if L4_2 then
      goto lbl_18
    end
  end
  L4_2 = debugprint
  L5_2 = "Invalid unit status"
  L6_2 = A3_2
  L4_2(L5_2, L6_2)
  L4_2 = false
  do return L4_2 end
  ::lbl_18::
  L4_2 = SetUnitStatus
  L5_2 = "police"
  L6_2 = A2_2
  L7_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2)
end
L15_1 = {}
L16_1 = {}
L17_1 = {}
L18_1 = "unit"
L19_1 = "edit"
L17_1[1] = L18_1
L17_1[2] = L19_1
L16_1[1] = L17_1
L15_1.permissions = L16_1
L12_1(L13_1, L14_1, L15_1)
L12_1 = L11_1
L13_1 = "renameUnit"
function L14_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2
  L4_2 = RenameUnit
  L5_2 = "police"
  L6_2 = A2_2
  L7_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2)
end
L15_1 = {}
L16_1 = {}
L17_1 = {}
L18_1 = "unit"
L19_1 = "edit"
L17_1[1] = L18_1
L17_1[2] = L19_1
L16_1[1] = L17_1
L15_1.permissions = L16_1
L12_1(L13_1, L14_1, L15_1)
L12_1 = L11_1
L13_1 = "assignOfficerToUnit"
function L14_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2
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
  L6_2 = "police"
  L7_2 = A2_2
  return L4_2(L5_2, L6_2, L7_2)
end
L15_1 = {}
L16_1 = {}
L17_1 = {}
L18_1 = "unit"
L19_1 = "edit"
L17_1[1] = L18_1
L17_1[2] = L19_1
L16_1[1] = L17_1
L15_1.permissions = L16_1
L12_1(L13_1, L14_1, L15_1)
L12_1 = L11_1
L13_1 = "removeOfficerFromUnit"
function L14_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
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
L15_1 = {}
L16_1 = {}
L17_1 = {}
L18_1 = "unit"
L19_1 = "edit"
L17_1[1] = L18_1
L17_1[2] = L19_1
L16_1[1] = L17_1
L15_1.permissions = L16_1
L12_1(L13_1, L14_1, L15_1)
L12_1 = L11_1
L13_1 = "getLogs"
function L14_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L4_2 = [[
        SELECT
            l.log_id, l.related_id, l.created_by, l.log_type, l.log_action, l.title, l.content, l.created_at,
            a.display_name, a.avatar
        FROM lbtablet_police_logs l
        LEFT JOIN lbtablet_police_accounts a ON a.id = l.created_by
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
    L12_2 = string
    L12_2 = L12_2.match
    L13_2 = L11_2.related_id
    L14_2 = "^%d+$"
    L12_2 = L12_2(L13_2, L14_2)
    if L12_2 then
      L12_2 = tonumber
      L13_2 = L11_2.related_id
      L12_2 = L12_2(L13_2)
      if L12_2 then
        L12_2 = tonumber
        L13_2 = L11_2.related_id
        L12_2 = L12_2(L13_2)
        L11_2.related_id = L12_2
      end
    end
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
L15_1 = {}
L16_1 = {}
L15_1.defaultReturn = L16_1
L16_1 = {}
L17_1 = {}
L18_1 = "logs"
L19_1 = "view"
L17_1[1] = L18_1
L17_1[2] = L19_1
L16_1[1] = L17_1
L15_1.permissions = L16_1
L12_1(L13_1, L14_1, L15_1)
L12_1 = L11_1
L13_1 = "getOffences"
function L14_1(A0_2, A1_2)
  local L2_2
  L2_2 = L4_1
  return L2_2
end
L12_1(L13_1, L14_1)
L12_1 = L11_1
L13_1 = "addOffenceCategory"
function L14_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = MySQL
  L3_2 = L3_2.scalar
  L3_2 = L3_2.await
  L4_2 = "SELECT 1 FROM lbtablet_police_offences_categories WHERE title = ?"
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
  L4_2 = "INSERT INTO lbtablet_police_offences_categories (title) VALUES (?)"
  L5_2 = {}
  L6_2 = A2_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L4_2 = debugprint
    L5_2 = "Failed to create category"
    L4_2(L5_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = L4_1
  L5_2 = {}
  L4_2[A2_2] = L5_2
  L4_2 = TriggerClientEvent
  L5_2 = "tablet:police:addOffenceCategory"
  L6_2 = -1
  L7_2 = A2_2
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L10_1
  L5_2 = A1_2
  L6_2 = L3_2
  L7_2 = "create"
  L8_2 = "offence_category"
  L9_2 = L
  L10_2 = "BACKEND.POLICE.LOGS.CREATE_OFFENCE_CATEGORY.TITLE"
  L9_2 = L9_2(L10_2)
  L10_2 = L
  L11_2 = "BACKEND.POLICE.LOGS.CREATE_OFFENCE_CATEGORY.DESCRIPTION"
  L12_2 = {}
  L12_2.name = A2_2
  L10_2, L11_2, L12_2 = L10_2(L11_2, L12_2)
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  L4_2 = true
  return L4_2
end
L15_1 = {}
L15_1.antiSpam = true
L16_1 = {}
L17_1 = {}
L18_1 = "offence"
L19_1 = "create"
L17_1[1] = L18_1
L17_1[2] = L19_1
L16_1[1] = L17_1
L15_1.permissions = L16_1
L12_1(L13_1, L14_1, L15_1)
L12_1 = L11_1
L13_1 = "updateOffenceCategory"
function L14_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
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
  L5_2 = "UPDATE lbtablet_police_offences_categories SET title = ? WHERE title = ?"
  L6_2 = {}
  L7_2 = A3_2
  L8_2 = A2_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L4_2 = L4_2(L5_2, L6_2)
  L4_2 = L4_2 > 0
  if not L4_2 then
    L5_2 = debugprint
    L6_2 = "Failed to change offence category title"
    L5_2(L6_2)
    L5_2 = false
    return L5_2
  end
  if A3_2 ~= A2_2 then
    L5_2 = L4_1
    L6_2 = L4_1
    L6_2 = L6_2[A2_2]
    L5_2[A3_2] = L6_2
    L5_2 = L4_1
    L5_2[A2_2] = nil
  end
  L5_2 = TriggerClientEvent
  L6_2 = "tablet:police:updateOffenceCategory"
  L7_2 = -1
  L8_2 = A2_2
  L9_2 = A3_2
  L5_2(L6_2, L7_2, L8_2, L9_2)
  L5_2 = L10_1
  L6_2 = A1_2
  L7_2 = A2_2
  L8_2 = "update"
  L9_2 = "offence_category"
  L10_2 = L
  L11_2 = "BACKEND.POLICE.LOGS.UPDATE_OFFENCE_CATEGORY.TITLE"
  L10_2 = L10_2(L11_2)
  L11_2 = L
  L12_2 = "BACKEND.POLICE.LOGS.UPDATE_OFFENCE_CATEGORY.DESCRIPTION"
  L13_2 = {}
  L13_2.oldName = A2_2
  L13_2.newName = A3_2
  L11_2, L12_2, L13_2 = L11_2(L12_2, L13_2)
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L5_2 = true
  return L5_2
end
L15_1 = {}
L15_1.antiSpam = true
L16_1 = {}
L17_1 = {}
L18_1 = "offence"
L19_1 = "edit"
L17_1[1] = L18_1
L17_1[2] = L19_1
L16_1[1] = L17_1
L15_1.permissions = L16_1
L12_1(L13_1, L14_1, L15_1)
L12_1 = L11_1
L13_1 = "deleteOffenceCategory"
function L14_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
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
  L4_2 = "DELETE FROM lbtablet_police_offences_categories WHERE title = ?"
  L5_2 = {}
  L6_2 = A2_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  L3_2 = L3_2 > 0
  if L3_2 then
    L4_2 = L4_1
    L4_2[A2_2] = nil
    L4_2 = TriggerClientEvent
    L5_2 = "tablet:police:deleteOffenceCategory"
    L6_2 = -1
    L7_2 = A2_2
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = L10_1
    L5_2 = A1_2
    L6_2 = A2_2
    L7_2 = "delete"
    L8_2 = "offence_category"
    L9_2 = L
    L10_2 = "BACKEND.POLICE.LOGS.DELETE_OFFENCE_CATEGORY.TITLE"
    L9_2 = L9_2(L10_2)
    L10_2 = L
    L11_2 = "BACKEND.POLICE.LOGS.DELETE_OFFENCE_CATEGORY.DESCRIPTION"
    L12_2 = {}
    L12_2.name = A2_2
    L10_2, L11_2, L12_2 = L10_2(L11_2, L12_2)
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  end
  return L3_2
end
L15_1 = {}
L16_1 = {}
L17_1 = {}
L18_1 = "offence"
L19_1 = "delete"
L17_1[1] = L18_1
L17_1[2] = L19_1
L16_1[1] = L17_1
L15_1.permissions = L16_1
L12_1(L13_1, L14_1, L15_1)
L12_1 = L11_1
L13_1 = "addOffence"
function L14_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L4_2 = A3_2.class
  L5_2 = A3_2.title
  L6_2 = A3_2.description
  L7_2 = A3_2.fine
  L8_2 = A3_2.jailTime
  if not L6_2 then
    L6_2 = ""
  end
  if not (A2_2 and L4_2) or not L5_2 then
    L9_2 = debugprint
    L10_2 = "Missing required fields"
    L11_2 = A3_2
    L9_2(L10_2, L11_2)
    L9_2 = false
    return L9_2
  end
  L9_2 = Config
  L9_2 = L9_2.Police
  L9_2 = L9_2.OffenceClasses
  L9_2 = L9_2[L4_2]
  if not L9_2 then
    L9_2 = debugprint
    L10_2 = "Invalid class"
    L11_2 = L4_2
    L9_2(L10_2, L11_2)
    L9_2 = false
    return L9_2
  end
  L9_2 = MySQL
  L9_2 = L9_2.scalar
  L9_2 = L9_2.await
  L10_2 = "SELECT id FROM lbtablet_police_offences_categories WHERE title = ?"
  L11_2 = {}
  L12_2 = A2_2
  L11_2[1] = L12_2
  L9_2 = L9_2(L10_2, L11_2)
  if L9_2 then
    L10_2 = L4_1
    L10_2 = L10_2[A2_2]
    if L10_2 then
      goto lbl_53
    end
  end
  L10_2 = debugprint
  L11_2 = "Category does not exist"
  L10_2(L11_2)
  L10_2 = false
  do return L10_2 end
  ::lbl_53::
  L10_2 = MySQL
  L10_2 = L10_2.insert
  L10_2 = L10_2.await
  L11_2 = "INSERT INTO lbtablet_police_offences (category_id, class, title, `description`, fine, jail_time) VALUES (?, ?, ?, ?, ?, ?)"
  L12_2 = {}
  L13_2 = L9_2
  L14_2 = L4_2
  L15_2 = L5_2
  L16_2 = L6_2
  L17_2 = L7_2 or L17_2
  if not L7_2 then
    L17_2 = 0
  end
  L18_2 = L8_2 or L18_2
  if not L8_2 then
    L18_2 = 0
  end
  L12_2[1] = L13_2
  L12_2[2] = L14_2
  L12_2[3] = L15_2
  L12_2[4] = L16_2
  L12_2[5] = L17_2
  L12_2[6] = L18_2
  L10_2 = L10_2(L11_2, L12_2)
  if not L10_2 then
    L11_2 = debugprint
    L12_2 = "Failed to insert offence"
    L11_2(L12_2)
    L11_2 = false
    return L11_2
  end
  L11_2 = L4_1
  L11_2 = L11_2[A2_2]
  L12_2 = {}
  L12_2.id = L10_2
  L12_2.categoryId = L9_2
  L12_2.class = L4_2
  L12_2.title = L5_2
  L12_2.description = L6_2
  L12_2.fine = L7_2
  L12_2.jailTime = L8_2
  L12_2.category = A2_2
  L13_2 = #L11_2
  L13_2 = L13_2 + 1
  L11_2[L13_2] = L12_2
  L13_2 = TriggerClientEvent
  L14_2 = "tablet:police:addOffence"
  L15_2 = -1
  L16_2 = L12_2
  L13_2(L14_2, L15_2, L16_2)
  L13_2 = L10_1
  L14_2 = A1_2
  L15_2 = L10_2
  L16_2 = "create"
  L17_2 = "offence"
  L18_2 = L
  L19_2 = "BACKEND.POLICE.LOGS.CREATE_OFFENCE.TITLE"
  L18_2 = L18_2(L19_2)
  L19_2 = L
  L20_2 = "BACKEND.POLICE.LOGS.CREATE_OFFENCE.DESCRIPTION"
  L21_2 = {}
  L21_2.class = L4_2
  L21_2.name = L5_2
  L21_2.category = A2_2
  L19_2, L20_2, L21_2 = L19_2(L20_2, L21_2)
  L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
  return L10_2
end
L15_1 = {}
L15_1.antiSpam = true
L16_1 = {}
L17_1 = {}
L18_1 = "offence"
L19_1 = "create"
L17_1[1] = L18_1
L17_1[2] = L19_1
L16_1[1] = L17_1
L15_1.permissions = L16_1
L12_1(L13_1, L14_1, L15_1)
L12_1 = L11_1
L13_1 = "updateOffence"
function L14_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L4_2 = A3_2.class
  L5_2 = A3_2.title
  L6_2 = A3_2.description
  L7_2 = A3_2.fine
  L8_2 = A3_2.jailTime
  if not L6_2 then
    L6_2 = ""
  end
  if not L7_2 then
    L7_2 = 0
  end
  if not L8_2 then
    L8_2 = 0
  end
  if not (A2_2 and L4_2) or not L5_2 then
    L9_2 = debugprint
    L10_2 = "updateOffence: Missing required fields"
    L11_2 = A2_2
    L12_2 = A3_2
    L9_2(L10_2, L11_2, L12_2)
    L9_2 = false
    return L9_2
  end
  L9_2 = L5_1
  L10_2 = A2_2
  L9_2 = L9_2(L10_2)
  if not L9_2 then
    L10_2 = debugprint
    L11_2 = "updateOffence: invalid offence"
    L12_2 = A2_2
    L10_2(L11_2, L12_2)
    L10_2 = false
    return L10_2
  end
  L9_2.class = L4_2
  L9_2.title = L5_2
  L9_2.description = L6_2
  L9_2.fine = L7_2
  L9_2.jailTime = L8_2
  L10_2 = MySQL
  L10_2 = L10_2.update
  L10_2 = L10_2.await
  L11_2 = [[
        UPDATE lbtablet_police_offences
        SET class = ?, title = ?, `description` = ?, fine = ?, jail_time = ?
        WHERE id = ?
    ]]
  L12_2 = {}
  L13_2 = L4_2
  L14_2 = L5_2
  L15_2 = L6_2
  L16_2 = L7_2
  L17_2 = L8_2
  L18_2 = A2_2
  L12_2[1] = L13_2
  L12_2[2] = L14_2
  L12_2[3] = L15_2
  L12_2[4] = L16_2
  L12_2[5] = L17_2
  L12_2[6] = L18_2
  L10_2 = L10_2(L11_2, L12_2)
  L10_2 = L10_2 > 0
  if not L10_2 then
    L11_2 = debugprint
    L12_2 = "Failed to update offence"
    L11_2(L12_2)
    L11_2 = false
    return L11_2
  end
  L11_2 = TriggerClientEvent
  L12_2 = "tablet:police:updateOffence"
  L13_2 = -1
  L14_2 = L9_2
  L11_2(L12_2, L13_2, L14_2)
  L11_2 = L10_1
  L12_2 = A1_2
  L13_2 = A2_2
  L14_2 = "update"
  L15_2 = "offence"
  L16_2 = L
  L17_2 = "BACKEND.POLICE.LOGS.UPDATE_OFFENCE.TITLE"
  L16_2 = L16_2(L17_2)
  L17_2 = L
  L18_2 = "BACKEND.POLICE.LOGS.UPDATE_OFFENCE.DESCRIPTION"
  L19_2 = {}
  L19_2.name = L5_2
  L20_2 = L9_2.category
  L19_2.category = L20_2
  L17_2, L18_2, L19_2, L20_2 = L17_2(L18_2, L19_2)
  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  L11_2 = true
  return L11_2
end
L15_1 = {}
L15_1.antiSpam = true
L16_1 = {}
L17_1 = {}
L18_1 = "offence"
L19_1 = "edit"
L17_1[1] = L18_1
L17_1[2] = L19_1
L16_1[1] = L17_1
L15_1.permissions = L16_1
L12_1(L13_1, L14_1, L15_1)
L12_1 = L11_1
L13_1 = "deleteOffence"
function L14_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L3_2 = L5_1
  L4_2 = A2_2
  L3_2, L4_2 = L3_2(L4_2)
  if not L3_2 then
    L5_2 = debugprint
    L6_2 = "Offence does not exist"
    L5_2(L6_2)
    L5_2 = false
    return L5_2
  end
  L5_2 = MySQL
  L5_2 = L5_2.update
  L5_2 = L5_2.await
  L6_2 = "DELETE FROM lbtablet_police_offences WHERE id = ?"
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
    L8_2 = "tablet:police:deleteOffence"
    L9_2 = -1
    L10_2 = A2_2
    L7_2(L8_2, L9_2, L10_2)
    L7_2 = L10_1
    L8_2 = A1_2
    L9_2 = A2_2
    L10_2 = "delete"
    L11_2 = "offence"
    L12_2 = L
    L13_2 = "BACKEND.POLICE.LOGS.DELETE_OFFENCE.TITLE"
    L12_2 = L12_2(L13_2)
    L13_2 = L
    L14_2 = "BACKEND.POLICE.LOGS.DELETE_OFFENCE.DESCRIPTION"
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
L15_1 = {}
L16_1 = {}
L17_1 = {}
L18_1 = "offence"
L19_1 = "delete"
L17_1[1] = L18_1
L17_1[2] = L19_1
L16_1[1] = L17_1
L15_1.permissions = L16_1
L12_1(L13_1, L14_1, L15_1)
function L12_1(A0_2, A1_2, A2_2)
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
L13_1 = L11_1
L14_1 = "getTags"
function L15_1(A0_2, A1_2)
  local L2_2
  L2_2 = L0_1
  return L2_2
end
L13_1(L14_1, L15_1)
function L13_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = 1
  L4_2 = L0_1
  L4_2 = #L4_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = L0_1
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
  L4_2 = "INSERT INTO lbtablet_police_tags (title, color, `type`) VALUES (?, ?, ?)"
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
    L5_2 = L0_1
    L5_2 = #L5_2
    L6_2 = L5_2 + 1
    L5_2 = L0_1
    L5_2[L6_2] = L4_2
    L5_2 = TriggerClientEvent
    L6_2 = "tablet:police:createdTag"
    L7_2 = -1
    L8_2 = L4_2
    L5_2(L6_2, L7_2, L8_2)
  end
  return L3_2
end
L14_1 = L11_1
L15_1 = "createTag"
function L16_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L5_2 = L13_1
  L6_2 = A2_2
  L7_2 = A3_2
  L8_2 = A4_2
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  if L5_2 then
    L6_2 = L10_1
    L7_2 = A1_2
    L8_2 = L5_2
    L9_2 = "create"
    L10_2 = "tag"
    L11_2 = L
    L12_2 = "APPS.POLICE.LOGS.CREATE_TAG_TITLE"
    L11_2 = L11_2(L12_2)
    L12_2 = L
    L13_2 = "APPS.POLICE.LOGS.CREATE_TAG_DESCRIPTION"
    L14_2 = {}
    L15_2 = L
    L16_2 = "APPS.POLICE.LOGS.TAG_TYPES."
    L18_2 = A4_2
    L17_2 = A4_2.upper
    L17_2 = L17_2(L18_2)
    L16_2 = L16_2 .. L17_2
    L15_2 = L15_2(L16_2)
    L14_2.type = L15_2
    L14_2.name = A2_2
    L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L12_2(L13_2, L14_2)
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  end
  return L5_2
end
L17_1 = {}
L17_1.antiSpam = true
L18_1 = {}
L19_1 = {}
L20_1 = "tag"
L21_1 = "create"
L19_1[1] = L20_1
L19_1[2] = L21_1
L18_1[1] = L19_1
L17_1.permissions = L18_1
L14_1(L15_1, L16_1, L17_1)
L14_1 = exports
L15_1 = "CreatePoliceTag"
L16_1 = L13_1
L14_1(L15_1, L16_1)
L14_1 = L11_1
L15_1 = "deleteTag"
function L16_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
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
  L6_2 = "DELETE FROM lbtablet_police_tags WHERE id = ?"
  L7_2 = {}
  L8_2 = A2_2
  L7_2[1] = L8_2
  L5_2 = L5_2(L6_2, L7_2)
  L5_2 = L5_2 > 0
  if not L5_2 then
    L6_2 = false
    return L6_2
  end
  L6_2 = L10_1
  L7_2 = A1_2
  L8_2 = A2_2
  L9_2 = "delete"
  L10_2 = "tag"
  L11_2 = L
  L12_2 = "APPS.POLICE.LOGS.DELETE_TAG_TITLE"
  L11_2 = L11_2(L12_2)
  L12_2 = L
  L13_2 = "APPS.POLICE.LOGS.DELETE_TAG_DESCRIPTION"
  L14_2 = {}
  L15_2 = L
  L16_2 = "APPS.POLICE.LOGS.TAG_TYPES."
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
  L7_2 = L0_1
  L8_2 = L4_2
  L6_2(L7_2, L8_2)
  L6_2 = TriggerClientEvent
  L7_2 = "tablet:police:deletedTag"
  L8_2 = -1
  L9_2 = A2_2
  L6_2(L7_2, L8_2, L9_2)
  L6_2 = true
  return L6_2
end
L17_1 = {}
L18_1 = {}
L19_1 = {}
L20_1 = "tag"
L21_1 = "delete"
L19_1[1] = L20_1
L19_1[2] = L21_1
L18_1[1] = L19_1
L17_1.permissions = L18_1
L14_1(L15_1, L16_1, L17_1)
L14_1 = exports
L15_1 = "DeletePoliceTag"
function L16_1(A0_2)
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
  L4_2 = "DELETE FROM lbtablet_police_tags WHERE id = ?"
  L5_2 = {}
  L6_2 = A0_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  L3_2 = L3_2 > 0
  if L3_2 then
    L4_2 = table
    L4_2 = L4_2.remove
    L5_2 = L0_1
    L6_2 = L2_2
    L4_2(L5_2, L6_2)
    L4_2 = TriggerClientEvent
    L5_2 = "tablet:police:deletedTag"
    L6_2 = -1
    L7_2 = A0_2
    L4_2(L5_2, L6_2, L7_2)
  end
  return L3_2
end
L14_1(L15_1, L16_1)
L14_1 = {}
L15_1 = "profile"
L16_1 = "vehicle"
L17_1 = "property"
L18_1 = "weapon"
L14_1[1] = L15_1
L14_1[2] = L16_1
L14_1[3] = L17_1
L14_1[4] = L18_1
function L15_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = L6_1
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = debugprint
    L4_2 = "Invalid tag"
    L5_2 = A1_2
    L3_2(L4_2, L5_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = "INSERT INTO lbtablet_police_profile_tags (id, tag_id) VALUES (?, ?)"
  L5_2 = {}
  L6_2 = A0_2
  L7_2 = A1_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L3_2 = L3_2(L4_2, L5_2)
  L3_2 = L3_2 > 0
  if L3_2 then
    L4_2 = TriggerClientEvent
    L5_2 = "tablet:police:addedTag"
    L6_2 = -1
    L7_2 = A0_2
    L8_2 = L2_2.type
    L9_2 = A1_2
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  end
  return L3_2
end
L16_1 = L11_1
L17_1 = "addTag"
function L18_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = L6_1
  L5_2 = A3_2
  L4_2 = L4_2(L5_2)
  L5_2 = contains
  L6_2 = L14_1
  L7_2 = L4_2
  if L7_2 then
    L7_2 = L7_2.type
  end
  L5_2 = L5_2(L6_2, L7_2)
  if not L5_2 then
    L5_2 = debugprint
    L6_2 = "Invalid tag or tag type"
    L7_2 = L4_2
    L5_2(L6_2, L7_2)
    L5_2 = false
    return L5_2
  end
  L5_2 = L4_2.type
  if "profile" == L5_2 then
    L5_2 = HasPermission
    L6_2 = A0_2
    L7_2 = "Police"
    L8_2 = "profile"
    L9_2 = "edit"
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    if not L5_2 then
      L5_2 = false
      return L5_2
  end
  else
    L5_2 = L4_2.type
    if "vehicle" == L5_2 then
      L5_2 = HasPermission
      L6_2 = A0_2
      L7_2 = "Police"
      L8_2 = "vehicle"
      L9_2 = "edit"
      L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
      if not L5_2 then
        L5_2 = false
        return L5_2
    end
    else
      L5_2 = L4_2.type
      if "property" == L5_2 then
        L5_2 = HasPermission
        L6_2 = A0_2
        L7_2 = "Police"
        L8_2 = "property"
        L9_2 = "edit"
        L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
        if not L5_2 then
          L5_2 = false
          return L5_2
      end
      else
        L5_2 = L4_2.type
        if "weapon" == L5_2 then
          L5_2 = HasPermission
          L6_2 = A0_2
          L7_2 = "Police"
          L8_2 = "weapon"
          L9_2 = "edit"
          L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
          if not L5_2 then
            L5_2 = false
            return L5_2
          end
        end
      end
    end
  end
  L5_2 = L15_1
  L6_2 = A2_2
  L7_2 = A3_2
  L5_2 = L5_2(L6_2, L7_2)
  return L5_2
end
L19_1 = {}
L19_1.antiSpam = true
L16_1(L17_1, L18_1, L19_1)
L16_1 = exports
L17_1 = "AddTagToPoliceProfile"
L18_1 = L15_1
L16_1(L17_1, L18_1)
function L16_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = MySQL
  L2_2 = L2_2.update
  L2_2 = L2_2.await
  L3_2 = "DELETE FROM lbtablet_police_profile_tags WHERE id = ? AND tag_id = ?"
  L4_2 = {}
  L5_2 = A0_2
  L6_2 = A1_2
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L2_2 = L2_2(L3_2, L4_2)
  L2_2 = L2_2 > 0
  if L2_2 then
    L3_2 = TriggerClientEvent
    L4_2 = "tablet:police:removedTag"
    L5_2 = -1
    L6_2 = A0_2
    L7_2 = A1_2
    L3_2(L4_2, L5_2, L6_2, L7_2)
  end
  return L2_2
end
L17_1 = L11_1
L18_1 = "removeTag"
function L19_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = L6_1
  L5_2 = A3_2
  L4_2 = L4_2(L5_2)
  L5_2 = contains
  L6_2 = L14_1
  L7_2 = L4_2
  if L7_2 then
    L7_2 = L7_2.type
  end
  L5_2 = L5_2(L6_2, L7_2)
  if not L5_2 then
    L5_2 = debugprint
    L6_2 = "Invalid tag or tag type"
    L7_2 = L4_2
    L5_2(L6_2, L7_2)
    L5_2 = false
    return L5_2
  end
  L5_2 = L4_2.type
  if "profile" == L5_2 then
    L5_2 = HasPermission
    L6_2 = A0_2
    L7_2 = "Police"
    L8_2 = "profile"
    L9_2 = "edit"
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    if not L5_2 then
      L5_2 = false
      return L5_2
  end
  else
    L5_2 = L4_2.type
    if "vehicle" == L5_2 then
      L5_2 = HasPermission
      L6_2 = A0_2
      L7_2 = "Police"
      L8_2 = "vehicle"
      L9_2 = "edit"
      L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
      if not L5_2 then
        L5_2 = false
        return L5_2
    end
    else
      L5_2 = L4_2.type
      if "property" == L5_2 then
        L5_2 = HasPermission
        L6_2 = A0_2
        L7_2 = "Police"
        L8_2 = "property"
        L9_2 = "edit"
        L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
        if not L5_2 then
          L5_2 = false
          return L5_2
      end
      else
        L5_2 = L4_2.type
        if "weapon" == L5_2 then
          L5_2 = HasPermission
          L6_2 = A0_2
          L7_2 = "Police"
          L8_2 = "weapon"
          L9_2 = "edit"
          L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
          if not L5_2 then
            L5_2 = false
            return L5_2
          end
        end
      end
    end
  end
  L5_2 = L16_1
  L6_2 = A2_2
  L7_2 = A3_2
  L5_2 = L5_2(L6_2, L7_2)
  return L5_2
end
L17_1(L18_1, L19_1)
L17_1 = exports
L18_1 = "RemoveTagFromPoliceProfile"
L19_1 = L16_1
L17_1(L18_1, L19_1)
L17_1 = L11_1
L18_1 = "getDispatches"
function L19_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = GetJobDispatches
  L3_2 = "police"
  return L2_2(L3_2)
end
L20_1 = {}
L21_1 = {}
L20_1.defaultReturn = L21_1
L17_1(L18_1, L19_1, L20_1)
L17_1 = L11_1
L18_1 = "searchUsers"
function L19_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L5_2 = {}
  if A3_2 then
    L6_2 = A3_2.policeOnly
    if L6_2 then
      L6_2 = L3_1
      L5_2.jobs = L6_2
    end
    L6_2 = A3_2.excludeJailed
    if L6_2 then
      L5_2.excludeJailed = true
    end
    L6_2 = A3_2.tags
    if L6_2 then
      L6_2 = A3_2.tags
      L5_2.tags = L6_2
    end
    L6_2 = A3_2.licenses
    if L6_2 then
      L6_2 = A3_2.licenses
      L5_2.licenses = L6_2
    end
    L6_2 = A3_2.warrant
    if nil ~= L6_2 then
      L6_2 = A3_2.warrant
      L6_2 = true == L6_2
      L5_2.warrant = L6_2
    end
    L6_2 = A3_2.gender
    if L6_2 then
      L6_2 = A3_2.gender
      L5_2.gender = L6_2
    end
    L6_2 = A3_2.tags
    if L6_2 then
      L6_2 = {}
      L6_2.tagsTable = "lbtablet_police_profile_tags"
      L6_2.tagsColumn = "id"
      L7_2 = A3_2.tags
      L6_2.tags = L7_2
      L5_2.tags = L6_2
    end
  end
  L6_2 = SearchUsers
  L7_2 = A2_2
  L8_2 = L5_2
  L9_2 = "lbtablet_police_profiles"
  L10_2 = A4_2
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
  L7_2 = 1
  L8_2 = #L6_2
  L9_2 = 1
  for L10_2 = L7_2, L8_2, L9_2 do
    L11_2 = L6_2[L10_2]
    L12_2 = L12_1
    L13_2 = "lbtablet_police_profile_tags"
    L14_2 = "id"
    L15_2 = L11_2.id
    L12_2 = L12_2(L13_2, L14_2, L15_2)
    L11_2.tags = L12_2
    L12_2 = GetPlayerLicenses
    L13_2 = L11_2.id
    L12_2 = L12_2(L13_2)
    L11_2.licenses = L12_2
  end
  return L6_2
end
L20_1 = {}
L21_1 = {}
L20_1.defaultReturn = L21_1
L17_1(L18_1, L19_1, L20_1)
L17_1 = L11_1
L18_1 = "fetchUser"
function L19_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L3_2 = Queries
  L3_2 = L3_2.Users
  L3_2 = L3_2.FetchProfile
  L5_2 = L3_2
  L4_2 = L3_2.gsub
  L6_2 = "{PROFILE_JOIN}"
  L7_2 = "lbtablet_police_profiles"
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
  L5_2 = GetSourceFromIdentifier
  L6_2 = A2_2
  L5_2 = L5_2(L6_2)
  L6_2 = L12_1
  L7_2 = "lbtablet_police_profile_tags"
  L8_2 = "id"
  L9_2 = A2_2
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L4_2.tags = L6_2
  L6_2 = GetPlayerLicenses
  L7_2 = A2_2
  L6_2 = L6_2(L7_2)
  L4_2.licenses = L6_2
  L6_2 = GetVehicles
  L7_2 = A2_2
  L6_2 = L6_2(L7_2)
  L4_2.vehicles = L6_2
  if L5_2 then
    L6_2 = GetJob
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    L7_2 = L6_2.label
    if L7_2 then
      L7_2 = L6_2.grade_label
      if L7_2 then
        L7_2 = L6_2.label
        L4_2.job = L7_2
        L7_2 = L6_2.grade_label
        L4_2.jobGrade = L7_2
      end
    end
  end
  L6_2 = Config
  L6_2 = L6_2.LBPhone
  if L6_2 then
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
  L6_2 = Config
  L6_2 = L6_2.Police
  L6_2 = L6_2.Profile
  if L6_2 then
    L6_2 = L6_2.CustomFields
  end
  if L6_2 then
    L6_2 = Config
    L6_2 = L6_2.Police
    L6_2 = L6_2.Profile
    L6_2 = L6_2.CustomFields
    L6_2 = #L6_2
    if L6_2 > 0 then
      L6_2 = GetCustomFields
      if L6_2 then
        L6_2 = GetCustomFields
        L7_2 = "police"
        L8_2 = "user"
        L9_2 = A2_2
        L6_2 = L6_2(L7_2, L8_2, L9_2)
        L7_2 = pairs
        L8_2 = L6_2
        L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
        for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
          L4_2[L11_2] = L12_2
        end
      end
    end
  end
  L6_2 = MySQL
  L6_2 = L6_2.query
  L6_2 = L6_2.await
  L7_2 = [[
        SELECT
            c.id,
            c.title,
            IFNULL(i.involvement, 'criminal') AS involvement

        FROM
            lbtablet_police_cases c

        LEFT JOIN lbtablet_police_cases_involved i
            ON c.id = i.case_id
        LEFT JOIN lbtablet_police_cases_criminals cr
            ON c.id = cr.case_id

        WHERE
            i.involved = ?
            OR cr.id = ?

        GROUP BY
            c.id
    ]]
  L8_2 = {}
  L9_2 = A2_2
  L10_2 = A2_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L6_2 = L6_2(L7_2, L8_2)
  L4_2.cases = L6_2
  L6_2 = MySQL
  L6_2 = L6_2.query
  L6_2 = L6_2.await
  L7_2 = [[
        SELECT
            r.id,
            r.title,
            i.involvement

        FROM
            lbtablet_police_reports_involved i

        LEFT JOIN lbtablet_police_reports r
            ON r.id = i.report_id

        WHERE
            i.involved = ?
    ]]
  L8_2 = {}
  L9_2 = A2_2
  L8_2[1] = L9_2
  L6_2 = L6_2(L7_2, L8_2)
  L4_2.reports = L6_2
  L6_2 = MySQL
  L6_2 = L6_2.query
  L6_2 = L6_2.await
  L7_2 = [[
        SELECT
            w.serial_number AS serialNumber,
            w.weapon_name AS model

        FROM lbtablet_police_weapons w
        WHERE w.owner = ?
    ]]
  L8_2 = {}
  L9_2 = A2_2
  L8_2[1] = L9_2
  L6_2 = L6_2(L7_2, L8_2)
  L4_2.weapons = L6_2
  L6_2 = MySQL
  L6_2 = L6_2.query
  L6_2 = L6_2.await
  L7_2 = [[
        SELECT
            id,
            title AS label,
            warrant_status AS `status`

        FROM lbtablet_police_warrants
        WHERE linked_profile_type = 'player' AND linked_profile_id = ?
    ]]
  L8_2 = {}
  L9_2 = A2_2
  L8_2[1] = L9_2
  L6_2 = L6_2(L7_2, L8_2)
  L4_2.warrants = L6_2
  L6_2 = 1
  L7_2 = L4_2.weapons
  L7_2 = #L7_2
  L8_2 = 1
  for L9_2 = L6_2, L7_2, L8_2 do
    L10_2 = L4_2.weapons
    L10_2 = L10_2[L9_2]
    L11_2 = L10_2.model
    if L11_2 then
      L11_2 = GetWeaponName
      if L11_2 then
        L11_2 = GetWeaponName
        L12_2 = L10_2.model
        L11_2 = L11_2(L12_2)
        if L11_2 then
          goto lbl_170
        end
      end
    end
    L11_2 = "??"
    ::lbl_170::
    L10_2.model = L11_2
  end
  L6_2 = MySQL
  L6_2 = L6_2.query
  L6_2 = L6_2.await
  L7_2 = [[
        SELECT
            offence_id AS id,
            CAST(SUM(charges) AS INT) AS charges
        FROM
            lbtablet_police_cases_charges
        WHERE
            criminal = ?
        GROUP BY
            offence_id
    ]]
  L8_2 = {}
  L9_2 = A2_2
  L8_2[1] = L9_2
  L6_2 = L6_2(L7_2, L8_2)
  L4_2.charges = L6_2
  L6_2 = GetPlayerProperties
  if L6_2 then
    L6_2 = GetPlayerProperties
    L7_2 = A2_2
    L6_2 = L6_2(L7_2)
    L4_2.properties = L6_2
    L6_2 = 1
    L7_2 = L4_2.properties
    L7_2 = #L7_2
    L8_2 = 1
    for L9_2 = L6_2, L7_2, L8_2 do
      L10_2 = L4_2.properties
      L10_2 = L10_2[L9_2]
      L11_2 = "house:"
      L12_2 = L10_2.id
      L11_2 = L11_2 .. L12_2
      L10_2.id = L11_2
    end
  end
  return L4_2
end
L17_1(L18_1, L19_1)
L17_1 = {}
L18_1 = "player"
L19_1 = "vehicle"
L20_1 = "property"
L21_1 = "weapon"
L17_1[1] = L18_1
L17_1[2] = L19_1
L17_1[3] = L20_1
L17_1[4] = L21_1
L18_1 = L11_1
L19_1 = "updateProfile"
function L20_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L3_2 = contains
  L4_2 = L17_1
  L5_2 = A2_2
  if L5_2 then
    L5_2 = L5_2.type
  end
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L3_2 = debugprint
    L4_2 = "Invalid profile type"
    L3_2(L4_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = A2_2.type
  if "player" == L3_2 then
    L3_2 = HasPermission
    L4_2 = A0_2
    L5_2 = "Police"
    L6_2 = "profile"
    L7_2 = "edit"
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
    if not L3_2 then
      L3_2 = false
      return L3_2
  end
  else
    L3_2 = A2_2.type
    if "vehicle" == L3_2 then
      L3_2 = HasPermission
      L4_2 = A0_2
      L5_2 = "Police"
      L6_2 = "vehicle"
      L7_2 = "edit"
      L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
      if not L3_2 then
        L3_2 = false
        return L3_2
    end
    else
      L3_2 = A2_2.type
      if "property" == L3_2 then
        L3_2 = HasPermission
        L4_2 = A0_2
        L5_2 = "Police"
        L6_2 = "property"
        L7_2 = "edit"
        L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
        if not L3_2 then
          L3_2 = false
          return L3_2
      end
      else
        L3_2 = A2_2.type
        if "weapon" == L3_2 then
          L3_2 = HasPermission
          L4_2 = A0_2
          L5_2 = "Police"
          L6_2 = "weapon"
          L7_2 = "edit"
          L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
          if not L3_2 then
            L3_2 = false
            return L3_2
          end
        end
      end
    end
  end
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = [[
        INSERT INTO lbtablet_police_profiles (id, avatar, notes, profile_type)
        VALUES (?, ?, ?, ?)
        ON DUPLICATE KEY UPDATE avatar = VALUES(avatar), notes = VALUES(notes), profile_type = VALUES(profile_type)
    ]]
  L5_2 = {}
  L6_2 = A2_2.id
  L7_2 = A2_2.avatar
  L8_2 = A2_2.notes
  if not L8_2 then
    L8_2 = ""
  end
  L9_2 = A2_2.type
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L5_2[4] = L9_2
  L3_2 = L3_2(L4_2, L5_2)
  L3_2 = L3_2 > 0
  if L3_2 then
    L4_2 = A2_2.type
    if "player" == L4_2 then
      L4_2 = L10_1
      L5_2 = A1_2
      L6_2 = A2_2.id
      L7_2 = "update"
      L8_2 = "profile"
      L9_2 = L
      L10_2 = "APPS.POLICE.LOGS.UPDATE_PROFILE_TITLE"
      L9_2 = L9_2(L10_2)
      L10_2 = L
      L11_2 = "APPS.POLICE.LOGS.UPDATE_PROFILE_DESCRIPTION"
      L12_2 = {}
      L13_2 = GetCharacterNameFromIdentifier
      L14_2 = A2_2.id
      L13_2 = L13_2(L14_2)
      if not L13_2 then
        L13_2 = "??"
      end
      L12_2.name = L13_2
      L10_2, L11_2, L12_2, L13_2, L14_2 = L10_2(L11_2, L12_2)
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
    else
      L4_2 = A2_2.type
      if "vehicle" == L4_2 then
        L4_2 = L10_1
        L5_2 = A1_2
        L6_2 = A2_2.id
        L7_2 = "update"
        L8_2 = "vehicle"
        L9_2 = L
        L10_2 = "APPS.POLICE.LOGS.UPDATE_VEHICLE_TITLE"
        L9_2 = L9_2(L10_2)
        L10_2 = L
        L11_2 = "APPS.POLICE.LOGS.UPDATE_VEHICLE_DESCRIPTION"
        L12_2 = {}
        L13_2 = A2_2.id
        L12_2.plate = L13_2
        L10_2, L11_2, L12_2, L13_2, L14_2 = L10_2(L11_2, L12_2)
        L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
      else
        L4_2 = A2_2.type
        if "property" == L4_2 then
          L4_2 = L10_1
          L5_2 = A1_2
          L6_2 = A2_2.id
          L7_2 = "update"
          L8_2 = "property"
          L9_2 = L
          L10_2 = "APPS.POLICE.LOGS.UPDATE_PROPERTY_TITLE"
          L9_2 = L9_2(L10_2)
          L10_2 = L
          L11_2 = "APPS.POLICE.LOGS.UPDATE_PROPERTY_DESCRIPTION"
          L12_2 = {}
          L13_2 = A2_2.id
          L12_2.id = L13_2
          L10_2, L11_2, L12_2, L13_2, L14_2 = L10_2(L11_2, L12_2)
          L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
        else
          L4_2 = A2_2.type
          if "weapon" == L4_2 then
            L4_2 = A2_2.id
            L5_2 = L4_2
            L4_2 = L4_2.sub
            L6_2 = "weapon:"
            L6_2 = #L6_2
            L6_2 = L6_2 + 1
            L4_2 = L4_2(L5_2, L6_2)
            L5_2 = A2_2.model
            if L5_2 then
              L5_2 = MySQL
              L5_2 = L5_2.update
              L5_2 = L5_2.await
              L6_2 = "UPDATE lbtablet_police_weapons SET weapon_name = ? WHERE serial_number = ?"
              L7_2 = {}
              L8_2 = A2_2.model
              L9_2 = L4_2
              L7_2[1] = L8_2
              L7_2[2] = L9_2
              L5_2(L6_2, L7_2)
            end
            L5_2 = A2_2.owner
            if L5_2 then
              L5_2 = MySQL
              L5_2 = L5_2.update
              L5_2 = L5_2.await
              L6_2 = "UPDATE lbtablet_police_weapons SET owner = ? WHERE serial_number = ?"
              L7_2 = {}
              L8_2 = A2_2.owner
              L9_2 = L4_2
              L7_2[1] = L8_2
              L7_2[2] = L9_2
              L5_2(L6_2, L7_2)
            end
            L5_2 = L10_1
            L6_2 = A1_2
            L7_2 = A2_2.id
            L8_2 = "update"
            L9_2 = "weapon"
            L10_2 = L
            L11_2 = "APPS.POLICE.LOGS.UPDATE_WEAPON_TITLE"
            L10_2 = L10_2(L11_2)
            L11_2 = L
            L12_2 = "APPS.POLICE.LOGS.UPDATE_WEAPON_DESCRIPTION"
            L13_2 = {}
            L13_2.serial = L4_2
            L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2, L13_2)
            L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
          end
        end
      end
    end
    L4_2 = TriggerClientEvent
    L5_2 = "tablet:police:profileUpdated"
    L6_2 = -1
    L7_2 = A2_2
    L4_2(L5_2, L6_2, L7_2)
  end
  return L3_2
end
L21_1 = {}
L21_1.antiSpam = true
L18_1(L19_1, L20_1, L21_1)
L18_1 = L11_1
L19_1 = "revokeLicense"
function L20_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L4_2 = RevokeLicense
  L5_2 = A2_2
  L6_2 = A3_2
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 then
    L5_2 = TriggerClientEvent
    L6_2 = "tablet:police:revokedLicense"
    L7_2 = -1
    L8_2 = A2_2
    L9_2 = A3_2
    L5_2(L6_2, L7_2, L8_2, L9_2)
    L5_2 = L10_1
    L6_2 = A1_2
    L7_2 = A2_2
    L8_2 = "delete"
    L9_2 = "license"
    L10_2 = L
    L11_2 = "APPS.POLICE.LOGS.REVOKED_LICENSE_TITLE"
    L10_2 = L10_2(L11_2)
    L11_2 = L
    L12_2 = "APPS.POLICE.LOGS.REVOKED_LICENSE_DESCRIPTION"
    L13_2 = {}
    L14_2 = GetLicenseLabel
    L15_2 = A3_2
    L14_2 = L14_2(L15_2)
    L13_2.license = L14_2
    L14_2 = GetCharacterNameFromIdentifier
    L15_2 = A2_2
    L14_2 = L14_2(L15_2)
    if not L14_2 then
      L14_2 = "??"
    end
    L13_2.name = L14_2
    L11_2, L12_2, L13_2, L14_2, L15_2 = L11_2(L12_2, L13_2)
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  end
  return L4_2
end
L21_1 = {}
L22_1 = {}
L23_1 = {}
L24_1 = "license"
L25_1 = "revoke"
L23_1[1] = L24_1
L23_1[2] = L25_1
L22_1[1] = L23_1
L21_1.permissions = L22_1
L18_1(L19_1, L20_1, L21_1)
L18_1 = L11_1
L19_1 = "addLicense"
function L20_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L4_2 = AddLicense
  L5_2 = A2_2
  L6_2 = A3_2
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 then
    L5_2 = TriggerClientEvent
    L6_2 = "tablet:police:licenseAdded"
    L7_2 = -1
    L8_2 = A2_2
    L9_2 = {}
    L9_2.type = A3_2
    L10_2 = GetLicenseLabel
    L11_2 = A3_2
    L10_2 = L10_2(L11_2)
    L9_2.label = L10_2
    L5_2(L6_2, L7_2, L8_2, L9_2)
    L5_2 = L10_1
    L6_2 = A1_2
    L7_2 = A2_2
    L8_2 = "create"
    L9_2 = "license"
    L10_2 = L
    L11_2 = "APPS.POLICE.LOGS.ISSUED_LICENSE_TITLE"
    L10_2 = L10_2(L11_2)
    L11_2 = L
    L12_2 = "APPS.POLICE.LOGS.ISSUED_LICENSE_DESCRIPTION"
    L13_2 = {}
    L14_2 = GetLicenseLabel
    L15_2 = A3_2
    L14_2 = L14_2(L15_2)
    L13_2.license = L14_2
    L14_2 = GetCharacterNameFromIdentifier
    L15_2 = A2_2
    L14_2 = L14_2(L15_2)
    if not L14_2 then
      L14_2 = "??"
    end
    L13_2.name = L14_2
    L11_2, L12_2, L13_2, L14_2, L15_2 = L11_2(L12_2, L13_2)
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  end
  return L4_2
end
L21_1 = {}
L21_1.antiSpam = true
L22_1 = {}
L23_1 = {}
L24_1 = "license"
L25_1 = "add"
L23_1[1] = L24_1
L23_1[2] = L25_1
L22_1[1] = L23_1
L21_1.permissions = L22_1
L18_1(L19_1, L20_1, L21_1)
L18_1 = L11_1
L19_1 = "getAllLicenses"
function L20_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = GetAllLicenses
  if not L2_2 then
    L2_2 = infoprint
    L3_2 = "error"
    L4_2 = "GetAllLicenses is not defined (framework not supported / not set up correctly)"
    L2_2(L3_2, L4_2)
    L2_2 = {}
    return L2_2
  end
  L2_2 = GetAllLicenses
  L2_2 = L2_2()
  if not L2_2 then
    L2_2 = {}
  end
  return L2_2
end
L21_1 = {}
L22_1 = {}
L21_1.defaultReturn = L22_1
L18_1(L19_1, L20_1, L21_1)
L18_1 = L11_1
L19_1 = "searchProperties"
function L20_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L5_2 = SearchProperties
  if not L5_2 then
    L5_2 = debugprint
    L6_2 = "Invalid housing script, SearchProperties not defined"
    L5_2(L6_2)
    L5_2 = {}
    return L5_2
  end
  L5_2 = SearchProperties
  L6_2 = A2_2
  L7_2 = A4_2
  L8_2 = A3_2 or L8_2
  if not A3_2 then
    L8_2 = {}
  end
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = 1
  L7_2 = #L5_2
  L8_2 = 1
  for L9_2 = L6_2, L7_2, L8_2 do
    L10_2 = L5_2[L9_2]
    L11_2 = "house:"
    L12_2 = L10_2.id
    L11_2 = L11_2 .. L12_2
    L10_2.id = L11_2
    L11_2 = L12_1
    L12_2 = "lbtablet_police_profile_tags"
    L13_2 = "id"
    L14_2 = L10_2.id
    L11_2 = L11_2(L12_2, L13_2, L14_2)
    L10_2.tags = L11_2
  end
  return L5_2
end
L21_1 = {}
L22_1 = {}
L21_1.defaultReturn = L22_1
L18_1(L19_1, L20_1, L21_1)
L18_1 = L11_1
L19_1 = "getProperty"
function L20_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = GetProperty
  if not L3_2 then
    L3_2 = debugprint
    L4_2 = "Invalid housing script, GetProperty not defined"
    L3_2(L4_2)
    return
  end
  L3_2 = GetProperty
  L5_2 = A2_2
  L4_2 = A2_2.sub
  L6_2 = "house:"
  L6_2 = #L6_2
  L6_2 = L6_2 + 1
  L4_2, L5_2, L6_2, L7_2, L8_2 = L4_2(L5_2, L6_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  if not L3_2 then
    return
  end
  L4_2 = MySQL
  L4_2 = L4_2.single
  L4_2 = L4_2.await
  L5_2 = "SELECT avatar, notes FROM lbtablet_police_profiles WHERE id = ?"
  L6_2 = {}
  L7_2 = A2_2
  L6_2[1] = L7_2
  L4_2 = L4_2(L5_2, L6_2)
  L3_2.id = A2_2
  L5_2 = L12_1
  L6_2 = "lbtablet_police_profile_tags"
  L7_2 = "id"
  L8_2 = A2_2
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L3_2.tags = L5_2
  L5_2 = L4_2
  if L5_2 then
    L5_2 = L5_2.notes
  end
  if not L5_2 then
    L5_2 = ""
  end
  L3_2.notes = L5_2
  L5_2 = L4_2
  if L5_2 then
    L5_2 = L5_2.avatar
  end
  L3_2.avatar = L5_2
  return L3_2
end
L18_1(L19_1, L20_1)
function L18_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = A0_2.avatar
  L1_2 = A0_2.weapon_name
  if L1_2 then
    L1_2 = GetWeaponImage
    if L1_2 then
      L1_2 = GetWeaponImage
      L2_2 = A0_2.weapon_name
      L1_2 = not L1_2 and L1_2
    end
  end
  L2_2 = A0_2.weapon_name
  if L2_2 then
    L2_2 = GetWeaponName
    if L2_2 then
      L2_2 = GetWeaponName
      L3_2 = A0_2.weapon_name
      L2_2 = L2_2(L3_2)
    end
  end
  L3_2 = {}
  L4_2 = "weapon:"
  L5_2 = A0_2.serial_number
  L4_2 = L4_2 .. L5_2
  L3_2.id = L4_2
  L4_2 = A0_2.serial_number
  L3_2.serialNumber = L4_2
  L4_2 = L2_2 or L4_2
  if not L2_2 then
    L4_2 = A0_2.weapon_name
  end
  L3_2.model = L4_2
  L4_2 = A0_2.avatar
  if not L4_2 then
    L4_2 = L1_2
  end
  L3_2.picture = L4_2
  L4_2 = A0_2.owner
  if L4_2 then
    L4_2 = A0_2.owner_name
    if L4_2 then
      L4_2 = {}
      L5_2 = A0_2.owner
      L4_2.identifier = L5_2
      L5_2 = A0_2.owner_name
      L4_2.name = L5_2
    end
  end
  L3_2.owner = L4_2
  L4_2 = L12_1
  L5_2 = "lbtablet_police_profile_tags"
  L6_2 = "id"
  L7_2 = "weapon:"
  L8_2 = A0_2.serial_number
  L7_2 = L7_2 .. L8_2
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L3_2.tags = L4_2
  return L3_2
end
L19_1 = L11_1
L20_1 = "searchWeapons"
function L21_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L5_2 = "%"
  L6_2 = A2_2
  L7_2 = "%"
  L5_2 = L5_2 .. L6_2 .. L7_2
  A2_2 = L5_2
  if not A4_2 then
    A4_2 = 0
  end
  L5_2 = {}
  L6_2 = A2_2
  L7_2 = A2_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L6_2 = ""
  L7_2 = [[
        SELECT
            w.serial_number,
            w.owner,
            w.weapon_name,
            p.avatar,
            {SELECT_NAME} AS owner_name

        FROM lbtablet_police_weapons w

        LEFT JOIN lbtablet_police_profiles p
            ON p.id = CONCAT("weapon:", w.serial_number)

        {JOIN_NAME}

        WHERE
            (
                w.serial_number LIKE ?
                OR w.weapon_name LIKE ?
            )
            {WHERE_FILTER}

        LIMIT ?, ?
    ]]
  if A3_2 then
    L8_2 = A3_2.tags
    if L8_2 then
      L8_2 = 1
      L9_2 = A3_2.tags
      L9_2 = #L9_2
      L10_2 = 1
      for L11_2 = L8_2, L9_2, L10_2 do
        L12_2 = L6_2
        L13_2 = " AND EXISTS (SELECT 1 FROM lbtablet_police_profile_tags ppt WHERE ppt.id = CONCAT('weapon:', w.serial_number) AND ppt.tag_id = ?)"
        L12_2 = L12_2 .. L13_2
        L6_2 = L12_2
        L12_2 = #L5_2
        L12_2 = L12_2 + 1
        L13_2 = A3_2.tags
        L13_2 = L13_2[L11_2]
        L5_2[L12_2] = L13_2
      end
    end
  end
  L9_2 = L7_2
  L8_2 = L7_2.gsub
  L10_2 = "{WHERE_FILTER}"
  L11_2 = L6_2
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  L9_2 = L8_2
  L8_2 = L8_2.gsub
  L10_2 = "{SELECT_NAME}"
  L11_2 = Queries
  L11_2 = L11_2.Users
  L11_2 = L11_2.Select
  L11_2 = L11_2.name
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  L9_2 = L8_2
  L8_2 = L8_2.gsub
  L10_2 = "{JOIN_NAME}"
  L11_2 = FormatString
  L12_2 = "LEFT JOIN {USERS_TABLE} user ON {IDENTIFIER} {USERS_COLLATE} = w.owner"
  L13_2 = {}
  L14_2 = Queries
  L14_2 = L14_2.Users
  L14_2 = L14_2.Table
  L13_2.USERS_TABLE = L14_2
  L14_2 = Queries
  L14_2 = L14_2.Users
  L14_2 = L14_2.Select
  L14_2 = L14_2.identifier
  L13_2.IDENTIFIER = L14_2
  L14_2 = UsersCollate
  L13_2.USERS_COLLATE = L14_2
  L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2, L13_2)
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  L7_2 = L8_2
  L8_2 = #L5_2
  L8_2 = L8_2 + 1
  L9_2 = A4_2 * 10
  L5_2[L8_2] = L9_2
  L8_2 = #L5_2
  L8_2 = L8_2 + 1
  L5_2[L8_2] = 10
  L8_2 = MySQL
  L8_2 = L8_2.query
  L8_2 = L8_2.await
  L9_2 = L7_2
  L10_2 = L5_2
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = 1
  L10_2 = #L8_2
  L11_2 = 1
  for L12_2 = L9_2, L10_2, L11_2 do
    L13_2 = L18_1
    L14_2 = L8_2[L12_2]
    L13_2 = L13_2(L14_2)
    L8_2[L12_2] = L13_2
  end
  return L8_2
end
L22_1 = {}
L23_1 = {}
L22_1.defaultReturn = L23_1
L19_1(L20_1, L21_1, L22_1)
L19_1 = L11_1
L20_1 = "fetchWeapon"
function L21_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = [[
        SELECT
            w.serial_number,
            w.owner,
            w.weapon_name,
            p.avatar,
            p.notes,
            {SELECT_NAME} AS owner_name

        FROM lbtablet_police_weapons w

        LEFT JOIN lbtablet_police_profiles p
            ON p.id = CONCAT("weapon:", w.serial_number)

        {JOIN_NAME}

        WHERE w.serial_number = ?
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
  L8_2 = "LEFT JOIN {USERS_TABLE} user ON {IDENTIFIER} {USERS_COLLATE} = w.owner"
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
  L4_2 = A2_2
  L6_2 = L4_2
  L5_2 = L4_2.sub
  L7_2 = 1
  L8_2 = "weapon:"
  L8_2 = #L8_2
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  if "weapon:" == L5_2 then
    L6_2 = L4_2
    L5_2 = L4_2.sub
    L7_2 = "weapon:"
    L7_2 = #L7_2
    L7_2 = L7_2 + 1
    L5_2 = L5_2(L6_2, L7_2)
    L4_2 = L5_2
  end
  L5_2 = MySQL
  L5_2 = L5_2.single
  L5_2 = L5_2.await
  L6_2 = L3_2
  L7_2 = {}
  L8_2 = L4_2
  L7_2[1] = L8_2
  L5_2 = L5_2(L6_2, L7_2)
  if not L5_2 then
    return
  end
  L6_2 = L18_1
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = L5_2.notes
  L6_2.notes = L7_2
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        SELECT
            i.report_id AS id,
            r.title

        FROM lbtablet_police_reports_involved i

        LEFT JOIN lbtablet_police_reports r
            ON r.id = i.report_id

        WHERE i.involved = ?
    ]]
  L9_2 = {}
  L10_2 = L4_2
  L9_2[1] = L10_2
  L7_2 = L7_2(L8_2, L9_2)
  L6_2.reports = L7_2
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        SELECT
            i.case_id AS id,
            c.title

        FROM lbtablet_police_cases_involved i

        LEFT JOIN lbtablet_police_cases c
            ON c.id = i.case_id

        WHERE i.involved = ?
    ]]
  L9_2 = {}
  L10_2 = L4_2
  L9_2[1] = L10_2
  L7_2 = L7_2(L8_2, L9_2)
  L6_2.cases = L7_2
  return L6_2
end
L19_1(L20_1, L21_1)
L19_1 = L11_1
L20_1 = "registerWeapon"
function L21_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = A2_2.serialNumber
  if not L3_2 then
    L3_2 = debugprint
    L4_2 = "Missing required fields"
    L5_2 = A2_2
    L3_2(L4_2, L5_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = RegisterWeapon
  L4_2 = A2_2.serialNumber
  L5_2 = {}
  L6_2 = A2_2.owner
  L5_2.owner = L6_2
  L6_2 = A2_2.model
  L5_2.weaponName = L6_2
  L3_2(L4_2, L5_2)
  L3_2 = true
  return L3_2
end
L22_1 = {}
L22_1.antiSpam = true
L23_1 = {}
L24_1 = {}
L25_1 = "weapon"
L26_1 = "create"
L24_1[1] = L25_1
L24_1[2] = L26_1
L23_1[1] = L24_1
L22_1.permissions = L23_1
L19_1(L20_1, L21_1, L22_1)
L19_1 = L11_1
L20_1 = "deleteWeapon"
function L21_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L4_2 = A2_2
  L3_2 = A2_2.sub
  L5_2 = "weapon:"
  L5_2 = #L5_2
  L5_2 = L5_2 + 1
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = MySQL
  L4_2 = L4_2.update
  L4_2 = L4_2.await
  L5_2 = "DELETE FROM lbtablet_police_weapons WHERE serial_number = ?"
  L6_2 = {}
  L7_2 = L3_2
  L6_2[1] = L7_2
  L4_2 = L4_2(L5_2, L6_2)
  L4_2 = L4_2 > 0
  if L4_2 then
    L5_2 = TriggerClientEvent
    L6_2 = "tablet:police:weaponDeleted"
    L7_2 = -1
    L8_2 = A2_2
    L5_2(L6_2, L7_2, L8_2)
    L5_2 = L10_1
    L6_2 = A1_2
    L7_2 = L3_2
    L8_2 = "delete"
    L9_2 = "weapon"
    L10_2 = L
    L11_2 = "APPS.POLICE.LOGS.DELETE_WEAPON_TITLE"
    L10_2 = L10_2(L11_2)
    L11_2 = L
    L12_2 = "APPS.POLICE.LOGS.DELETE_WEAPON_DESCRIPTION"
    L13_2 = {}
    L13_2.serial = L3_2
    L11_2, L12_2, L13_2 = L11_2(L12_2, L13_2)
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  end
  return L4_2
end
L22_1 = {}
L23_1 = {}
L24_1 = {}
L25_1 = "weapon"
L26_1 = "delete"
L24_1[1] = L25_1
L24_1[2] = L26_1
L23_1[1] = L24_1
L22_1.permissions = L23_1
L19_1(L20_1, L21_1, L22_1)
function L19_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = assert
  L3_2 = type
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L3_2 = "string" == L3_2
  L4_2 = "Serial number must be a string"
  L2_2(L3_2, L4_2)
  L2_2 = MySQL
  L2_2 = L2_2.update
  L2_2 = L2_2.await
  L3_2 = "INSERT INTO lbtablet_police_weapons (serial_number, owner, weapon_name) VALUES (?, ?, ?)"
  L4_2 = {}
  L5_2 = A0_2
  L6_2 = A1_2
  if L6_2 then
    L6_2 = L6_2.owner
  end
  if not L6_2 then
    L6_2 = nil
  end
  L7_2 = A1_2
  if L7_2 then
    L7_2 = L7_2.weaponName
  end
  if not L7_2 then
    L7_2 = nil
  end
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L4_2[3] = L7_2
  L2_2(L3_2, L4_2)
end
RegisterWeapon = L19_1
L19_1 = exports
L20_1 = "RegisterWeapon"
L21_1 = RegisterWeapon
L19_1(L20_1, L21_1)
L19_1 = L11_1
L20_1 = "getBulletinBoard"
function L21_1(A0_2, A1_2, A2_2, A3_2)
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
        FROM lbtablet_police_bulletin b
        LEFT JOIN lbtablet_police_accounts a ON a.id = b.created_by
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
L22_1 = {}
L23_1 = {}
L24_1 = {}
L25_1 = "bulletin"
L26_1 = "view"
L24_1[1] = L25_1
L24_1[2] = L26_1
L23_1[1] = L24_1
L22_1.permissions = L23_1
L19_1(L20_1, L21_1, L22_1)
L19_1 = L11_1
L20_1 = "toggleBulletinPinned"
function L21_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L4_2 = MySQL
  L4_2 = L4_2.update
  L4_2 = L4_2.await
  L5_2 = "UPDATE lbtablet_police_bulletin SET pinned = ? WHERE id = ?"
  L6_2 = {}
  L7_2 = A3_2
  L8_2 = A2_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L4_2 = L4_2(L5_2, L6_2)
  L4_2 = L4_2 > 0
  if L4_2 and A3_2 then
    L5_2 = L10_1
    L6_2 = A1_2
    L7_2 = A2_2
    L8_2 = "update"
    L9_2 = "bulletin"
    L10_2 = L
    L11_2 = "APPS.POLICE.LOGS.PINNED_BULLETIN_TITLE"
    L10_2 = L10_2(L11_2)
    L11_2 = L
    L12_2 = "APPS.POLICE.LOGS.PINNED_BULLETIN_DESCRIPTION"
    L13_2 = {}
    L13_2.id = A2_2
    L11_2, L12_2, L13_2 = L11_2(L12_2, L13_2)
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  elseif L4_2 then
    L5_2 = L10_1
    L6_2 = A1_2
    L7_2 = A2_2
    L8_2 = "update"
    L9_2 = "bulletin"
    L10_2 = L
    L11_2 = "APPS.POLICE.LOGS.UNPINNED_BULLETIN_TITLE"
    L10_2 = L10_2(L11_2)
    L11_2 = L
    L12_2 = "APPS.POLICE.LOGS.UNPINNED_BULLETIN_DESCRIPTION"
    L13_2 = {}
    L13_2.id = A2_2
    L11_2, L12_2, L13_2 = L11_2(L12_2, L13_2)
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  end
  return L4_2
end
L22_1 = {}
L23_1 = {}
L24_1 = {}
L25_1 = "bulletin"
L26_1 = "pin"
L24_1[1] = L25_1
L24_1[2] = L26_1
L23_1[1] = L24_1
L22_1.permissions = L23_1
L19_1(L20_1, L21_1, L22_1)
function L19_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L5_2 = HasPermission
  L6_2 = A0_2
  L7_2 = "Police"
  L8_2 = "bulletin"
  L9_2 = "edit"
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  if not L5_2 then
    L5_2 = MySQL
    L5_2 = L5_2.scalar
    L5_2 = L5_2.await
    L6_2 = "SELECT created_by FROM lbtablet_police_bulletin WHERE id = ?"
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
  L6_2 = "UPDATE lbtablet_police_bulletin SET title = ?, content = ? WHERE id = ?"
  L7_2 = {}
  L8_2 = A3_2
  L9_2 = A4_2
  L10_2 = A2_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L5_2(L6_2, L7_2)
  L5_2 = L10_1
  L6_2 = A1_2
  L7_2 = A2_2
  L8_2 = "create"
  L9_2 = "bulletin"
  L10_2 = L
  L11_2 = "APPS.POLICE.LOGS.UPDATE_BULLETIN_TITLE"
  L10_2 = L10_2(L11_2)
  L11_2 = L
  L12_2 = "APPS.POLICE.LOGS.UPDATE_BULLETIN_DESCRIPTION"
  L13_2 = {}
  L13_2.title = A3_2
  L11_2, L12_2, L13_2 = L11_2(L12_2, L13_2)
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L5_2 = TriggerClientEvent
  L6_2 = "tablet:police:bulletinUpdated"
  L7_2 = -1
  L8_2 = {}
  L8_2.id = A2_2
  L8_2.title = A3_2
  L8_2.content = A4_2
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = true
  return L5_2
end
function L20_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L4_2 = HasPermission
  L5_2 = A0_2
  L6_2 = "Police"
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
  L5_2 = "INSERT INTO lbtablet_police_bulletin (title, content, created_by) VALUES (?, ?, ?)"
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
  L8_2 = L8_2.Police
  L8_2 = L8_2.Notifications
  L8_2 = L8_2.NewBulletin
  if L8_2 then
    L8_2 = L9_1
    L9_2 = {}
    L10_2 = L
    L11_2 = "BACKEND.POLICE.NEW_BULLETIN_NOTIFICATION.TITLE"
    L10_2 = L10_2(L11_2)
    L9_2.title = L10_2
    L10_2 = L
    L11_2 = "BACKEND.POLICE.NEW_BULLETIN_NOTIFICATION.CONTENT"
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
  L8_2 = L10_1
  L9_2 = A1_2
  L10_2 = L4_2
  L11_2 = "create"
  L12_2 = "bulletin"
  L13_2 = L
  L14_2 = "APPS.POLICE.LOGS.CREATE_BULLETIN_TITLE"
  L13_2 = L13_2(L14_2)
  L14_2 = L
  L15_2 = "APPS.POLICE.LOGS.CREATE_BULLETIN_DESCRIPTION"
  L16_2 = {}
  L16_2.title = A2_2
  L14_2, L15_2, L16_2 = L14_2(L15_2, L16_2)
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  L8_2 = TriggerClientEvent
  L9_2 = "tablet:police:bulletinCreated"
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
  L12_2 = GetPoliceAvatar
  L13_2 = A1_2
  L12_2 = L12_2(L13_2)
  L11_2.avatar = L12_2
  L8_2(L9_2, L10_2, L11_2)
  return L4_2
end
L21_1 = L11_1
L22_1 = "saveBulletin"
function L23_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A2_2 then
    L5_2 = L19_1
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
  L5_2 = L20_1
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
L24_1 = {}
L24_1.antiSpam = true
L21_1(L22_1, L23_1, L24_1)
L21_1 = L11_1
L22_1 = "deleteBulletin"
function L23_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = nil
  L4_2 = HasPermission
  L5_2 = A0_2
  L6_2 = "Police"
  L7_2 = "bulletin"
  L8_2 = "delete"
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if L4_2 then
    L4_2 = MySQL
    L4_2 = L4_2.update
    L4_2 = L4_2.await
    L5_2 = "DELETE FROM lbtablet_police_bulletin WHERE id = ?"
    L6_2 = {}
    L7_2 = A2_2
    L6_2[1] = L7_2
    L4_2 = L4_2(L5_2, L6_2)
    L3_2 = L4_2 > 0
  else
    L4_2 = MySQL
    L4_2 = L4_2.update
    L4_2 = L4_2.await
    L5_2 = "DELETE FROM lbtablet_police_bulletin WHERE id = ? AND created_by = ?"
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
    L5_2 = "tablet:police:bulletinDeleted"
    L6_2 = -1
    L7_2 = A2_2
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = L10_1
    L5_2 = A1_2
    L6_2 = A2_2
    L7_2 = "delete"
    L8_2 = "bulletin"
    L9_2 = L
    L10_2 = "APPS.POLICE.LOGS.DELETE_BULLETIN_TITLE"
    L9_2 = L9_2(L10_2)
    L10_2 = L
    L11_2 = "APPS.POLICE.LOGS.DELETE_BULLETIN_DESCRIPTION"
    L12_2 = {}
    L12_2.id = A2_2
    L10_2, L11_2, L12_2 = L10_2(L11_2, L12_2)
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  end
  return L3_2
end
L21_1(L22_1, L23_1)
L21_1 = L11_1
L22_1 = "searchVehicles"
function L23_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L5_2 = type
  L6_2 = A2_2
  L5_2 = L5_2(L6_2)
  if "string" ~= L5_2 then
    L5_2 = {}
    return L5_2
  end
  L5_2 = {}
  if A3_2 then
    L6_2 = A3_2.warrant
    if nil ~= L6_2 then
      L6_2 = A3_2.warrant
      L6_2 = true == L6_2
      L5_2.warrant = L6_2
    end
    L6_2 = A3_2.tags
    if L6_2 then
      L6_2 = {}
      L6_2.tagsTable = "lbtablet_police_profile_tags"
      L6_2.tagsColumn = "id"
      L7_2 = A3_2.tags
      L6_2.tags = L7_2
      L5_2.tags = L6_2
    end
  end
  L6_2 = SearchVehicles
  L7_2 = A2_2
  L8_2 = L5_2
  L9_2 = "lbtablet_police_profiles"
  L10_2 = A4_2
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
  L7_2 = 1
  L8_2 = #L6_2
  L9_2 = 1
  for L10_2 = L7_2, L8_2, L9_2 do
    L11_2 = L6_2[L10_2]
    L12_2 = L12_1
    L13_2 = "lbtablet_police_profile_tags"
    L14_2 = "id"
    L15_2 = L11_2.plate
    L12_2 = L12_2(L13_2, L14_2, L15_2)
    L11_2.tags = L12_2
  end
  return L6_2
end
L24_1 = {}
L25_1 = {}
L24_1.defaultReturn = L25_1
L21_1(L22_1, L23_1, L24_1)
L21_1 = L11_1
L22_1 = "fetchVehicle"
function L23_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L3_2 = FetchVehicle
  L4_2 = A2_2
  L5_2 = "lbtablet_police_profiles"
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = L12_1
  L5_2 = "lbtablet_police_profile_tags"
  L6_2 = "id"
  L7_2 = A2_2
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L3_2.tags = L4_2
  L4_2 = MySQL
  L4_2 = L4_2.query
  L4_2 = L4_2.await
  L5_2 = [[
        SELECT
            c.id, c.title
        FROM
            lbtablet_police_cases_involved i
            LEFT JOIN lbtablet_police_cases c
                ON c.id = i.case_id
        WHERE
            i.involved = ?
    ]]
  L6_2 = {}
  L7_2 = A2_2
  L6_2[1] = L7_2
  L4_2 = L4_2(L5_2, L6_2)
  L3_2.cases = L4_2
  L4_2 = MySQL
  L4_2 = L4_2.query
  L4_2 = L4_2.await
  L5_2 = [[
        SELECT
            id,
            title AS label,
            warrant_status AS `status`

        FROM lbtablet_police_warrants
        WHERE linked_profile_type = 'vehicle' AND linked_profile_id = ?
    ]]
  L6_2 = {}
  L7_2 = A2_2
  L6_2[1] = L7_2
  L4_2 = L4_2(L5_2, L6_2)
  L3_2.warrants = L4_2
  L4_2 = Config
  L4_2 = L4_2.Police
  L4_2 = L4_2.Vehicle
  if L4_2 then
    L4_2 = L4_2.CustomFields
  end
  if L4_2 then
    L4_2 = Config
    L4_2 = L4_2.Police
    L4_2 = L4_2.Vehicle
    L4_2 = L4_2.CustomFields
    L4_2 = #L4_2
    if L4_2 > 0 then
      L4_2 = GetCustomFields
      if L4_2 then
        L4_2 = GetCustomFields
        L5_2 = "police"
        L6_2 = "vehicle"
        L7_2 = A2_2
        L4_2 = L4_2(L5_2, L6_2, L7_2)
        L5_2 = pairs
        L6_2 = L4_2
        L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
        for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
          L3_2[L9_2] = L10_2
        end
      end
    end
  end
  return L3_2
end
L21_1(L22_1, L23_1)
L21_1 = L11_1
L22_1 = "getReports"
function L23_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  if "" ~= A3_2 then
    L5_2 = type
    L6_2 = A3_2
    L5_2 = L5_2(L6_2)
    if "string" == L5_2 then
      goto lbl_9
    end
  end
  A3_2 = nil
  ::lbl_9::
  L5_2 = {}
  L6_2 = ""
  if A3_2 then
    L7_2 = L6_2
    L8_2 = " WHERE r.title LIKE ?"
    L7_2 = L7_2 .. L8_2
    L6_2 = L7_2
    L7_2 = #L5_2
    L7_2 = L7_2 + 1
    L8_2 = "%"
    L9_2 = A3_2
    L10_2 = "%"
    L8_2 = L8_2 .. L9_2 .. L10_2
    L5_2[L7_2] = L8_2
    L8_2 = A3_2
    L7_2 = A3_2.match
    L9_2 = "^%d+$"
    L7_2 = L7_2(L8_2, L9_2)
    if nil ~= L7_2 then
      L7_2 = tonumber
      L8_2 = A3_2
      L7_2 = L7_2(L8_2)
      if L7_2 then
        L6_2 = "WHERE (r.title LIKE ? OR r.id = ?)"
        L7_2 = #L5_2
        L7_2 = L7_2 + 1
        L8_2 = tonumber
        L9_2 = A3_2
        L8_2 = L8_2(L9_2)
        L5_2[L7_2] = L8_2
      end
    end
  end
  if A4_2 then
    L7_2 = A4_2.tags
    if L7_2 then
      L7_2 = 1
      L8_2 = A4_2.tags
      L8_2 = #L8_2
      L9_2 = 1
      for L10_2 = L7_2, L8_2, L9_2 do
        L11_2 = L6_2
        L12_2 = " AND EXISTS (SELECT 1 FROM lbtablet_police_reports_tags ppt WHERE ppt.report_id = r.id AND ppt.tag_id = ?)"
        L11_2 = L11_2 .. L12_2
        L6_2 = L11_2
        L11_2 = #L5_2
        L11_2 = L11_2 + 1
        L12_2 = A4_2.tags
        L12_2 = L12_2[L10_2]
        L5_2[L11_2] = L12_2
      end
    end
  end
  if A4_2 then
    L7_2 = A4_2.type
    if L7_2 then
      L7_2 = L6_2
      L8_2 = " AND r.report_type = ?"
      L7_2 = L7_2 .. L8_2
      L6_2 = L7_2
      L7_2 = #L5_2
      L7_2 = L7_2 + 1
      L8_2 = A4_2.type
      L5_2[L7_2] = L8_2
    end
  end
  if A4_2 then
    L7_2 = A4_2.involved
    if L7_2 then
      L7_2 = 1
      L8_2 = A4_2.involved
      L8_2 = #L8_2
      L9_2 = 1
      for L10_2 = L7_2, L8_2, L9_2 do
        L11_2 = L6_2
        L12_2 = " AND EXISTS (SELECT 1 FROM lbtablet_police_reports_involved i WHERE i.report_id = r.id AND i.involved = ? AND i.involvement = ?)"
        L11_2 = L11_2 .. L12_2
        L6_2 = L11_2
        L11_2 = #L5_2
        L11_2 = L11_2 + 1
        L12_2 = A4_2.involved
        L12_2 = L12_2[L10_2]
        L12_2 = L12_2.id
        L5_2[L11_2] = L12_2
        L11_2 = #L5_2
        L11_2 = L11_2 + 1
        L12_2 = A4_2.involved
        L12_2 = L12_2[L10_2]
        L12_2 = L12_2.involvement
        L5_2[L11_2] = L12_2
      end
    end
  end
  L7_2 = #L6_2
  if L7_2 > 0 then
    L8_2 = L6_2
    L7_2 = L6_2.sub
    L9_2 = 1
    L10_2 = 4
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    if " AND" == L7_2 then
      L8_2 = L6_2
      L7_2 = L6_2.sub
      L9_2 = 5
      L7_2 = L7_2(L8_2, L9_2)
      L6_2 = L7_2
      L7_2 = " WHERE "
      L8_2 = L6_2
      L7_2 = L7_2 .. L8_2
      L6_2 = L7_2
    end
  end
  L7_2 = #L5_2
  L7_2 = L7_2 + 1
  L8_2 = A2_2 or L8_2
  if not A2_2 then
    L8_2 = 0
  end
  L8_2 = L8_2 * 10
  L5_2[L7_2] = L8_2
  L7_2 = #L5_2
  L7_2 = L7_2 + 1
  L5_2[L7_2] = 10
  L7_2 = [[
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

        FROM lbtablet_police_reports r
        LEFT JOIN lbtablet_police_accounts a ON a.id = r.created_by
        %s

        ORDER BY r.updated_at DESC
        LIMIT ?, ?
    ]]
  L8_2 = L7_2
  L7_2 = L7_2.format
  L9_2 = L6_2
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = MySQL
  L8_2 = L8_2.query
  L8_2 = L8_2.await
  L9_2 = L7_2
  L10_2 = L5_2
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = 1
  L10_2 = #L8_2
  L11_2 = 1
  for L12_2 = L9_2, L10_2, L11_2 do
    L13_2 = L8_2[L12_2]
    L14_2 = L12_1
    L15_2 = "lbtablet_police_reports_tags"
    L16_2 = "report_id"
    L17_2 = L13_2.id
    L14_2 = L14_2(L15_2, L16_2, L17_2)
    L13_2.tags = L14_2
  end
  return L8_2
end
L24_1 = {}
L25_1 = {}
L26_1 = {}
L27_1 = "report"
L28_1 = "view"
L26_1[1] = L27_1
L26_1[2] = L28_1
L25_1[1] = L26_1
L24_1.permissions = L25_1
L21_1(L22_1, L23_1, L24_1)
function L21_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = MySQL
  L1_2 = L1_2.single
  L1_2 = L1_2.await
  L2_2 = [[
        SELECT
            r.id, r.title, r.report_type AS `type`, r.`description`,
            r.created_at AS created, r.updated_at AS lastUpdated, r.created_by AS createdBy,
            a.display_name AS author,
            a.avatar
        FROM lbtablet_police_reports r
        LEFT JOIN lbtablet_police_accounts a ON a.id = r.created_by
        WHERE r.id = ?
    ]]
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "SELECT attachment FROM lbtablet_police_reports_attachments WHERE report_id = ?"
  L4_2 = {}
  L5_2 = A0_2
  L4_2[1] = L5_2
  L2_2 = L2_2(L3_2, L4_2)
  L1_2.gallery = L2_2
  L2_2 = L12_1
  L3_2 = "lbtablet_police_reports_tags"
  L4_2 = "report_id"
  L5_2 = A0_2
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L1_2.tags = L2_2
  L2_2 = [[
        SELECT
            i.involved, i.involvement, {SELECT_NAME} as `name`
        FROM lbtablet_police_reports_involved i
        {JOIN_NAME}
        WHERE
            i.report_id = ?
            AND (i.involvement = "officer" OR i.involvement = "civilian" OR i.involvement = "suspect")
    ]]
  L4_2 = L2_2
  L3_2 = L2_2.gsub
  L5_2 = "{SELECT_NAME}"
  L6_2 = Queries
  L6_2 = L6_2.Users
  L6_2 = L6_2.Select
  L6_2 = L6_2.name
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L4_2 = L3_2
  L3_2 = L3_2.gsub
  L5_2 = "{JOIN_NAME}"
  L6_2 = FormatString
  L7_2 = "LEFT JOIN {USERS_TABLE} user ON {IDENTIFIER} {USERS_COLLATE} = i.involved"
  L8_2 = {}
  L9_2 = Queries
  L9_2 = L9_2.Users
  L9_2 = L9_2.Table
  L8_2.USERS_TABLE = L9_2
  L9_2 = Queries
  L9_2 = L9_2.Users
  L9_2 = L9_2.Select
  L9_2 = L9_2.identifier
  L8_2.IDENTIFIER = L9_2
  L9_2 = UsersCollate
  L8_2.USERS_COLLATE = L9_2
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L6_2(L7_2, L8_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L2_2 = L3_2
  L3_2 = MySQL
  L3_2 = L3_2.query
  L3_2 = L3_2.await
  L4_2 = L2_2
  L5_2 = {}
  L6_2 = A0_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  L1_2.involved = L3_2
  L3_2 = MySQL
  L3_2 = L3_2.query
  L3_2 = L3_2.await
  L4_2 = [[
        SELECT
            i.involved,
            w.weapon_name

        FROM lbtablet_police_reports_involved i

        LEFT JOIN lbtablet_police_weapons w
            ON w.serial_number = i.involved

        WHERE i.report_id = ? AND i.involvement = "weapon"
    ]]
  L5_2 = {}
  L6_2 = A0_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  L1_2.weaponsInvolved = L3_2
  L3_2 = 1
  L4_2 = L1_2.weaponsInvolved
  L4_2 = #L4_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = L1_2.weaponsInvolved
    L7_2 = L7_2[L6_2]
    L8_2 = L1_2.weaponsInvolved
    L9_2 = {}
    L10_2 = "weapon:"
    L11_2 = L7_2.involved
    L10_2 = L10_2 .. L11_2
    L9_2.id = L10_2
    L10_2 = L7_2.involved
    L9_2.serialNumber = L10_2
    L10_2 = L7_2.weapon_name
    if L10_2 then
      L10_2 = GetWeaponName
      if L10_2 then
        L10_2 = GetWeaponName
        L11_2 = L7_2.weapon_name
        L10_2 = L10_2(L11_2)
      end
    end
    L9_2.model = L10_2
    L8_2[L6_2] = L9_2
  end
  return L1_2
end
L22_1 = L11_1
L23_1 = "getReport"
function L24_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  L3_2 = L21_1
  L4_2 = A2_2
  return L3_2(L4_2)
end
L22_1(L23_1, L24_1)
function L22_1(A0_2, A1_2, A2_2)
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
        L3_2 = type
        L4_2 = A2_2
        if L4_2 then
          L4_2 = L4_2.type
        end
        L3_2 = L3_2(L4_2)
        if "string" == L3_2 then
          goto lbl_35
        end
      end
    end
  end
  L3_2 = debugprint
  L4_2 = "SaveReport: Invalid data"
  L5_2 = A2_2
  L3_2(L4_2, L5_2)
  L3_2 = false
  do return L3_2 end
  ::lbl_35::
  L3_2 = A2_2.id
  L4_2 = A2_2.title
  L5_2 = A2_2.description
  L6_2 = A2_2.type
  L7_2 = A2_2.tags
  if not L7_2 then
    L7_2 = {}
  end
  L8_2 = A2_2.gallery
  if not L8_2 then
    L8_2 = {}
  end
  L9_2 = A2_2.officers
  if not L9_2 then
    L9_2 = {}
  end
  L10_2 = A2_2.civilians
  if not L10_2 then
    L10_2 = {}
  end
  L11_2 = A2_2.suspects
  if not L11_2 then
    L11_2 = {}
  end
  L12_2 = A2_2.weapons
  if not L12_2 then
    L12_2 = {}
  end
  if not L3_2 then
    L13_2 = HasPermission
    L14_2 = A0_2
    L15_2 = "Police"
    L16_2 = "report"
    L17_2 = "create"
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
    if not L13_2 then
      L13_2 = false
      return L13_2
    end
    L13_2 = MySQL
    L13_2 = L13_2.insert
    L13_2 = L13_2.await
    L14_2 = "INSERT INTO lbtablet_police_reports (title, report_type, created_by, `description`) VALUES (?, ?, ?, ?)"
    L15_2 = {}
    L16_2 = L4_2
    L17_2 = L6_2
    L18_2 = A1_2
    L19_2 = L5_2
    L15_2[1] = L16_2
    L15_2[2] = L17_2
    L15_2[3] = L18_2
    L15_2[4] = L19_2
    L13_2 = L13_2(L14_2, L15_2)
    L3_2 = L13_2
    L13_2 = L10_1
    L14_2 = A1_2
    L15_2 = L3_2
    L16_2 = "create"
    L17_2 = "report"
    L18_2 = L
    L19_2 = "APPS.POLICE.LOGS.CREATE_REPORT_TITLE"
    L18_2 = L18_2(L19_2)
    L19_2 = L
    L20_2 = "APPS.POLICE.LOGS.CREATE_REPORT_DESCRIPTION"
    L21_2 = {}
    L22_2 = L6_2 or L22_2
    if not L6_2 then
      L22_2 = ""
    end
    L21_2.type = L22_2
    L21_2.title = L4_2
    L19_2, L20_2, L21_2, L22_2 = L19_2(L20_2, L21_2)
    L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
    L13_2 = Config
    L13_2 = L13_2.Police
    L13_2 = L13_2.Notifications
    L13_2 = L13_2.NewReport
    if L13_2 then
      L13_2 = L9_1
      L14_2 = {}
      L15_2 = L
      L16_2 = "BACKEND.POLICE.NEW_REPORT_NOTIFICATION.TITLE"
      L15_2 = L15_2(L16_2)
      L14_2.title = L15_2
      L15_2 = L
      L16_2 = "BACKEND.POLICE.NEW_REPORT_NOTIFICATION.CONTENT"
      L17_2 = {}
      L17_2.title = L4_2
      L17_2.description = L5_2
      L15_2 = L15_2(L16_2, L17_2)
      L14_2.content = L15_2
      L15_2 = {}
      L16_2 = A1_2
      L15_2[1] = L16_2
      L13_2(L14_2, L15_2)
    end
  else
    L13_2 = HasPermission
    L14_2 = A0_2
    L15_2 = "Police"
    L16_2 = "report"
    L17_2 = "edit"
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
    if not L13_2 then
      L13_2 = false
      return L13_2
    end
    L13_2 = MySQL
    L13_2 = L13_2.rawExecute
    L13_2 = L13_2.await
    L14_2 = "UPDATE lbtablet_police_reports SET title = ?, report_type = ?, `description` = ? WHERE id = ?"
    L15_2 = {}
    L16_2 = L4_2
    L17_2 = L6_2
    L18_2 = L5_2
    L19_2 = L3_2
    L15_2[1] = L16_2
    L15_2[2] = L17_2
    L15_2[3] = L18_2
    L15_2[4] = L19_2
    L13_2(L14_2, L15_2)
    L13_2 = MySQL
    L13_2 = L13_2.rawExecute
    L13_2 = L13_2.await
    L14_2 = "DELETE FROM lbtablet_police_reports_tags WHERE report_id = ?"
    L15_2 = {}
    L16_2 = L3_2
    L15_2[1] = L16_2
    L13_2(L14_2, L15_2)
    L13_2 = MySQL
    L13_2 = L13_2.rawExecute
    L13_2 = L13_2.await
    L14_2 = "DELETE FROM lbtablet_police_reports_attachments WHERE report_id = ?"
    L15_2 = {}
    L16_2 = L3_2
    L15_2[1] = L16_2
    L13_2(L14_2, L15_2)
    L13_2 = MySQL
    L13_2 = L13_2.rawExecute
    L13_2 = L13_2.await
    L14_2 = "DELETE FROM lbtablet_police_reports_involved WHERE report_id = ? "
    L15_2 = {}
    L16_2 = L3_2
    L15_2[1] = L16_2
    L13_2(L14_2, L15_2)
    L13_2 = TriggerClientEvent
    L14_2 = "tablet:police:reportUpdated"
    L15_2 = -1
    L16_2 = A2_2
    L13_2(L14_2, L15_2, L16_2)
    L13_2 = L10_1
    L14_2 = A1_2
    L15_2 = L3_2
    L16_2 = "update"
    L17_2 = "report"
    L18_2 = L
    L19_2 = "APPS.POLICE.LOGS.UPDATE_REPORT_TITLE"
    L18_2 = L18_2(L19_2)
    L19_2 = L
    L20_2 = "APPS.POLICE.LOGS.UPDATE_REPORT_DESCRIPTION"
    L21_2 = {}
    L22_2 = L6_2 or L22_2
    if not L6_2 then
      L22_2 = ""
    end
    L21_2.type = L22_2
    L21_2.title = L4_2
    L19_2, L20_2, L21_2, L22_2 = L19_2(L20_2, L21_2)
    L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
  end
  if not L3_2 then
    L13_2 = false
    return L13_2
  end
  L13_2 = #L7_2
  if L13_2 > 0 then
    L13_2 = {}
    L14_2 = 1
    L15_2 = #L7_2
    L16_2 = 1
    for L17_2 = L14_2, L15_2, L16_2 do
      L18_2 = #L13_2
      L18_2 = L18_2 + 1
      L19_2 = {}
      L20_2 = L3_2
      L21_2 = L7_2[L17_2]
      L19_2[1] = L20_2
      L19_2[2] = L21_2
      L13_2[L18_2] = L19_2
    end
    L14_2 = MySQL
    L14_2 = L14_2.rawExecute
    L14_2 = L14_2.await
    L15_2 = "INSERT INTO lbtablet_police_reports_tags (report_id, tag_id) VALUES (?, ?) ON DUPLICATE KEY UPDATE tag_id = VALUES(tag_id)"
    L16_2 = L13_2
    L14_2(L15_2, L16_2)
  end
  L13_2 = #L8_2
  if L13_2 > 0 then
    L13_2 = {}
    L14_2 = 1
    L15_2 = #L8_2
    L16_2 = 1
    for L17_2 = L14_2, L15_2, L16_2 do
      L18_2 = #L13_2
      L18_2 = L18_2 + 1
      L19_2 = {}
      L20_2 = L3_2
      L21_2 = L8_2[L17_2]
      L19_2[1] = L20_2
      L19_2[2] = L21_2
      L13_2[L18_2] = L19_2
    end
    L14_2 = MySQL
    L14_2 = L14_2.rawExecute
    L14_2 = L14_2.await
    L15_2 = "INSERT INTO lbtablet_police_reports_attachments (report_id, attachment) VALUES (?, ?) ON DUPLICATE KEY UPDATE attachment = VALUES(attachment)"
    L16_2 = L13_2
    L14_2(L15_2, L16_2)
  end
  L13_2 = {}
  L14_2 = 1
  L15_2 = #L9_2
  L16_2 = 1
  for L17_2 = L14_2, L15_2, L16_2 do
    L18_2 = #L13_2
    L18_2 = L18_2 + 1
    L19_2 = {}
    L20_2 = L3_2
    L21_2 = L9_2[L17_2]
    L22_2 = "officer"
    L19_2[1] = L20_2
    L19_2[2] = L21_2
    L19_2[3] = L22_2
    L13_2[L18_2] = L19_2
  end
  L14_2 = 1
  L15_2 = #L10_2
  L16_2 = 1
  for L17_2 = L14_2, L15_2, L16_2 do
    L18_2 = #L13_2
    L18_2 = L18_2 + 1
    L19_2 = {}
    L20_2 = L3_2
    L21_2 = L10_2[L17_2]
    L22_2 = "civilian"
    L19_2[1] = L20_2
    L19_2[2] = L21_2
    L19_2[3] = L22_2
    L13_2[L18_2] = L19_2
  end
  L14_2 = 1
  L15_2 = #L11_2
  L16_2 = 1
  for L17_2 = L14_2, L15_2, L16_2 do
    L18_2 = #L13_2
    L18_2 = L18_2 + 1
    L19_2 = {}
    L20_2 = L3_2
    L21_2 = L11_2[L17_2]
    L22_2 = "suspect"
    L19_2[1] = L20_2
    L19_2[2] = L21_2
    L19_2[3] = L22_2
    L13_2[L18_2] = L19_2
  end
  L14_2 = 1
  L15_2 = #L12_2
  L16_2 = 1
  for L17_2 = L14_2, L15_2, L16_2 do
    L18_2 = #L13_2
    L18_2 = L18_2 + 1
    L19_2 = {}
    L20_2 = L3_2
    L21_2 = L12_2[L17_2]
    L22_2 = "weapon"
    L19_2[1] = L20_2
    L19_2[2] = L21_2
    L19_2[3] = L22_2
    L13_2[L18_2] = L19_2
  end
  L14_2 = #L13_2
  if L14_2 > 0 then
    L14_2 = MySQL
    L14_2 = L14_2.rawExecute
    L14_2 = L14_2.await
    L15_2 = "INSERT INTO lbtablet_police_reports_involved (report_id, involved, involvement) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE involvement = VALUES(involvement)"
    L16_2 = L13_2
    L14_2(L15_2, L16_2)
  end
  return L3_2
end
L23_1 = L11_1
L24_1 = "saveReport"
function L25_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = L22_1
  L4_2 = A0_2
  L5_2 = A1_2
  L6_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2)
end
L26_1 = {}
L26_1.antiSpam = true
L23_1(L24_1, L25_1, L26_1)
L23_1 = L11_1
L24_1 = "deleteReport"
function L25_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = "DELETE FROM lbtablet_police_reports WHERE id = ?"
  L5_2 = {}
  L6_2 = A2_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  L3_2 = L3_2 > 0
  if L3_2 then
    L4_2 = TriggerClientEvent
    L5_2 = "tablet:police:reportDeleted"
    L6_2 = -1
    L7_2 = A2_2
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = L10_1
    L5_2 = A1_2
    L6_2 = A2_2
    L7_2 = "delete"
    L8_2 = "report"
    L9_2 = L
    L10_2 = "APPS.POLICE.LOGS.DELETE_REPORT_TITLE"
    L9_2 = L9_2(L10_2)
    L10_2 = L
    L11_2 = "APPS.POLICE.LOGS.DELETE_REPORT_DESCRIPTION"
    L12_2 = {}
    L12_2.id = A2_2
    L10_2, L11_2, L12_2 = L10_2(L11_2, L12_2)
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  end
  return L3_2
end
L26_1 = {}
L27_1 = {}
L28_1 = {}
L29_1 = "report"
L30_1 = "delete"
L28_1[1] = L29_1
L28_1[2] = L30_1
L27_1[1] = L28_1
L26_1.permissions = L27_1
L23_1(L24_1, L25_1, L26_1)
L23_1 = exports
L24_1 = "CreatePoliceReport"
function L25_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = GetEquippedTablet
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = debugprint
    L4_2 = "CreateReport: No tablet found"
    L3_2(L4_2)
    L3_2 = false
    L4_2 = "no_tablet"
    return L3_2, L4_2
  end
  A1_2.id = nil
  L3_2 = L22_1
  L4_2 = A0_2
  L5_2 = L2_2
  L6_2 = A1_2
  return L3_2(L4_2, L5_2, L6_2)
end
L23_1(L24_1, L25_1)
L23_1 = exports
L24_1 = "GetPoliceReport"
L25_1 = L21_1
L23_1(L24_1, L25_1)
L23_1 = exports
L24_1 = "UpdatePoliceReport"
function L25_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = GetEquippedTablet
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = debugprint
    L4_2 = "UpdateReport: No tablet found"
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
    L4_2 = "UpdateReport: No ID provided"
    L3_2(L4_2)
    L3_2 = false
    L4_2 = "no_id"
    return L3_2, L4_2
  end
  L3_2 = L22_1
  L4_2 = A0_2
  L5_2 = L2_2
  L6_2 = A1_2
  return L3_2(L4_2, L5_2, L6_2)
end
L23_1(L24_1, L25_1)
L23_1 = exports
L24_1 = "DeletePoliceReport"
function L25_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = MySQL
  L1_2 = L1_2.update
  L1_2 = L1_2.await
  L2_2 = "DELETE FROM lbtablet_police_reports WHERE id = ?"
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  L1_2 = L1_2(L2_2, L3_2)
  L1_2 = L1_2 > 0
  if L1_2 then
    L2_2 = TriggerClientEvent
    L3_2 = "tablet:police:reportDeleted"
    L4_2 = -1
    L5_2 = A0_2
    L2_2(L3_2, L4_2, L5_2)
  end
  return L1_2
end
L23_1(L24_1, L25_1)
L23_1 = L11_1
L24_1 = "getWarrants"
function L25_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L5_2 = debugprint
  L6_2 = "getWarrants"
  L7_2 = A0_2
  L8_2 = A1_2
  L9_2 = A2_2
  L10_2 = A3_2
  L11_2 = A4_2
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  if not A2_2 then
    A2_2 = 0
  end
  if "" ~= A3_2 then
    L5_2 = type
    L6_2 = A3_2
    L5_2 = L5_2(L6_2)
    if "string" == L5_2 then
      goto lbl_20
    end
  end
  A3_2 = nil
  ::lbl_20::
  L5_2 = ""
  L6_2 = {}
  if A3_2 then
    L7_2 = L5_2
    L8_2 = " WHERE (w.title LIKE ?"
    L7_2 = L7_2 .. L8_2
    L5_2 = L7_2
    L7_2 = #L6_2
    L7_2 = L7_2 + 1
    L8_2 = "%"
    L9_2 = A3_2
    L10_2 = "%"
    L8_2 = L8_2 .. L9_2 .. L10_2
    L6_2[L7_2] = L8_2
    L7_2 = IsStringOnlyNumbers
    L8_2 = A3_2
    L7_2 = L7_2(L8_2)
    if L7_2 then
      L7_2 = L5_2
      L8_2 = " OR w.id = ?)"
      L7_2 = L7_2 .. L8_2
      L5_2 = L7_2
      L7_2 = #L6_2
      L7_2 = L7_2 + 1
      L8_2 = tonumber
      L9_2 = A3_2
      L8_2 = L8_2(L9_2)
      L6_2[L7_2] = L8_2
    else
      L7_2 = L5_2
      L8_2 = ")"
      L7_2 = L7_2 .. L8_2
      L5_2 = L7_2
    end
  end
  if A4_2 then
    L7_2 = A4_2.tags
    if L7_2 then
      L7_2 = 1
      L8_2 = A4_2.tags
      L8_2 = #L8_2
      L9_2 = 1
      for L10_2 = L7_2, L8_2, L9_2 do
        L11_2 = L5_2
        L12_2 = " AND EXISTS (SELECT 1 FROM lbtablet_police_warrants_tags ppt WHERE ppt.warrant_id = w.id AND ppt.tag_id = ?)"
        L11_2 = L11_2 .. L12_2
        L5_2 = L11_2
        L11_2 = #L6_2
        L11_2 = L11_2 + 1
        L12_2 = A4_2.tags
        L12_2 = L12_2[L10_2]
        L6_2[L11_2] = L12_2
      end
    end
  end
  if A4_2 then
    L7_2 = A4_2.type
    if L7_2 then
      L7_2 = L5_2
      L8_2 = " AND w.warrant_type = ?"
      L7_2 = L7_2 .. L8_2
      L5_2 = L7_2
      L7_2 = #L6_2
      L7_2 = L7_2 + 1
      L8_2 = A4_2.type
      L6_2[L7_2] = L8_2
    end
  end
  if A4_2 then
    L7_2 = A4_2.status
    if L7_2 then
      L7_2 = L5_2
      L8_2 = " AND w.warrant_status = ?"
      L7_2 = L7_2 .. L8_2
      L5_2 = L7_2
      L7_2 = #L6_2
      L7_2 = L7_2 + 1
      L8_2 = A4_2.status
      L6_2[L7_2] = L8_2
    end
  end
  if A4_2 then
    L7_2 = A4_2.priority
    if L7_2 then
      L7_2 = L5_2
      L8_2 = " AND w.priority = ?"
      L7_2 = L7_2 .. L8_2
      L5_2 = L7_2
      L7_2 = #L6_2
      L7_2 = L7_2 + 1
      L8_2 = A4_2.priority
      L6_2[L7_2] = L8_2
    end
  end
  L7_2 = #L5_2
  if L7_2 > 0 then
    L8_2 = L5_2
    L7_2 = L5_2.sub
    L9_2 = 1
    L10_2 = 4
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    if " AND" == L7_2 then
      L8_2 = L5_2
      L7_2 = L5_2.sub
      L9_2 = 5
      L7_2 = L7_2(L8_2, L9_2)
      L5_2 = L7_2
      L7_2 = " WHERE "
      L8_2 = L5_2
      L7_2 = L7_2 .. L8_2
      L5_2 = L7_2
    end
  end
  L7_2 = #L6_2
  L7_2 = L7_2 + 1
  L8_2 = A2_2 * 10
  L6_2[L7_2] = L8_2
  L7_2 = #L6_2
  L7_2 = L7_2 + 1
  L6_2[L7_2] = 10
  L7_2 = [[
        SELECT
            w.id,
            w.title,
            w.`description`,
            w.warrant_status AS `status`,
            w.warrant_type AS `type`,
            w.priority,
            w.created_by AS createdBy,
            w.created_at AS `timestamp`,
            w.updated_at AS lastUpdated,
            a.display_name AS author

        FROM
            lbtablet_police_warrants w

        LEFT JOIN
            lbtablet_police_accounts a
            ON a.id = w.created_by
    ]]
  L8_2 = L5_2
  L9_2 = [[
        ORDER BY w.updated_at DESC
        LIMIT ?, ?
    ]]
  L7_2 = L7_2 .. L8_2 .. L9_2
  L8_2 = MySQL
  L8_2 = L8_2.query
  L8_2 = L8_2.await
  L9_2 = L7_2
  L10_2 = L6_2
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = 1
  L10_2 = #L8_2
  L11_2 = 1
  for L12_2 = L9_2, L10_2, L11_2 do
    L13_2 = L8_2[L12_2]
    L14_2 = L12_1
    L15_2 = "lbtablet_police_warrants_tags"
    L16_2 = "warrant_id"
    L17_2 = L13_2.id
    L14_2 = L14_2(L15_2, L16_2, L17_2)
    L13_2.tags = L14_2
  end
  return L8_2
end
L26_1 = {}
L27_1 = {}
L28_1 = {}
L29_1 = "warrant"
L30_1 = "view"
L28_1[1] = L29_1
L28_1[2] = L30_1
L27_1[1] = L28_1
L26_1.permissions = L27_1
L23_1(L24_1, L25_1, L26_1)
function L23_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = MySQL
  L1_2 = L1_2.single
  L1_2 = L1_2.await
  L2_2 = [[
        SELECT
            w.id,
            w.title,
            w.`description`,
            w.warrant_type AS `type`,
            w.warrant_status AS `status`,
            w.priority,
            w.created_by AS createdBy,
            w.created_at AS `timestamp`,
            w.updated_at AS lastUpdated,
            a.display_name AS author,

            w.linked_profile_id,
            w.linked_profile_type,
            p.avatar AS linked_profile_avatar

        FROM
            lbtablet_police_warrants w

        LEFT JOIN
            lbtablet_police_accounts a
            ON a.id = w.created_by

        LEFT JOIN
            lbtablet_police_profiles p
            ON p.id = w.linked_profile_id

        WHERE
            w.id = ?
    ]]
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = L1_2.linked_profile_id
  if L2_2 then
    L2_2 = {}
    L3_2 = L1_2.linked_profile_id
    L2_2.id = L3_2
    L3_2 = L1_2.linked_profile_type
    if "player" == L3_2 then
      L3_2 = "profile"
      if L3_2 then
        goto lbl_28
      end
    end
    L3_2 = "vehicle"
    ::lbl_28::
    L2_2.type = L3_2
    L3_2 = L1_2.linked_profile_avatar
    L2_2.avatar = L3_2
    L3_2 = L1_2.linked_profile_type
    if "player" == L3_2 then
      L3_2 = MySQL
      L3_2 = L3_2.single
      L3_2 = L3_2.await
      L4_2 = FormatString
      L5_2 = "SELECT {NAME} AS `name`, {DOB} AS dob, {IS_MALE} AS isMale FROM {TABLE} user WHERE {IDENTIFIER} = ?"
      L6_2 = {}
      L7_2 = Queries
      L7_2 = L7_2.Users
      L7_2 = L7_2.Select
      L7_2 = L7_2.name
      L6_2.NAME = L7_2
      L7_2 = Queries
      L7_2 = L7_2.Users
      L7_2 = L7_2.Select
      L7_2 = L7_2.dob
      L6_2.DOB = L7_2
      L7_2 = Queries
      L7_2 = L7_2.Users
      L7_2 = L7_2.Select
      L7_2 = L7_2.isMale
      L6_2.IS_MALE = L7_2
      L7_2 = Queries
      L7_2 = L7_2.Users
      L7_2 = L7_2.Table
      L6_2.TABLE = L7_2
      L7_2 = Queries
      L7_2 = L7_2.Users
      L7_2 = L7_2.Select
      L7_2 = L7_2.identifier
      L6_2.IDENTIFIER = L7_2
      L4_2 = L4_2(L5_2, L6_2)
      L5_2 = {}
      L6_2 = L1_2.linked_profile_id
      L5_2[1] = L6_2
      L3_2 = L3_2(L4_2, L5_2)
      if L3_2 then
        L4_2 = L3_2.name
        L2_2.name = L4_2
        L4_2 = L3_2.dob
        L2_2.dob = L4_2
        L1_2.target = L2_2
      end
    else
      L3_2 = MySQL
      L3_2 = L3_2.single
      L3_2 = L3_2.await
      L4_2 = Queries
      L4_2 = L4_2.Vehicles
      L4_2 = L4_2.BasicFetch
      L5_2 = {}
      L6_2 = L1_2.linked_profile_id
      L5_2[1] = L6_2
      L3_2 = L3_2(L4_2, L5_2)
      if L3_2 then
        L2_2.vehicle = L3_2
        L1_2.target = L2_2
      end
    end
  end
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "SELECT attachment FROM lbtablet_police_warrants_attachments WHERE warrant_id = ?"
  L4_2 = {}
  L5_2 = A0_2
  L4_2[1] = L5_2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = {}
  L1_2.gallery = L3_2
  L3_2 = L12_1
  L4_2 = "lbtablet_police_warrants_tags"
  L5_2 = "warrant_id"
  L6_2 = A0_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L1_2.tags = L3_2
  L3_2 = MySQL
  L3_2 = L3_2.query
  L3_2 = L3_2.await
  L4_2 = [[
        SELECT r.id, r.title AS label
        FROM lbtablet_police_warrants_linked_reports w
        LEFT JOIN lbtablet_police_reports r ON r.id = w.report_id
        WHERE w.warrant_id = ?
    ]]
  L5_2 = {}
  L6_2 = A0_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  L1_2.reports = L3_2
  L3_2 = 1
  L4_2 = #L2_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = L1_2.gallery
    L8_2 = L2_2[L6_2]
    L8_2 = L8_2.attachment
    L7_2[L6_2] = L8_2
  end
  return L1_2
end
L24_1 = L11_1
L25_1 = "getWarrant"
function L26_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  L3_2 = L23_1
  L4_2 = A2_2
  return L3_2(L4_2)
end
L24_1(L25_1, L26_1)
function L24_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
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
            L4_2 = L4_2.status
          end
          L3_2 = L3_2(L4_2)
          if "string" == L3_2 then
            L3_2 = type
            L4_2 = A2_2
            if L4_2 then
              L4_2 = L4_2.priority
            end
            L3_2 = L3_2(L4_2)
            if "string" == L3_2 then
              goto lbl_51
            end
          end
        end
      end
    end
  end
  L3_2 = debugprint
  L4_2 = "saveWarrant: Invalid data"
  L5_2 = A2_2
  L3_2(L4_2, L5_2)
  L3_2 = false
  do return L3_2 end
  ::lbl_51::
  L3_2 = A2_2.id
  L4_2 = A2_2.title
  L5_2 = A2_2.description
  L6_2 = A2_2.type
  L7_2 = A2_2.status
  L8_2 = A2_2.priority
  L9_2 = A2_2.tags
  if not L9_2 then
    L9_2 = {}
  end
  L10_2 = A2_2.gallery
  if not L10_2 then
    L10_2 = {}
  end
  L11_2 = A2_2.reports
  if not L11_2 then
    L11_2 = {}
  end
  L12_2 = nil
  L13_2 = nil
  L14_2 = A2_2.target
  if L14_2 then
    L14_2 = A2_2.target
    L14_2 = L14_2.id
    if L14_2 then
      L14_2 = A2_2.target
      L14_2 = L14_2.type
      if L14_2 then
        L14_2 = A2_2.target
        L14_2 = L14_2.type
        if "profile" == L14_2 then
          L14_2 = A2_2.target
          L12_2 = L14_2.id
          L13_2 = "player"
        else
          L14_2 = A2_2.target
          L14_2 = L14_2.type
          if "vehicle" == L14_2 then
            L14_2 = A2_2.target
            L12_2 = L14_2.id
            L13_2 = "vehicle"
          end
        end
      end
    end
  end
  if not L3_2 then
    L14_2 = HasPermission
    L15_2 = A0_2
    L16_2 = "Police"
    L17_2 = "warrant"
    L18_2 = "create"
    L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
    if not L14_2 then
      L14_2 = false
      return L14_2
    end
    L14_2 = MySQL
    L14_2 = L14_2.insert
    L14_2 = L14_2.await
    L15_2 = "INSERT INTO lbtablet_police_warrants (title, `description`, `warrant_type`, `warrant_status`, priority, created_by, linked_profile_id, linked_profile_type) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
    L16_2 = {}
    L17_2 = L4_2
    L18_2 = L5_2
    L19_2 = L6_2
    L20_2 = L7_2
    L21_2 = L8_2
    L22_2 = A1_2
    L23_2 = L12_2
    L24_2 = L13_2
    L16_2[1] = L17_2
    L16_2[2] = L18_2
    L16_2[3] = L19_2
    L16_2[4] = L20_2
    L16_2[5] = L21_2
    L16_2[6] = L22_2
    L16_2[7] = L23_2
    L16_2[8] = L24_2
    L14_2 = L14_2(L15_2, L16_2)
    L3_2 = L14_2
    L14_2 = L10_1
    L15_2 = A1_2
    L16_2 = L3_2
    L17_2 = "create"
    L18_2 = "warrant"
    L19_2 = L
    L20_2 = "APPS.POLICE.LOGS.CREATE_WARRANT_TITLE"
    L19_2 = L19_2(L20_2)
    L20_2 = L
    L21_2 = "APPS.POLICE.LOGS.CREATE_WARRANT_DESCRIPTION"
    L22_2 = {}
    if L6_2 then
      L23_2 = L6_2
      L24_2 = " "
      L23_2 = L23_2 .. L24_2
      if L23_2 then
        goto lbl_148
      end
    end
    L23_2 = ""
    ::lbl_148::
    L22_2.type = L23_2
    L22_2.title = L4_2
    L20_2, L21_2, L22_2, L23_2, L24_2 = L20_2(L21_2, L22_2)
    L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
    L14_2 = Config
    L14_2 = L14_2.Police
    L14_2 = L14_2.Notifications
    L14_2 = L14_2.NewReport
    if L14_2 then
      L14_2 = L9_1
      L15_2 = {}
      L16_2 = L
      L17_2 = "BACKEND.POLICE.NEW_WARRANT_NOTIFICATION.TITLE"
      L16_2 = L16_2(L17_2)
      L15_2.title = L16_2
      L16_2 = L
      L17_2 = "BACKEND.POLICE.NEW_WARRANT_NOTIFICATION.CONTENT"
      L18_2 = {}
      L18_2.title = L4_2
      L18_2.description = L5_2
      L16_2 = L16_2(L17_2, L18_2)
      L15_2.content = L16_2
      L16_2 = {}
      L17_2 = A1_2
      L16_2[1] = L17_2
      L14_2(L15_2, L16_2)
    end
  else
    L14_2 = HasPermission
    L15_2 = A0_2
    L16_2 = "Police"
    L17_2 = "warrant"
    L18_2 = "edit"
    L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
    if not L14_2 then
      L14_2 = false
      return L14_2
    end
    L14_2 = MySQL
    L14_2 = L14_2.rawExecute
    L14_2 = L14_2.await
    L15_2 = "UPDATE lbtablet_police_warrants SET title = ?, `description` = ?, `warrant_type` = ?, `warrant_status` = ?, priority = ?, linked_profile_id = ?, linked_profile_type = ? WHERE id = ?"
    L16_2 = {}
    L17_2 = L4_2
    L18_2 = L5_2
    L19_2 = L6_2
    L20_2 = L7_2
    L21_2 = L8_2
    L22_2 = L12_2
    L23_2 = L13_2
    L24_2 = L3_2
    L16_2[1] = L17_2
    L16_2[2] = L18_2
    L16_2[3] = L19_2
    L16_2[4] = L20_2
    L16_2[5] = L21_2
    L16_2[6] = L22_2
    L16_2[7] = L23_2
    L16_2[8] = L24_2
    L14_2(L15_2, L16_2)
    L14_2 = MySQL
    L14_2 = L14_2.rawExecute
    L14_2 = L14_2.await
    L15_2 = "DELETE FROM lbtablet_police_warrants_tags WHERE warrant_id = ?"
    L16_2 = {}
    L17_2 = L3_2
    L16_2[1] = L17_2
    L14_2(L15_2, L16_2)
    L14_2 = MySQL
    L14_2 = L14_2.rawExecute
    L14_2 = L14_2.await
    L15_2 = "DELETE FROM lbtablet_police_warrants_attachments WHERE warrant_id = ?"
    L16_2 = {}
    L17_2 = L3_2
    L16_2[1] = L17_2
    L14_2(L15_2, L16_2)
    L14_2 = MySQL
    L14_2 = L14_2.rawExecute
    L14_2 = L14_2.await
    L15_2 = "DELETE FROM lbtablet_police_warrants_linked_reports WHERE warrant_id = ?"
    L16_2 = {}
    L17_2 = L3_2
    L16_2[1] = L17_2
    L14_2(L15_2, L16_2)
    L14_2 = TriggerClientEvent
    L15_2 = "tablet:police:warrantUpdated"
    L16_2 = -1
    L17_2 = A2_2
    L14_2(L15_2, L16_2, L17_2)
    L14_2 = L10_1
    L15_2 = A1_2
    L16_2 = L3_2
    L17_2 = "update"
    L18_2 = "warrant"
    L19_2 = L
    L20_2 = "APPS.POLICE.LOGS.UPDATE_WARRANT_TITLE"
    L19_2 = L19_2(L20_2)
    L20_2 = L
    L21_2 = "APPS.POLICE.LOGS.UPDATE_WARRANT_DESCRIPTION"
    L22_2 = {}
    L22_2.title = L4_2
    L20_2, L21_2, L22_2, L23_2, L24_2 = L20_2(L21_2, L22_2)
    L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
  end
  if not L3_2 then
    L14_2 = false
    return L14_2
  end
  L14_2 = #L9_2
  if L14_2 > 0 then
    L14_2 = {}
    L15_2 = 1
    L16_2 = #L9_2
    L17_2 = 1
    for L18_2 = L15_2, L16_2, L17_2 do
      L19_2 = #L14_2
      L19_2 = L19_2 + 1
      L20_2 = {}
      L21_2 = L3_2
      L22_2 = L9_2[L18_2]
      L20_2[1] = L21_2
      L20_2[2] = L22_2
      L14_2[L19_2] = L20_2
    end
    L15_2 = MySQL
    L15_2 = L15_2.rawExecute
    L15_2 = L15_2.await
    L16_2 = "INSERT INTO lbtablet_police_warrants_tags (warrant_id, tag_id) VALUES (?, ?) ON DUPLICATE KEY UPDATE tag_id = VALUES(tag_id)"
    L17_2 = L14_2
    L15_2(L16_2, L17_2)
  end
  L14_2 = #L10_2
  if L14_2 > 0 then
    L14_2 = {}
    L15_2 = 1
    L16_2 = #L10_2
    L17_2 = 1
    for L18_2 = L15_2, L16_2, L17_2 do
      L19_2 = #L14_2
      L19_2 = L19_2 + 1
      L20_2 = {}
      L21_2 = L3_2
      L22_2 = L10_2[L18_2]
      L20_2[1] = L21_2
      L20_2[2] = L22_2
      L14_2[L19_2] = L20_2
    end
    L15_2 = MySQL
    L15_2 = L15_2.rawExecute
    L15_2 = L15_2.await
    L16_2 = "INSERT INTO lbtablet_police_warrants_attachments (warrant_id, attachment) VALUES (?, ?) ON DUPLICATE KEY UPDATE attachment = VALUES(attachment)"
    L17_2 = L14_2
    L15_2(L16_2, L17_2)
  end
  L14_2 = #L11_2
  if L14_2 > 0 then
    L14_2 = {}
    L15_2 = 1
    L16_2 = #L11_2
    L17_2 = 1
    for L18_2 = L15_2, L16_2, L17_2 do
      L19_2 = #L14_2
      L19_2 = L19_2 + 1
      L20_2 = {}
      L21_2 = L3_2
      L22_2 = L11_2[L18_2]
      L20_2[1] = L21_2
      L20_2[2] = L22_2
      L14_2[L19_2] = L20_2
    end
    L15_2 = MySQL
    L15_2 = L15_2.rawExecute
    L15_2 = L15_2.await
    L16_2 = "INSERT INTO lbtablet_police_warrants_linked_reports (warrant_id, report_id) VALUES (?, ?) ON DUPLICATE KEY UPDATE report_id = VALUES(report_id)"
    L17_2 = L14_2
    L15_2(L16_2, L17_2)
  end
  return L3_2
end
L25_1 = L11_1
L26_1 = "saveWarrant"
function L27_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = L24_1
  L4_2 = A0_2
  L5_2 = A1_2
  L6_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2)
end
L28_1 = {}
L28_1.antiSpam = true
L25_1(L26_1, L27_1, L28_1)
L25_1 = L11_1
L26_1 = "deleteWarrant"
function L27_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = "DELETE FROM lbtablet_police_warrants WHERE id = ?"
  L5_2 = {}
  L6_2 = A2_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  L3_2 = L3_2 > 0
  if L3_2 then
    L4_2 = TriggerClientEvent
    L5_2 = "tablet:police:warrantDeleted"
    L6_2 = -1
    L7_2 = A2_2
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = L10_1
    L5_2 = A1_2
    L6_2 = A2_2
    L7_2 = "delete"
    L8_2 = "warrant"
    L9_2 = L
    L10_2 = "APPS.POLICE.LOGS.DELETE_WARRANT_TITLE"
    L9_2 = L9_2(L10_2)
    L10_2 = L
    L11_2 = "APPS.POLICE.LOGS.DELETE_WARRANT_DESCRIPTION"
    L12_2 = {}
    L12_2.id = A2_2
    L10_2, L11_2, L12_2 = L10_2(L11_2, L12_2)
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  end
  return L3_2
end
L28_1 = {}
L29_1 = {}
L30_1 = {}
L31_1 = "warrant"
L32_1 = "delete"
L30_1[1] = L31_1
L30_1[2] = L32_1
L29_1[1] = L30_1
L28_1.permissions = L29_1
L25_1(L26_1, L27_1, L28_1)
L25_1 = exports
L26_1 = "CreatePoliceWarrant"
function L27_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = GetEquippedTablet
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = debugprint
    L4_2 = "CreateWarrant: No tablet found"
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
L26_1 = "GetPoliceWarrant"
L27_1 = L23_1
L25_1(L26_1, L27_1)
L25_1 = exports
L26_1 = "UpdatePoliceWarrant"
function L27_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = GetEquippedTablet
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = debugprint
    L4_2 = "UpdateWarrant: No tablet found"
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
    L4_2 = "UpdateWarrant: No ID provided"
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
L26_1 = "DeletePoliceWarrant"
function L27_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = MySQL
  L1_2 = L1_2.update
  L1_2 = L1_2.await
  L2_2 = "DELETE FROM lbtablet_police_warrants WHERE id = ?"
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  L1_2 = L1_2(L2_2, L3_2)
  L1_2 = L1_2 > 0
  if L1_2 then
    L2_2 = TriggerClientEvent
    L3_2 = "tablet:police:warrantDeleted"
    L4_2 = -1
    L5_2 = A0_2
    L2_2(L3_2, L4_2, L5_2)
  end
  return L1_2
end
L25_1(L26_1, L27_1)
L25_1 = L11_1
L26_1 = "getCases"
function L27_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  if not A2_2 then
    A2_2 = 0
  end
  if "" ~= A3_2 then
    L5_2 = type
    L6_2 = A3_2
    L5_2 = L5_2(L6_2)
    if "string" == L5_2 then
      goto lbl_12
    end
  end
  A3_2 = nil
  ::lbl_12::
  L5_2 = ""
  L6_2 = {}
  if A3_2 then
    L7_2 = L5_2
    L8_2 = " WHERE (c.title LIKE ?"
    L7_2 = L7_2 .. L8_2
    L5_2 = L7_2
    L7_2 = #L6_2
    L7_2 = L7_2 + 1
    L8_2 = "%"
    L9_2 = A3_2
    L10_2 = "%"
    L8_2 = L8_2 .. L9_2 .. L10_2
    L6_2[L7_2] = L8_2
    L7_2 = IsStringOnlyNumbers
    L8_2 = A3_2
    L7_2 = L7_2(L8_2)
    if L7_2 then
      L7_2 = L5_2
      L8_2 = " OR c.id = ?)"
      L7_2 = L7_2 .. L8_2
      L5_2 = L7_2
      L7_2 = #L6_2
      L7_2 = L7_2 + 1
      L8_2 = tonumber
      L9_2 = A3_2
      L8_2 = L8_2(L9_2)
      L6_2[L7_2] = L8_2
    else
      L7_2 = L5_2
      L8_2 = ")"
      L7_2 = L7_2 .. L8_2
      L5_2 = L7_2
    end
  end
  if A4_2 then
    L7_2 = A4_2.tags
    if L7_2 then
      L7_2 = 1
      L8_2 = A4_2.tags
      L8_2 = #L8_2
      L9_2 = 1
      for L10_2 = L7_2, L8_2, L9_2 do
        L11_2 = L5_2
        L12_2 = " AND EXISTS (SELECT 1 FROM lbtablet_police_cases_tags ppt WHERE ppt.case_id = c.id AND ppt.tag_id = ?)"
        L11_2 = L11_2 .. L12_2
        L5_2 = L11_2
        L11_2 = #L6_2
        L11_2 = L11_2 + 1
        L12_2 = A4_2.tags
        L12_2 = L12_2[L10_2]
        L6_2[L11_2] = L12_2
      end
    end
  end
  if A4_2 then
    L7_2 = A4_2.type
    if L7_2 then
      L7_2 = L5_2
      L8_2 = " AND c.case_type = ?"
      L7_2 = L7_2 .. L8_2
      L5_2 = L7_2
      L7_2 = #L6_2
      L7_2 = L7_2 + 1
      L8_2 = A4_2.type
      L6_2[L7_2] = L8_2
    end
  end
  if A4_2 then
    L7_2 = A4_2.involved
    if L7_2 then
      L7_2 = 1
      L8_2 = A4_2.involved
      L8_2 = #L8_2
      L9_2 = 1
      for L10_2 = L7_2, L8_2, L9_2 do
        L11_2 = A4_2.involved
        L11_2 = L11_2[L10_2]
        L12_2 = L11_2.involvement
        if "criminal" == L12_2 then
          L12_2 = L5_2
          L13_2 = " AND EXISTS (SELECT 1 FROM lbtablet_police_cases_criminals pcc WHERE pcc.case_id = c.id AND pcc.id = ?)"
          L12_2 = L12_2 .. L13_2
          L5_2 = L12_2
          L12_2 = #L6_2
          L12_2 = L12_2 + 1
          L13_2 = L11_2.id
          L6_2[L12_2] = L13_2
        else
          L12_2 = L5_2
          L13_2 = " AND EXISTS (SELECT 1 FROM lbtablet_police_cases_involved i WHERE i.case_id = c.id AND i.involved = ? AND i.involvement = ?)"
          L12_2 = L12_2 .. L13_2
          L5_2 = L12_2
          L12_2 = #L6_2
          L12_2 = L12_2 + 1
          L13_2 = L11_2.id
          L6_2[L12_2] = L13_2
          L12_2 = #L6_2
          L12_2 = L12_2 + 1
          L13_2 = L11_2.involvement
          L6_2[L12_2] = L13_2
        end
      end
    end
  end
  L7_2 = #L5_2
  if L7_2 > 0 then
    L8_2 = L5_2
    L7_2 = L5_2.sub
    L9_2 = 1
    L10_2 = 4
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    if " AND" == L7_2 then
      L8_2 = L5_2
      L7_2 = L5_2.sub
      L9_2 = 5
      L7_2 = L7_2(L8_2, L9_2)
      L5_2 = L7_2
      L7_2 = " WHERE "
      L8_2 = L5_2
      L7_2 = L7_2 .. L8_2
      L5_2 = L7_2
    end
  end
  L7_2 = #L6_2
  L7_2 = L7_2 + 1
  L8_2 = A2_2 * 10
  L6_2[L7_2] = L8_2
  L7_2 = #L6_2
  L7_2 = L7_2 + 1
  L6_2[L7_2] = 10
  L7_2 = [[
        SELECT
            c.id,
            c.title,
            c.description,
            c.created_by AS createdBy,
            c.created_at AS created,
            c.updated_at AS lastUpdated,
            a.display_name as author

        FROM lbtablet_police_cases c

        LEFT JOIN lbtablet_police_accounts a ON a.id = c.created_by

        {WHERE_FILTER}

        ORDER BY c.updated_at DESC
        LIMIT ?, ?
    ]]
  L9_2 = L7_2
  L8_2 = L7_2.gsub
  L10_2 = "{WHERE_FILTER}"
  L11_2 = L5_2
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  L7_2 = L8_2
  L8_2 = MySQL
  L8_2 = L8_2.query
  L8_2 = L8_2.await
  L9_2 = L7_2
  L10_2 = L6_2
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = 1
  L10_2 = #L8_2
  L11_2 = 1
  for L12_2 = L9_2, L10_2, L11_2 do
    L13_2 = L8_2[L12_2]
    L14_2 = L12_1
    L15_2 = "lbtablet_police_cases_tags"
    L16_2 = "case_id"
    L17_2 = L13_2.id
    L14_2 = L14_2(L15_2, L16_2, L17_2)
    L13_2.tags = L14_2
  end
  return L8_2
end
L28_1 = {}
L29_1 = {}
L28_1.defaultReturn = L29_1
L25_1(L26_1, L27_1, L28_1)
function L25_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L1_2 = MySQL
  L1_2 = L1_2.single
  L1_2 = L1_2.await
  L2_2 = [[
        SELECT
            c.id,
            c.title,
            c.description,
            c.created_by AS createdBy,
            c.created_at AS created,
            c.updated_at AS lastUpdated,
            a.display_name AS author

        FROM lbtablet_police_cases c
        LEFT JOIN lbtablet_police_accounts a ON a.id = c.created_by
        WHERE c.id = ?
    ]]
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = [[
        SELECT
            i.involved,
            i.involvement,
            {SELECT_NAME} as `name`

        FROM lbtablet_police_cases_involved i

        {JOIN_NAME}

        WHERE
            i.case_id = ?
            AND (i.involvement = "officer" OR i.involvement = "civilian" OR i.involvement = "vehicle")
    ]]
  L4_2 = L2_2
  L3_2 = L2_2.gsub
  L5_2 = "{SELECT_NAME}"
  L6_2 = Queries
  L6_2 = L6_2.Users
  L6_2 = L6_2.Select
  L6_2 = L6_2.name
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L4_2 = L3_2
  L3_2 = L3_2.gsub
  L5_2 = "{JOIN_NAME}"
  L6_2 = FormatString
  L7_2 = "LEFT JOIN {USERS_TABLE} user ON {IDENTIFIER} {USERS_COLLATE} = i.involved"
  L8_2 = {}
  L9_2 = Queries
  L9_2 = L9_2.Users
  L9_2 = L9_2.Table
  L8_2.USERS_TABLE = L9_2
  L9_2 = Queries
  L9_2 = L9_2.Users
  L9_2 = L9_2.Select
  L9_2 = L9_2.identifier
  L8_2.IDENTIFIER = L9_2
  L9_2 = UsersCollate
  L8_2.USERS_COLLATE = L9_2
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L6_2(L7_2, L8_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  L2_2 = L3_2
  L3_2 = MySQL
  L3_2 = L3_2.query
  L3_2 = L3_2.await
  L4_2 = L2_2
  L5_2 = {}
  L6_2 = A0_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  L1_2.involved = L3_2
  L3_2 = MySQL
  L3_2 = L3_2.query
  L3_2 = L3_2.await
  L4_2 = "SELECT attachment FROM lbtablet_police_cases_evidence WHERE case_id = ?"
  L5_2 = {}
  L6_2 = A0_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  L1_2.evidence = L3_2
  L3_2 = L12_1
  L4_2 = "lbtablet_police_cases_tags"
  L5_2 = "case_id"
  L6_2 = A0_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L1_2.tags = L3_2
  L3_2 = {}
  L4_2 = 1
  L5_2 = L1_2.involved
  L5_2 = #L5_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = L1_2.involved
    L8_2 = L8_2[L7_2]
    L9_2 = L8_2.involvement
    if "vehicle" == L9_2 then
      L9_2 = #L3_2
      L9_2 = L9_2 + 1
      L10_2 = L8_2.involved
      L3_2[L9_2] = L10_2
    end
  end
  L4_2 = #L3_2
  if L4_2 > 0 then
    L4_2 = MySQL
    L4_2 = L4_2.query
    L4_2 = L4_2.await
    L5_2 = FormatString
    L6_2 = "SELECT {PLATE} AS plate, {MODEL} AS model FROM {TABLE} vehicle WHERE {PLATE} IN (?)"
    L7_2 = {}
    L8_2 = Queries
    L8_2 = L8_2.Vehicles
    L8_2 = L8_2.Table
    L7_2.TABLE = L8_2
    L8_2 = Queries
    L8_2 = L8_2.Vehicles
    L8_2 = L8_2.Select
    L8_2 = L8_2.plate
    L7_2.PLATE = L8_2
    L8_2 = Queries
    L8_2 = L8_2.Vehicles
    L8_2 = L8_2.Select
    L8_2 = L8_2.model
    L7_2.MODEL = L8_2
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = {}
    L7_2 = L3_2
    L6_2[1] = L7_2
    L4_2 = L4_2(L5_2, L6_2)
    L1_2.vehicleModels = L4_2
  else
    L4_2 = {}
    L1_2.vehicleModels = L4_2
  end
  L4_2 = MySQL
  L4_2 = L4_2.query
  L4_2 = L4_2.await
  L5_2 = [[
        SELECT
            i.involved,
            w.weapon_name

        FROM lbtablet_police_cases_involved i

        LEFT JOIN lbtablet_police_weapons w
            ON w.serial_number = i.involved

        WHERE i.case_id = ? AND i.involvement = "weapon"
    ]]
  L6_2 = {}
  L7_2 = A0_2
  L6_2[1] = L7_2
  L4_2 = L4_2(L5_2, L6_2)
  L1_2.weaponsInvolved = L4_2
  L4_2 = 1
  L5_2 = L1_2.weaponsInvolved
  L5_2 = #L5_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = L1_2.weaponsInvolved
    L8_2 = L8_2[L7_2]
    L9_2 = L1_2.weaponsInvolved
    L10_2 = {}
    L11_2 = "weapon:"
    L12_2 = L8_2.involved
    L11_2 = L11_2 .. L12_2
    L10_2.id = L11_2
    L11_2 = L8_2.involved
    L10_2.serialNumber = L11_2
    L11_2 = L8_2.weapon_name
    if L11_2 then
      L11_2 = GetWeaponName
      if L11_2 then
        L11_2 = GetWeaponName
        L12_2 = L8_2.weapon_name
        L11_2 = L11_2(L12_2)
      end
    end
    L10_2.model = L11_2
    L9_2[L7_2] = L10_2
  end
  L4_2 = [[
        SELECT
            c.id,
            c.fine,
            c.jail_time,
            c.fined AS hasFined,
            c.jailed as hasJailed,
            {SELECT_NAME} as `name`

        FROM lbtablet_police_cases_criminals c

        {JOIN_NAME}

        WHERE c.case_id = ?
    ]]
  L6_2 = L4_2
  L5_2 = L4_2.gsub
  L7_2 = "{SELECT_NAME}"
  L8_2 = Queries
  L8_2 = L8_2.Users
  L8_2 = L8_2.Select
  L8_2 = L8_2.name
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = L5_2
  L5_2 = L5_2.gsub
  L7_2 = "{JOIN_NAME}"
  L8_2 = FormatString
  L9_2 = "LEFT JOIN {USERS_TABLE} user ON {IDENTIFIER} {USERS_COLLATE} = c.id"
  L10_2 = {}
  L11_2 = Queries
  L11_2 = L11_2.Users
  L11_2 = L11_2.Table
  L10_2.USERS_TABLE = L11_2
  L11_2 = Queries
  L11_2 = L11_2.Users
  L11_2 = L11_2.Select
  L11_2 = L11_2.identifier
  L10_2.IDENTIFIER = L11_2
  L11_2 = UsersCollate
  L10_2.USERS_COLLATE = L11_2
  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L8_2(L9_2, L10_2)
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  L4_2 = L5_2
  L5_2 = MySQL
  L5_2 = L5_2.query
  L5_2 = L5_2.await
  L6_2 = L4_2
  L7_2 = {}
  L8_2 = A0_2
  L7_2[1] = L8_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = 1
  L7_2 = #L5_2
  L8_2 = 1
  for L9_2 = L6_2, L7_2, L8_2 do
    L10_2 = L5_2[L9_2]
    L11_2 = MySQL
    L11_2 = L11_2.query
    L11_2 = L11_2.await
    L12_2 = "SELECT offence_id, charges FROM lbtablet_police_cases_charges WHERE case_id = ? AND criminal = ?"
    L13_2 = {}
    L14_2 = A0_2
    L15_2 = L10_2.id
    L13_2[1] = L14_2
    L13_2[2] = L15_2
    L11_2 = L11_2(L12_2, L13_2)
    L12_2 = {}
    L10_2.charges = L12_2
    L12_2 = 1
    L13_2 = #L11_2
    L14_2 = 1
    for L15_2 = L12_2, L13_2, L14_2 do
      L16_2 = L11_2[L15_2]
      L17_2 = L10_2.charges
      L18_2 = L10_2.charges
      L18_2 = #L18_2
      L18_2 = L18_2 + 1
      L19_2 = {}
      L20_2 = L16_2.offence_id
      L19_2.id = L20_2
      L20_2 = L16_2.charges
      L19_2.charges = L20_2
      L17_2[L18_2] = L19_2
    end
  end
  L1_2.criminalsInvolved = L5_2
  L6_2 = MySQL
  L6_2 = L6_2.query
  L6_2 = L6_2.await
  L7_2 = [[
        SELECT
            linked_report.report_id AS id,
            report.title AS label

        FROM
            lbtablet_police_cases_linked_reports linked_report
        LEFT JOIN
            lbtablet_police_reports report ON report.id = linked_report.report_id
        WHERE
            linked_report.case_id = ?
    ]]
  L8_2 = {}
  L9_2 = A0_2
  L8_2[1] = L9_2
  L6_2 = L6_2(L7_2, L8_2)
  L1_2.reports = L6_2
  return L1_2
end
L26_1 = L11_1
L27_1 = "getCase"
function L28_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  L3_2 = L25_1
  L4_2 = A2_2
  return L3_2(L4_2)
end
L26_1(L27_1, L28_1)
function L26_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L2_2 = {}
  L3_2 = {}
  L4_2 = 1
  L5_2 = #A1_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = A1_2[L7_2]
    L9_2 = L8_2.charges
    if not L9_2 then
      L9_2 = {}
    end
    L8_2.charges = L9_2
    L9_2 = #L2_2
    L9_2 = L9_2 + 1
    L10_2 = {}
    L11_2 = A0_2
    L12_2 = L8_2.id
    L13_2 = L8_2.fine
    if not L13_2 then
      L13_2 = 0
    end
    L14_2 = L8_2.jailTime
    if not L14_2 then
      L14_2 = 0
    end
    L15_2 = L8_2.hasFined
    if not L15_2 then
      L15_2 = false
    end
    L16_2 = L8_2.hasJailed
    if not L16_2 then
      L16_2 = false
    end
    L10_2[1] = L11_2
    L10_2[2] = L12_2
    L10_2[3] = L13_2
    L10_2[4] = L14_2
    L10_2[5] = L15_2
    L10_2[6] = L16_2
    L2_2[L9_2] = L10_2
    L9_2 = 1
    L10_2 = L8_2.charges
    L10_2 = #L10_2
    L11_2 = 1
    for L12_2 = L9_2, L10_2, L11_2 do
      L13_2 = L8_2.charges
      L13_2 = L13_2[L12_2]
      L14_2 = #L3_2
      L14_2 = L14_2 + 1
      L15_2 = {}
      L16_2 = A0_2
      L17_2 = L8_2.id
      L18_2 = L13_2.id
      L19_2 = L13_2.charges
      if not L19_2 then
        L19_2 = 1
      end
      L15_2[1] = L16_2
      L15_2[2] = L17_2
      L15_2[3] = L18_2
      L15_2[4] = L19_2
      L3_2[L14_2] = L15_2
    end
  end
  L4_2 = #L2_2
  if 0 == L4_2 then
    return
  end
  L4_2 = MySQL
  L4_2 = L4_2.rawExecute
  L4_2 = L4_2.await
  L5_2 = "INSERT INTO lbtablet_police_cases_criminals (case_id, id, fine, jail_time, fined, jailed) VALUES (?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE fine = VALUES(fine), jail_time = VALUES(jail_time), fined = VALUES(fined), jailed = VALUES(jailed)"
  L6_2 = L2_2
  L4_2(L5_2, L6_2)
  L4_2 = #L3_2
  if L4_2 > 0 then
    L4_2 = MySQL
    L4_2 = L4_2.rawExecute
    L4_2 = L4_2.await
    L5_2 = "INSERT INTO lbtablet_police_cases_charges (case_id, criminal, offence_id, charges) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE offence_id = VALUES(offence_id), charges = VALUES(charges)"
    L6_2 = L3_2
    L4_2(L5_2, L6_2)
  end
end
function L27_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
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
        goto lbl_27
      end
    end
  end
  L3_2 = debugprint
  L4_2 = "SaveCase: Invalid data"
  L5_2 = A2_2
  L3_2(L4_2, L5_2)
  L3_2 = false
  do return L3_2 end
  ::lbl_27::
  L3_2 = A2_2.id
  L4_2 = A2_2.title
  L5_2 = A2_2.description
  L6_2 = A2_2.evidence
  if not L6_2 then
    L6_2 = {}
  end
  L7_2 = A2_2.vehicles
  if not L7_2 then
    L7_2 = {}
  end
  L8_2 = A2_2.officers
  if not L8_2 then
    L8_2 = {}
  end
  L9_2 = A2_2.civilians
  if not L9_2 then
    L9_2 = {}
  end
  L10_2 = A2_2.criminals
  if not L10_2 then
    L10_2 = {}
  end
  L11_2 = A2_2.weapons
  if not L11_2 then
    L11_2 = {}
  end
  L12_2 = A2_2.tags
  if not L12_2 then
    L12_2 = {}
  end
  L13_2 = A2_2.reports
  if not L13_2 then
    L13_2 = {}
  end
  if not L3_2 then
    L14_2 = HasPermission
    L15_2 = A0_2
    L16_2 = "Police"
    L17_2 = "case"
    L18_2 = "create"
    L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
    if not L14_2 then
      L14_2 = false
      return L14_2
    end
    L14_2 = MySQL
    L14_2 = L14_2.insert
    L14_2 = L14_2.await
    L15_2 = "INSERT INTO lbtablet_police_cases (title, `description`, created_by) VALUES (?, ?, ?)"
    L16_2 = {}
    L17_2 = L4_2
    L18_2 = L5_2
    L19_2 = A1_2
    L16_2[1] = L17_2
    L16_2[2] = L18_2
    L16_2[3] = L19_2
    L14_2 = L14_2(L15_2, L16_2)
    L3_2 = L14_2
    L14_2 = L10_1
    L15_2 = A1_2
    L16_2 = L3_2
    L17_2 = "create"
    L18_2 = "case"
    L19_2 = L
    L20_2 = "APPS.POLICE.LOGS.CREATE_CASE_TITLE"
    L19_2 = L19_2(L20_2)
    L20_2 = L
    L21_2 = "APPS.POLICE.LOGS.CREATE_CASE_DESCRIPTION"
    L22_2 = {}
    L22_2.title = L4_2
    L20_2, L21_2, L22_2, L23_2 = L20_2(L21_2, L22_2)
    L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
    L14_2 = Config
    L14_2 = L14_2.Police
    L14_2 = L14_2.Notifications
    L14_2 = L14_2.NewCase
    if L14_2 then
      L14_2 = L9_1
      L15_2 = {}
      L16_2 = L
      L17_2 = "BACKEND.POLICE.NEW_CASE_NOTIFICATION.TITLE"
      L16_2 = L16_2(L17_2)
      L15_2.title = L16_2
      L16_2 = L
      L17_2 = "BACKEND.POLICE.NEW_CASE_NOTIFICATION.CONTENT"
      L18_2 = {}
      L18_2.title = L4_2
      L18_2.description = L5_2
      L16_2 = L16_2(L17_2, L18_2)
      L15_2.content = L16_2
      L16_2 = {}
      L17_2 = A1_2
      L16_2[1] = L17_2
      L14_2(L15_2, L16_2)
    end
  else
    L14_2 = HasPermission
    L15_2 = A0_2
    L16_2 = "Police"
    L17_2 = "case"
    L18_2 = "edit"
    L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
    if not L14_2 then
      L14_2 = false
      return L14_2
    end
    L14_2 = MySQL
    L14_2 = L14_2.rawExecute
    L14_2 = L14_2.await
    L15_2 = "UPDATE lbtablet_police_cases SET title = ?, `description` = ? WHERE id = ?"
    L16_2 = {}
    L17_2 = L4_2
    L18_2 = L5_2
    L19_2 = L3_2
    L16_2[1] = L17_2
    L16_2[2] = L18_2
    L16_2[3] = L19_2
    L14_2(L15_2, L16_2)
    L14_2 = MySQL
    L14_2 = L14_2.rawExecute
    L14_2 = L14_2.await
    L15_2 = "DELETE FROM lbtablet_police_cases_evidence WHERE case_id = ?"
    L16_2 = {}
    L17_2 = L3_2
    L16_2[1] = L17_2
    L14_2(L15_2, L16_2)
    L14_2 = MySQL
    L14_2 = L14_2.rawExecute
    L14_2 = L14_2.await
    L15_2 = "DELETE FROM lbtablet_police_cases_tags WHERE case_id = ?"
    L16_2 = {}
    L17_2 = L3_2
    L16_2[1] = L17_2
    L14_2(L15_2, L16_2)
    L14_2 = MySQL
    L14_2 = L14_2.rawExecute
    L14_2 = L14_2.await
    L15_2 = "DELETE FROM lbtablet_police_cases_involved WHERE case_id = ? "
    L16_2 = {}
    L17_2 = L3_2
    L16_2[1] = L17_2
    L14_2(L15_2, L16_2)
    L14_2 = MySQL
    L14_2 = L14_2.rawExecute
    L14_2 = L14_2.await
    L15_2 = "DELETE FROM lbtablet_police_cases_criminals WHERE case_id = ?"
    L16_2 = {}
    L17_2 = L3_2
    L16_2[1] = L17_2
    L14_2(L15_2, L16_2)
    L14_2 = MySQL
    L14_2 = L14_2.rawExecute
    L14_2 = L14_2.await
    L15_2 = "DELETE FROM lbtablet_police_cases_charges WHERE case_id = ?"
    L16_2 = {}
    L17_2 = L3_2
    L16_2[1] = L17_2
    L14_2(L15_2, L16_2)
    L14_2 = MySQL
    L14_2 = L14_2.rawExecute
    L14_2 = L14_2.await
    L15_2 = "DELETE FROM lbtablet_police_cases_linked_reports WHERE case_id = ?"
    L16_2 = {}
    L17_2 = L3_2
    L16_2[1] = L17_2
    L14_2(L15_2, L16_2)
    L14_2 = TriggerClientEvent
    L15_2 = "tablet:police:caseUpdated"
    L16_2 = -1
    L17_2 = A2_2
    L14_2(L15_2, L16_2, L17_2)
    L14_2 = L10_1
    L15_2 = A1_2
    L16_2 = L3_2
    L17_2 = "update"
    L18_2 = "case"
    L19_2 = L
    L20_2 = "APPS.POLICE.LOGS.UPDATE_CASE_TITLE"
    L19_2 = L19_2(L20_2)
    L20_2 = L
    L21_2 = "APPS.POLICE.LOGS.UPDATE_CASE_DESCRIPTION"
    L22_2 = {}
    L22_2.title = L4_2
    L20_2, L21_2, L22_2, L23_2 = L20_2(L21_2, L22_2)
    L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
  end
  if not L3_2 then
    L14_2 = false
    return L14_2
  end
  L14_2 = L26_1
  L15_2 = L3_2
  L16_2 = L10_2
  L14_2(L15_2, L16_2)
  L14_2 = #L6_2
  if L14_2 > 0 then
    L14_2 = {}
    L15_2 = 1
    L16_2 = #L6_2
    L17_2 = 1
    for L18_2 = L15_2, L16_2, L17_2 do
      L19_2 = #L14_2
      L19_2 = L19_2 + 1
      L20_2 = {}
      L21_2 = L3_2
      L22_2 = L6_2[L18_2]
      L20_2[1] = L21_2
      L20_2[2] = L22_2
      L14_2[L19_2] = L20_2
    end
    L15_2 = MySQL
    L15_2 = L15_2.rawExecute
    L15_2 = L15_2.await
    L16_2 = "INSERT INTO lbtablet_police_cases_evidence (case_id, attachment) VALUES (?, ?) ON DUPLICATE KEY UPDATE attachment = VALUES(attachment)"
    L17_2 = L14_2
    L15_2(L16_2, L17_2)
  end
  L14_2 = #L12_2
  if L14_2 > 0 then
    L14_2 = {}
    L15_2 = 1
    L16_2 = #L12_2
    L17_2 = 1
    for L18_2 = L15_2, L16_2, L17_2 do
      L19_2 = #L14_2
      L19_2 = L19_2 + 1
      L20_2 = {}
      L21_2 = L3_2
      L22_2 = L12_2[L18_2]
      L20_2[1] = L21_2
      L20_2[2] = L22_2
      L14_2[L19_2] = L20_2
    end
    L15_2 = MySQL
    L15_2 = L15_2.rawExecute
    L15_2 = L15_2.await
    L16_2 = "INSERT INTO lbtablet_police_cases_tags (case_id, tag_id) VALUES (?, ?) ON DUPLICATE KEY UPDATE tag_id = VALUES(tag_id)"
    L17_2 = L14_2
    L15_2(L16_2, L17_2)
  end
  L14_2 = #L13_2
  if L14_2 > 0 then
    L14_2 = {}
    L15_2 = 1
    L16_2 = #L13_2
    L17_2 = 1
    for L18_2 = L15_2, L16_2, L17_2 do
      L19_2 = #L14_2
      L19_2 = L19_2 + 1
      L20_2 = {}
      L21_2 = L3_2
      L22_2 = L13_2[L18_2]
      L20_2[1] = L21_2
      L20_2[2] = L22_2
      L14_2[L19_2] = L20_2
    end
    L15_2 = MySQL
    L15_2 = L15_2.rawExecute
    L15_2 = L15_2.await
    L16_2 = "INSERT INTO lbtablet_police_cases_linked_reports (case_id, report_id) VALUES (?, ?) ON DUPLICATE KEY UPDATE report_id = VALUES(report_id)"
    L17_2 = L14_2
    L15_2(L16_2, L17_2)
  end
  L14_2 = {}
  L15_2 = 1
  L16_2 = #L7_2
  L17_2 = 1
  for L18_2 = L15_2, L16_2, L17_2 do
    L19_2 = #L14_2
    L19_2 = L19_2 + 1
    L20_2 = {}
    L21_2 = L3_2
    L22_2 = L7_2[L18_2]
    L23_2 = "vehicle"
    L20_2[1] = L21_2
    L20_2[2] = L22_2
    L20_2[3] = L23_2
    L14_2[L19_2] = L20_2
  end
  L15_2 = 1
  L16_2 = #L8_2
  L17_2 = 1
  for L18_2 = L15_2, L16_2, L17_2 do
    L19_2 = #L14_2
    L19_2 = L19_2 + 1
    L20_2 = {}
    L21_2 = L3_2
    L22_2 = L8_2[L18_2]
    L23_2 = "officer"
    L20_2[1] = L21_2
    L20_2[2] = L22_2
    L20_2[3] = L23_2
    L14_2[L19_2] = L20_2
  end
  L15_2 = 1
  L16_2 = #L9_2
  L17_2 = 1
  for L18_2 = L15_2, L16_2, L17_2 do
    L19_2 = #L14_2
    L19_2 = L19_2 + 1
    L20_2 = {}
    L21_2 = L3_2
    L22_2 = L9_2[L18_2]
    L23_2 = "civilian"
    L20_2[1] = L21_2
    L20_2[2] = L22_2
    L20_2[3] = L23_2
    L14_2[L19_2] = L20_2
  end
  L15_2 = 1
  L16_2 = #L11_2
  L17_2 = 1
  for L18_2 = L15_2, L16_2, L17_2 do
    L19_2 = #L14_2
    L19_2 = L19_2 + 1
    L20_2 = {}
    L21_2 = L3_2
    L22_2 = L11_2[L18_2]
    L23_2 = "weapon"
    L20_2[1] = L21_2
    L20_2[2] = L22_2
    L20_2[3] = L23_2
    L14_2[L19_2] = L20_2
  end
  L15_2 = #L14_2
  if L15_2 > 0 then
    L15_2 = MySQL
    L15_2 = L15_2.rawExecute
    L15_2 = L15_2.await
    L16_2 = "INSERT INTO lbtablet_police_cases_involved (case_id, involved, involvement) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE involvement = VALUES(involvement)"
    L17_2 = L14_2
    L15_2(L16_2, L17_2)
  end
  return L3_2
end
L28_1 = L11_1
L29_1 = "saveCase"
function L30_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = L27_1
  L4_2 = A0_2
  L5_2 = A1_2
  L6_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2)
end
L31_1 = {}
L31_1.antiSpam = true
L28_1(L29_1, L30_1, L31_1)
L28_1 = L11_1
L29_1 = "deleteCase"
function L30_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = "DELETE FROM lbtablet_police_cases WHERE id = ?"
  L5_2 = {}
  L6_2 = A2_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  L3_2 = L3_2 > 0
  if L3_2 then
    L4_2 = TriggerClientEvent
    L5_2 = "tablet:police:caseDeleted"
    L6_2 = -1
    L7_2 = A2_2
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = L10_1
    L5_2 = A1_2
    L6_2 = A2_2
    L7_2 = "delete"
    L8_2 = "case"
    L9_2 = L
    L10_2 = "APPS.POLICE.LOGS.DELETE_CASE_TITLE"
    L9_2 = L9_2(L10_2)
    L10_2 = L
    L11_2 = "APPS.POLICE.LOGS.DELETE_CASE_DESCRIPTION"
    L12_2 = {}
    L12_2.id = A2_2
    L10_2, L11_2, L12_2 = L10_2(L11_2, L12_2)
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  end
  return L3_2
end
L31_1 = {}
L32_1 = {}
L33_1 = {}
L34_1 = "case"
L35_1 = "delete"
L33_1[1] = L34_1
L33_1[2] = L35_1
L32_1[1] = L33_1
L31_1.permissions = L32_1
L28_1(L29_1, L30_1, L31_1)
L28_1 = L11_1
L29_1 = "openStash"
function L30_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = Config
  L3_2 = L3_2.EvidenceStash
  if not L3_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = MySQL
  L3_2 = L3_2.scalar
  L3_2 = L3_2.await
  L4_2 = "SELECT 1 FROM lbtablet_police_cases WHERE id = ?"
  L5_2 = {}
  L6_2 = A2_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L3_2 = debugprint
    L4_2 = "openStash: Case not found"
    L3_2(L4_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = OpenStash
  L4_2 = A0_2
  L5_2 = "case-"
  L6_2 = A2_2
  L5_2 = L5_2 .. L6_2
  L6_2 = L
  L7_2 = "BACKEND.POLICE.EVIDENCE_LABEL"
  L8_2 = {}
  L8_2.id = A2_2
  L6_2, L7_2, L8_2 = L6_2(L7_2, L8_2)
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
end
L31_1 = {}
L32_1 = {}
L33_1 = {}
L34_1 = "stash"
L35_1 = "view"
L33_1[1] = L34_1
L33_1[2] = L35_1
L32_1[1] = L33_1
L31_1.permissions = L32_1
L28_1(L29_1, L30_1, L31_1)
L28_1 = L11_1
L29_1 = "finePlayer"
function L30_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L6_2 = BillPlayer
  if not L6_2 then
    L6_2 = infoprint
    L7_2 = "warning"
    L8_2 = "The BillPlayer function is not defined. Please set it up to work with your billing script."
    L6_2(L7_2, L8_2)
    L6_2 = false
    return L6_2
  end
  if not (A2_2 and A3_2) or A3_2 < 0 or not A4_2 then
    L6_2 = debugprint
    L7_2 = "Invalid fine data"
    L8_2 = A2_2
    L9_2 = A3_2
    L10_2 = A4_2
    L11_2 = A5_2
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
    L6_2 = false
    return L6_2
  end
  if A2_2 == A1_2 then
    L6_2 = Config
    L6_2 = L6_2.Debug
    if L6_2 then
      L6_2 = infoprint
      L7_2 = "warning"
      L8_2 = "Normally you cannot fine yourself, but this is allowed in debug mode."
      L6_2(L7_2, L8_2)
    else
      L6_2 = SendNotification
      L7_2 = {}
      L7_2.source = A0_2
      L7_2.app = "Police"
      L8_2 = L
      L9_2 = "BACKEND.POLICE.CANT_FINE_YOURSELF_NOTIFICATION.TITLE"
      L8_2 = L8_2(L9_2)
      L7_2.title = L8_2
      L8_2 = L
      L9_2 = "BACKEND.POLICE.CANT_FINE_YOURSELF_NOTIFICATION.CONTENT"
      L8_2 = L8_2(L9_2)
      L7_2.content = L8_2
      L6_2(L7_2)
      L6_2 = false
      return L6_2
    end
  end
  L6_2 = BillPlayer
  L7_2 = A1_2
  L8_2 = A2_2
  L9_2 = "police"
  L10_2 = A3_2
  L11_2 = A4_2
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
  if not L6_2 then
    L6_2 = debugprint
    L7_2 = "Failed to bill player"
    L8_2 = A2_2
    L9_2 = A3_2
    L10_2 = A4_2
    L6_2(L7_2, L8_2, L9_2, L10_2)
    L6_2 = false
    return L6_2
  end
  if A5_2 then
    L6_2 = MySQL
    L6_2 = L6_2.update
    L6_2 = L6_2.await
    L7_2 = "UPDATE lbtablet_police_cases_criminals SET fined = 1 WHERE case_id = ? AND id = ?"
    L8_2 = {}
    L9_2 = A5_2
    L10_2 = A2_2
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = true
  return L6_2
end
L31_1 = {}
L32_1 = {}
L33_1 = {}
L34_1 = "case"
L35_1 = "fine"
L33_1[1] = L34_1
L33_1[2] = L35_1
L32_1[1] = L33_1
L31_1.permissions = L32_1
L28_1(L29_1, L30_1, L31_1)
L28_1 = exports
L29_1 = "GetPolicePlayerCharges"
function L30_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = assert
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L2_2 = "string" == L2_2
  L3_2 = "GetPoliceCharges: identifier must be a string"
  L1_2(L2_2, L3_2)
  L1_2 = {}
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "SELECT case_id, offence_id, charges FROM lbtablet_police_cases_charges WHERE criminal = ?"
  L4_2 = {}
  L5_2 = A0_2
  L4_2[1] = L5_2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = 1
  L4_2 = #L2_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = L2_2[L6_2]
    L8_2 = L5_1
    L9_2 = L7_2.offence_id
    L8_2 = L8_2(L9_2)
    if L8_2 then
      L9_2 = #L1_2
      L9_2 = L9_2 + 1
      L10_2 = {}
      L11_2 = L7_2.case_id
      L10_2.caseId = L11_2
      L10_2.offence = L8_2
      L11_2 = L7_2.charges
      L10_2.charges = L11_2
      L1_2[L9_2] = L10_2
    end
  end
  return L1_2
end
L28_1(L29_1, L30_1)
L28_1 = exports
L29_1 = "CreatePoliceCase"
function L30_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = GetEquippedTablet
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = debugprint
    L4_2 = "CreateCase: No tablet found"
    L3_2(L4_2)
    L3_2 = false
    L4_2 = "no_tablet"
    return L3_2, L4_2
  end
  A1_2.id = nil
  L3_2 = L27_1
  L4_2 = A0_2
  L5_2 = L2_2
  L6_2 = A1_2
  return L3_2(L4_2, L5_2, L6_2)
end
L28_1(L29_1, L30_1)
L28_1 = exports
L29_1 = "GetPoliceCase"
L30_1 = L25_1
L28_1(L29_1, L30_1)
L28_1 = exports
L29_1 = "UpdatePoliceCase"
function L30_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = GetEquippedTablet
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = debugprint
    L4_2 = "UpdateCase: No tablet found"
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
    L4_2 = "UpdateCase: No ID provided"
    L3_2(L4_2)
    L3_2 = false
    L4_2 = "no_id"
    return L3_2, L4_2
  end
  L3_2 = L27_1
  L4_2 = A0_2
  L5_2 = L2_2
  L6_2 = A1_2
  return L3_2(L4_2, L5_2, L6_2)
end
L28_1(L29_1, L30_1)
L28_1 = exports
L29_1 = "DeletePoliceCase"
function L30_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = MySQL
  L1_2 = L1_2.update
  L1_2 = L1_2.await
  L2_2 = "DELETE FROM lbtablet_police_cases WHERE id = ?"
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  L1_2 = L1_2(L2_2, L3_2)
  L1_2 = L1_2 > 0
  if L1_2 then
    L2_2 = TriggerClientEvent
    L3_2 = "tablet:police:caseDeleted"
    L4_2 = -1
    L5_2 = A0_2
    L2_2(L3_2, L4_2, L5_2)
  end
  return L1_2
end
L28_1(L29_1, L30_1)
function L28_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = MySQL
  L1_2 = L1_2.scalar
  L1_2 = L1_2.await
  L2_2 = "SELECT 1 FROM lbtablet_police_accounts WHERE callsign = ?"
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  L1_2 = L1_2(L2_2, L3_2)
  L1_2 = nil ~= L1_2
  return L1_2
end
function L29_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = Config
  L0_2 = L0_2.Police
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
    L3_2 = L28_1
    L4_2 = L1_2
    L3_2 = L3_2(L4_2)
    if not L3_2 then
      break
    end
    L2_2 = L2_2 + 1
    if L2_2 > 50 then
      L3_2 = infoprint
      L4_2 = "error"
      L5_2 = "Failed to generate a unique callsign after 50 attempts. Consider changing Config.Police.Callsign.Format"
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
function L30_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = Config
  L1_2 = L1_2.Police
  L1_2 = L1_2.Callsign
  L1_2 = L1_2.RequireTemplate
  if not L1_2 then
    L1_2 = true
    return L1_2
  end
  L1_2 = GetStringMatchPattern
  L2_2 = Config
  L2_2 = L2_2.Police
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
L31_1 = {}
function L32_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L2_2 = L1_1
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
  L5_2 = "SELECT * FROM lbtablet_police_accounts WHERE id = ?"
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L5_2 = L31_1
    L5_2 = L5_2[A1_2]
    if L5_2 then
      L5_2 = debugprint
      L6_2 = "Already generating police account for tabletId"
      L7_2 = A1_2
      L5_2(L6_2, L7_2)
      while true do
        L5_2 = L31_1
        L5_2 = L5_2[A1_2]
        if not L5_2 then
          break
        end
        L5_2 = Wait
        L6_2 = 0
        L5_2(L6_2)
      end
      L5_2 = L1_1
      L5_2 = L5_2[A1_2]
      return L5_2
    end
    L5_2 = L31_1
    L5_2[A1_2] = true
    L5_2 = GetCharacterName
    L6_2 = A0_2
    L5_2, L6_2 = L5_2(L6_2)
    L7_2 = nil
    L8_2 = Config
    L8_2 = L8_2.Police
    L8_2 = L8_2.Callsign
    L8_2 = L8_2.AutoGenerate
    if L8_2 then
      L8_2 = L29_1
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
    L11_2 = "INSERT INTO lbtablet_police_accounts ("
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
      L0_3 = L31_1
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
  L5_2 = L1_1
  L5_2[A1_2] = L4_2
  return L4_2
end
L33_1 = L11_1
L34_1 = "getLoggedIn"
L35_1 = L32_1
L33_1(L34_1, L35_1)
L33_1 = L11_1
L34_1 = "updateOwnAccount"
function L35_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = L1_1
  L4_2 = L4_2[A1_2]
  L5_2 = L4_2
  if L5_2 then
    L5_2 = L5_2.callsign
  end
  if L5_2 ~= A2_2 then
    L6_2 = L30_1
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
  L7_2 = "UPDATE lbtablet_police_accounts SET callsign = ?, avatar = ? WHERE id = ?"
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
    L7_2 = L1_1
    L7_2 = L7_2[A1_2]
    if L7_2 then
      L7_2 = L1_1
      L7_2 = L7_2[A1_2]
      L7_2.callsign = A2_2
      L7_2 = L1_1
      L7_2 = L7_2[A1_2]
      L7_2.avatar = A3_2
      L7_2 = TriggerClientEvent
      L8_2 = "tablet:police:updateCallsign"
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
L36_1 = {}
L36_1.antiSpam = true
L33_1(L34_1, L35_1, L36_1)
L33_1 = exports
L34_1 = "SetPoliceCallsign"
function L35_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = assert
  L4_2 = type
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L4_2 = "string" == L4_2
  L5_2 = "SetPoliceCallsign: identifier must be a string"
  L3_2(L4_2, L5_2)
  L3_2 = assert
  L4_2 = type
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  L4_2 = "string" == L4_2
  L5_2 = "SetPoliceCallsign: callsign must be a string"
  L3_2(L4_2, L5_2)
  if not A2_2 then
    L3_2 = L30_1
    L4_2 = A1_2
    L3_2 = L3_2(L4_2)
    if not L3_2 then
      L3_2 = infoprint
      L4_2 = "warning"
      L5_2 = "SetPoliceCallsign: Invalid callsign '"
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
  L4_2 = "UPDATE lbtablet_police_accounts SET callsign = ? WHERE id = ?"
  L5_2 = {}
  L6_2 = A1_2
  L7_2 = A0_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L3_2(L4_2, L5_2)
  L3_2 = L1_1
  L3_2 = L3_2[A0_2]
  if L3_2 then
    L3_2 = L1_1
    L3_2 = L3_2[A0_2]
    L3_2.callsign = A1_2
    L3_2 = TriggerClientEvent
    L4_2 = "tablet:police:updateCallsign"
    L5_2 = -1
    L6_2 = {}
    L6_2.source = A0_2
    L6_2.identifier = A0_2
    L6_2.callsign = A1_2
    L3_2(L4_2, L5_2, L6_2)
  end
  L3_2 = true
  return L3_2
end
L33_1(L34_1, L35_1)
L33_1 = L11_1
L34_1 = "getPrisoners"
function L35_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  if "" ~= A2_2 then
    L4_2 = type
    L5_2 = A2_2
    L4_2 = L4_2(L5_2)
    if "string" == L4_2 then
      goto lbl_9
    end
  end
  A2_2 = nil
  ::lbl_9::
  L4_2 = [[
        SELECT
            j.id, j.prisoner, j.jailed_by, j.reason, j.jail_time, j.jailed_at, j.related_case, j.original_time,
            {SELECT_NAME} as `name`, a.display_name AS jailedBy, p.avatar
        FROM lbtablet_police_jail j
        LEFT JOIN lbtablet_police_profiles p ON p.id = j.prisoner
        LEFT JOIN lbtablet_police_accounts a ON a.id = j.jailed_by
        {JOIN_NAME}
        WHERE j.jail_time > 0 {WHERE}
        ORDER BY jailed_at DESC
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
    L6_2 = L4_2.gsub
    L8_2 = "{WHERE}"
    L9_2 = "AND j.id < ? AND (reason LIKE ? OR "
    L10_2 = Queries
    L10_2 = L10_2.Users
    L10_2 = L10_2.Select
    L10_2 = L10_2.name
    L11_2 = " LIKE ?)"
    L9_2 = L9_2 .. L10_2 .. L11_2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L4_2 = L6_2
  elseif A3_2 then
    L7_2 = L4_2
    L6_2 = L4_2.gsub
    L8_2 = "{WHERE}"
    L9_2 = "AND j.id < ?"
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L4_2 = L6_2
  elseif A2_2 then
    L7_2 = L4_2
    L6_2 = L4_2.gsub
    L8_2 = "{WHERE}"
    L9_2 = "AND (reason LIKE ? OR "
    L10_2 = Queries
    L10_2 = L10_2.Users
    L10_2 = L10_2.Select
    L10_2 = L10_2.name
    L11_2 = " LIKE ?)"
    L9_2 = L9_2 .. L10_2 .. L11_2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L4_2 = L6_2
  else
    L7_2 = L4_2
    L6_2 = L4_2.gsub
    L8_2 = "{WHERE}"
    L9_2 = ""
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L4_2 = L6_2
  end
  L7_2 = L4_2
  L6_2 = L4_2.gsub
  L8_2 = "{SELECT_NAME}"
  L9_2 = Queries
  L9_2 = L9_2.Users
  L9_2 = L9_2.Select
  L9_2 = L9_2.name
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = L6_2
  L6_2 = L6_2.gsub
  L8_2 = "{JOIN_NAME}"
  L9_2 = FormatString
  L10_2 = "LEFT JOIN {USERS_TABLE} user ON {IDENTIFIER} {USERS_COLLATE} = j.prisoner"
  L11_2 = {}
  L12_2 = Queries
  L12_2 = L12_2.Users
  L12_2 = L12_2.Table
  L11_2.USERS_TABLE = L12_2
  L12_2 = Queries
  L12_2 = L12_2.Users
  L12_2 = L12_2.Select
  L12_2 = L12_2.identifier
  L11_2.IDENTIFIER = L12_2
  L12_2 = UsersCollate
  L11_2.USERS_COLLATE = L12_2
  L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L9_2(L10_2, L11_2)
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  L4_2 = L6_2
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
    L12_2 = L11_2.jail_time
    L13_2 = nil
    L14_2 = GetRemainingPrisonSentence
    if L14_2 then
      L14_2 = GetRemainingPrisonSentence
      L15_2 = L11_2.prisoner
      L14_2 = L14_2(L15_2)
      L12_2 = L14_2 or L12_2
      if not L14_2 then
      end
    end
    L14_2 = L11_2.related_case
    if L14_2 then
      L14_2 = MySQL
      L14_2 = L14_2.scalar
      L14_2 = L14_2.await
      L15_2 = "SELECT title FROM lbtablet_police_cases WHERE id = ?"
      L16_2 = {}
      L17_2 = L11_2.related_case
      L16_2[1] = L17_2
      L14_2 = L14_2(L15_2, L16_2)
      L15_2 = {}
      L16_2 = L11_2.related_case
      L15_2.id = L16_2
      L15_2.label = L14_2
      L13_2 = L15_2
    end
    L14_2 = {}
    L15_2 = L11_2.id
    L14_2.uniqueId = L15_2
    L15_2 = L11_2.prisoner
    L14_2.id = L15_2
    L15_2 = L11_2.avatar
    L14_2.avatar = L15_2
    L15_2 = L11_2.name
    L14_2.name = L15_2
    L15_2 = L11_2.reason
    L14_2.description = L15_2
    L15_2 = L11_2.jailedBy
    if not L15_2 then
      L15_2 = L11_2.jailed_by
      if not L15_2 then
        L15_2 = "??"
      end
    end
    L14_2.jailedBy = L15_2
    L15_2 = L11_2.original_time
    L14_2.originalTime = L15_2
    L15_2 = math
    L15_2 = L15_2.max
    L16_2 = 0
    L17_2 = L12_2
    L15_2 = L15_2(L16_2, L17_2)
    L14_2.remainingTime = L15_2
    L15_2 = L11_2.jailed_at
    L14_2.jailedAt = L15_2
    L15_2 = os
    L15_2 = L15_2.time
    L15_2 = L15_2()
    L15_2 = L15_2 + L12_2
    L15_2 = L15_2 * 1000
    L14_2.releasedAt = L15_2
    L14_2.case = L13_2
    L6_2[L10_2] = L14_2
  end
  return L6_2
end
L33_1(L34_1, L35_1)
L33_1 = L11_1
L34_1 = "getPrisoner"
function L35_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  L3_2 = GetJailed
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = L3_2.id
  L3_2.uniqueId = L4_2
  L4_2 = L3_2.identifier
  L3_2.id = L4_2
  return L3_2
end
L33_1(L34_1, L35_1)
L33_1 = L11_1
L34_1 = "jailPlayer"
function L35_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L6_2 = MySQL
  L6_2 = L6_2.scalar
  L6_2 = L6_2.await
  L7_2 = "SELECT id FROM lbtablet_police_jail WHERE prisoner = ? AND jail_time > 0"
  L8_2 = {}
  L9_2 = A2_2
  L8_2[1] = L9_2
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = Config
  L7_2 = L7_2.Police
  L7_2 = L7_2.Jail
  L7_2 = L7_2.AllowJailJailed
  if not L7_2 and L6_2 then
    L7_2 = debugprint
    L8_2 = "Player is already jailed"
    L7_2(L8_2)
    L7_2 = false
    return L7_2
  end
  if A1_2 == A2_2 then
    L7_2 = Config
    L7_2 = L7_2.Debug
    if L7_2 then
      L7_2 = infoprint
      L8_2 = "warning"
      L9_2 = "Normally you cannot jail yourself, but this is allowed in debug mode."
      L7_2(L8_2, L9_2)
    else
      L7_2 = SendNotification
      L8_2 = {}
      L8_2.source = A0_2
      L8_2.app = "Police"
      L9_2 = L
      L10_2 = "BACKEND.POLICE.CANT_JAIL_YOURSELF_NOTIFICATION.TITLE"
      L9_2 = L9_2(L10_2)
      L8_2.title = L9_2
      L9_2 = L
      L10_2 = "BACKEND.POLICE.CANT_JAIL_YOURSELF_NOTIFICATION.CONTENT"
      L9_2 = L9_2(L10_2)
      L8_2.content = L9_2
      L7_2(L8_2)
      L7_2 = false
      return L7_2
    end
  end
  L7_2 = math
  L7_2 = L7_2.floor
  L8_2 = A3_2 * 60
  L7_2 = L7_2(L8_2)
  L8_2 = JailPlayer
  if not L8_2 then
    L8_2 = infoprint
    L9_2 = "warning"
    L10_2 = "JailPlayer function is not available, please set up your jail script!"
    L8_2(L9_2, L10_2)
    L8_2 = false
    return L8_2
  end
  L8_2 = JailPlayer
  L9_2 = A2_2
  L10_2 = L7_2
  L11_2 = A4_2
  L12_2 = A0_2
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
  if not L8_2 then
    L8_2 = debugprint
    L9_2 = "Failed to jail player"
    L8_2(L9_2)
    L8_2 = false
    return L8_2
  end
  if L6_2 then
    L8_2 = MySQL
    L8_2 = L8_2.update
    L8_2 = L8_2.await
    L9_2 = "UPDATE lbtablet_police_jail SET jail_time = 0 WHERE id = ?"
    L10_2 = {}
    L11_2 = L6_2
    L10_2[1] = L11_2
    L8_2(L9_2, L10_2)
  end
  L8_2 = LogJailed
  L9_2 = A2_2
  L10_2 = A1_2
  L11_2 = A4_2
  L12_2 = L7_2
  L13_2 = A5_2
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  if not L8_2 then
    L9_2 = false
    return L9_2
  end
  if A5_2 then
    L9_2 = MySQL
    L9_2 = L9_2.update
    L9_2 = L9_2.await
    L10_2 = "UPDATE lbtablet_police_cases_criminals SET jailed = 1 WHERE case_id = ? AND id = ?"
    L11_2 = {}
    L12_2 = A5_2
    L13_2 = A2_2
    L11_2[1] = L12_2
    L11_2[2] = L13_2
    L9_2(L10_2, L11_2)
  end
  return L8_2
end
L36_1 = {}
L37_1 = {}
L38_1 = {}
L39_1 = "jail"
L40_1 = "create"
L38_1[1] = L39_1
L38_1[2] = L40_1
L37_1[1] = L38_1
L36_1.permissions = L37_1
L33_1(L34_1, L35_1, L36_1)
L33_1 = L11_1
L34_1 = "updatePrisoner"
function L35_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = MySQL
  L5_2 = L5_2.scalar
  L5_2 = L5_2.await
  L6_2 = "SELECT id FROM lbtablet_police_jail WHERE prisoner = ? AND jail_time > 0"
  L7_2 = {}
  L8_2 = A2_2
  L7_2[1] = L8_2
  L5_2 = L5_2(L6_2, L7_2)
  if not L5_2 then
    L6_2 = debugprint
    L7_2 = "Player is not jailed"
    L8_2 = A2_2
    L6_2(L7_2, L8_2)
    L6_2 = false
    return L6_2
  end
  L6_2 = MySQL
  L6_2 = L6_2.update
  L6_2 = L6_2.await
  L7_2 = "UPDATE lbtablet_police_jail SET reason = ?, related_case = ? WHERE id = ?"
  L8_2 = {}
  L9_2 = A3_2
  L10_2 = A4_2
  L11_2 = L5_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L6_2 = L6_2(L7_2, L8_2)
  L6_2 = L6_2 > 0
  return L6_2
end
L36_1 = {}
L36_1.antiSpam = true
L37_1 = {}
L38_1 = {}
L39_1 = "jail"
L40_1 = "edit"
L38_1[1] = L39_1
L38_1[2] = L40_1
L37_1[1] = L38_1
L36_1.permissions = L37_1
L33_1(L34_1, L35_1, L36_1)
L33_1 = L11_1
L34_1 = "unjailPlayer"
function L35_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = UnjailPlayer
  if not L3_2 then
    L3_2 = infoprint
    L4_2 = "warning"
    L5_2 = "JailPlayer function is not available, please set up your jail script!"
    L3_2(L4_2, L5_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = UnjailPlayer
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = "UPDATE lbtablet_police_jail SET jail_time = 0 WHERE prisoner = ?"
  L5_2 = {}
  L6_2 = A2_2
  L5_2[1] = L6_2
  L3_2(L4_2, L5_2)
  L3_2 = TriggerClientEvent
  L4_2 = "tablet:police:prisonerReleased"
  L5_2 = -1
  L6_2 = A2_2
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = true
  return L3_2
end
L36_1 = {}
L37_1 = {}
L38_1 = {}
L39_1 = "jail"
L40_1 = "unjail"
L38_1[1] = L39_1
L38_1[2] = L40_1
L37_1[1] = L38_1
L36_1.permissions = L37_1
L33_1(L34_1, L35_1, L36_1)
function L33_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = assert
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L2_2 = "string" == L2_2
  L3_2 = "prisoner must be a string"
  L1_2(L2_2, L3_2)
  L1_2 = [[
        SELECT
            j.id, j.prisoner, j.jailed_by, j.reason, j.jail_time, j.jailed_at, j.related_case, j.original_time,
            {SELECT_NAME} as `name`, a.display_name AS jailedBy, p.avatar
        FROM lbtablet_police_jail j
        LEFT JOIN lbtablet_police_profiles p ON p.id = j.prisoner
        LEFT JOIN lbtablet_police_accounts a ON a.id = j.jailed_by
        {JOIN_NAME}
        WHERE j.jail_time > 0 AND j.prisoner = ?
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
  L4_2 = "{JOIN_NAME}"
  L5_2 = FormatString
  L6_2 = "LEFT JOIN {USERS_TABLE} user ON {IDENTIFIER} {USERS_COLLATE} = j.prisoner"
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
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2, L7_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
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
  L3_2 = GetRemainingPrisonSentence
  if L3_2 then
    L3_2 = GetRemainingPrisonSentence
    L4_2 = L2_2.prisoner
    L3_2 = L3_2(L4_2)
    if not L3_2 then
      L3_2 = L2_2.jail_time
    end
    L2_2.jail_time = L3_2
  end
  L3_2 = L2_2.related_case
  if L3_2 then
    L3_2 = MySQL
    L3_2 = L3_2.scalar
    L3_2 = L3_2.await
    L4_2 = "SELECT title FROM lbtablet_police_cases WHERE id = ?"
    L5_2 = {}
    L6_2 = L2_2.related_case
    L5_2[1] = L6_2
    L3_2 = L3_2(L4_2, L5_2)
    L4_2 = {}
    L5_2 = L2_2.related_case
    L4_2.id = L5_2
    L4_2.label = L3_2
    L2_2.case = L4_2
  end
  L3_2 = {}
  L4_2 = L2_2.id
  L3_2.id = L4_2
  L4_2 = L2_2.prisoner
  L3_2.identifier = L4_2
  L4_2 = L2_2.avatar
  L3_2.avatar = L4_2
  L4_2 = L2_2.name
  L3_2.name = L4_2
  L4_2 = L2_2.reason
  L3_2.description = L4_2
  L4_2 = L2_2.jailedBy
  if not L4_2 then
    L4_2 = L2_2.jailed_by
    if not L4_2 then
      L4_2 = "??"
    end
  end
  L3_2.jailedBy = L4_2
  L4_2 = L2_2.original_time
  L3_2.originalTime = L4_2
  L4_2 = math
  L4_2 = L4_2.max
  L5_2 = 0
  L6_2 = L2_2.jail_time
  L4_2 = L4_2(L5_2, L6_2)
  L3_2.remainingTime = L4_2
  L4_2 = L2_2.jailed_at
  L3_2.jailedAt = L4_2
  L4_2 = os
  L4_2 = L4_2.time
  L4_2 = L4_2()
  L5_2 = L2_2.jail_time
  L4_2 = L4_2 + L5_2
  L4_2 = L4_2 * 1000
  L3_2.releasedAt = L4_2
  L4_2 = L2_2.case
  L3_2.case = L4_2
  return L3_2
end
GetJailed = L33_1
L33_1 = exports
L34_1 = "GetJailed"
L35_1 = GetJailed
L33_1(L34_1, L35_1)
function L33_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L5_2 = assert
  L6_2 = type
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  L6_2 = "string" == L6_2
  L7_2 = "prisoner must be a string"
  L5_2(L6_2, L7_2)
  L5_2 = assert
  L6_2 = type
  L7_2 = A2_2
  L6_2 = L6_2(L7_2)
  L6_2 = "string" == L6_2
  L7_2 = "reason must be a string"
  L5_2(L6_2, L7_2)
  L5_2 = assert
  L6_2 = type
  L7_2 = A3_2
  L6_2 = L6_2(L7_2)
  L6_2 = "number" == L6_2
  L7_2 = "jailTime must be a number"
  L5_2(L6_2, L7_2)
  L5_2 = assert
  L6_2 = A3_2 > 0
  L7_2 = "jailTime must be greater than 0"
  L5_2(L6_2, L7_2)
  L5_2 = MySQL
  L5_2 = L5_2.scalar
  L5_2 = L5_2.await
  L6_2 = "SELECT 1 FROM lbtablet_police_jail WHERE prisoner = ? AND jail_time > 0"
  L7_2 = {}
  L8_2 = A0_2
  L7_2[1] = L8_2
  L5_2 = L5_2(L6_2, L7_2)
  if L5_2 then
    L6_2 = infoprint
    L7_2 = "warning"
    L8_2 = A0_2
    L9_2 = " is already jailed"
    L8_2 = L8_2 .. L9_2
    L6_2(L7_2, L8_2)
    L6_2 = false
    return L6_2
  end
  L6_2 = debugprint
  L7_2 = "LogJailed"
  L8_2 = A0_2
  L9_2 = A1_2
  L10_2 = A2_2
  L11_2 = A3_2
  L12_2 = A4_2
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  L6_2 = "prisoner, jailed_by, reason, jail_time, original_time"
  L7_2 = {}
  L8_2 = A0_2
  L9_2 = A1_2
  L10_2 = A2_2
  L11_2 = A3_2
  L12_2 = A3_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L7_2[4] = L11_2
  L7_2[5] = L12_2
  if A4_2 then
    L8_2 = assert
    L9_2 = type
    L10_2 = A4_2
    L9_2 = L9_2(L10_2)
    L9_2 = "number" == L9_2
    L10_2 = "relatedCase must be a number"
    L8_2(L9_2, L10_2)
    L8_2 = MySQL
    L8_2 = L8_2.scalar
    L8_2 = L8_2.await
    L9_2 = "SELECT 1 FROM lbtablet_police_cases WHERE id = ?"
    L10_2 = {}
    L11_2 = A4_2
    L10_2[1] = L11_2
    L8_2 = L8_2(L9_2, L10_2)
    if not L8_2 then
      L9_2 = error
      L10_2 = "Invalid relatedCase: case does not exist"
      L9_2(L10_2)
    end
    L9_2 = #L7_2
    L9_2 = L9_2 + 1
    L7_2[L9_2] = A4_2
    L9_2 = L6_2
    L10_2 = ", related_case"
    L9_2 = L9_2 .. L10_2
    L6_2 = L9_2
  end
  L8_2 = "?, "
  L9_2 = L8_2
  L8_2 = L8_2.rep
  L10_2 = #L7_2
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = L8_2
  L8_2 = L8_2.sub
  L10_2 = 1
  L11_2 = -3
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  L9_2 = MySQL
  L9_2 = L9_2.insert
  L9_2 = L9_2.await
  L10_2 = "INSERT INTO lbtablet_police_jail ("
  L11_2 = L6_2
  L12_2 = ") VALUES ("
  L13_2 = L8_2
  L14_2 = ")"
  L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2
  L11_2 = L7_2
  L9_2 = L9_2(L10_2, L11_2)
  if not L9_2 then
    L10_2 = false
    return L10_2
  end
  L10_2 = GetJailed
  L11_2 = A0_2
  L10_2 = L10_2(L11_2)
  if L10_2 then
    L11_2 = TriggerClientEvent
    L12_2 = "tablet:police:newPrisoner"
    L13_2 = -1
    L14_2 = L10_2
    L11_2(L12_2, L13_2, L14_2)
  end
  return L9_2
end
LogJailed = L33_1
L33_1 = exports
L34_1 = "LogJailed"
L35_1 = LogJailed
L33_1(L34_1, L35_1)
function L33_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = assert
  L3_2 = type
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L3_2 = "string" == L3_2
  L4_2 = "prisoner must be a string"
  L2_2(L3_2, L4_2)
  L2_2 = assert
  L3_2 = type
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  L3_2 = "number" == L3_2
  L4_2 = "jailTime must be a number"
  L2_2(L3_2, L4_2)
  L2_2 = MySQL
  L2_2 = L2_2.scalar
  L2_2 = L2_2.await
  L3_2 = "SELECT id FROM lbtablet_police_jail WHERE prisoner = ? AND jail_time > 0"
  L4_2 = {}
  L5_2 = A0_2
  L4_2[1] = L5_2
  L2_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = "UPDATE lbtablet_police_jail SET jail_time = ? WHERE id = ?"
  L5_2 = {}
  L6_2 = math
  L6_2 = L6_2.max
  L7_2 = 0
  L8_2 = A1_2
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = L2_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L3_2 = L3_2(L4_2, L5_2)
  L3_2 = L3_2 > 0
  if L3_2 and 0 == A1_2 then
    L4_2 = TriggerClientEvent
    L5_2 = "tablet:police:prisonerReleased"
    L6_2 = -1
    L7_2 = A0_2
    L4_2(L5_2, L6_2, L7_2)
  end
  return L3_2
end
UpdateJailSentence = L33_1
L33_1 = exports
L34_1 = "UpdateJailSentence"
L35_1 = UpdateJailSentence
L33_1(L34_1, L35_1)
L33_1 = L11_1
L34_1 = "triangulate"
function L35_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = Config
  L3_2 = L3_2.LBPhone
  if not L3_2 then
    L3_2 = debugprint
    L4_2 = "LBPhone is not enabled"
    L3_2(L4_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = Config
  L3_2 = L3_2.Police
  L3_2 = L3_2.Triangulation
  if not L3_2 then
    L3_2 = debugprint
    L4_2 = "Phone triangulation is not configured"
    L3_2(L4_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = exports
  L3_2 = L3_2["lb-phone"]
  L4_2 = L3_2
  L3_2 = L3_2.GetSourceFromNumber
  L5_2 = A2_2
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L4_2 = debugprint
    L5_2 = "Source not found from phone number"
    L6_2 = A2_2
    L4_2(L5_2, L6_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = exports
  L4_2 = L4_2["lb-phone"]
  L5_2 = L4_2
  L4_2 = L4_2.HasAirplaneMode
  L6_2 = A2_2
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 then
    L4_2 = debugprint
    L5_2 = "Phone is in airplane mode"
    L4_2(L5_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = math
  L4_2 = L4_2.random
  L5_2 = 100
  L4_2 = L4_2(L5_2)
  L5_2 = Config
  L5_2 = L5_2.Police
  L5_2 = L5_2.Triangulation
  L5_2 = L5_2.SuccessRate
  if L4_2 > L5_2 then
    L4_2 = debugprint
    L5_2 = "Triangulation failed (SuccessRate)"
    L4_2(L5_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = Config
  L4_2 = L4_2.Police
  L4_2 = L4_2.Triangulation
  L4_2 = L4_2.RequireCall
  if L4_2 then
    L4_2 = exports
    L4_2 = L4_2["lb-phone"]
    L5_2 = L4_2
    L4_2 = L4_2.IsInCall
    L6_2 = L3_2
    L4_2 = L4_2(L5_2, L6_2)
    if not L4_2 then
      L4_2 = debugprint
      L5_2 = "Phone is not in a call"
      L4_2(L5_2)
      L4_2 = false
      return L4_2
    end
  end
  L4_2 = GetPlayerPed
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if not L4_2 or 0 == L4_2 then
    L5_2 = debugprint
    L6_2 = "Player ped not found"
    L5_2(L6_2)
    L5_2 = false
    return L5_2
  end
  L5_2 = GetEntityCoords
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = {}
  L7_2 = L5_2.x
  L6_2.x = L7_2
  L7_2 = L5_2.y
  L6_2.y = L7_2
  L7_2 = L5_2.z
  L6_2.z = L7_2
  return L6_2
end
L36_1 = {}
L37_1 = {}
L38_1 = {}
L39_1 = "phone"
L40_1 = "triangulate"
L38_1[1] = L39_1
L38_1[2] = L40_1
L37_1[1] = L38_1
L36_1.permissions = L37_1
L33_1(L34_1, L35_1, L36_1)
function L33_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = HasPermission
  L2_2 = A0_2
  L3_2 = "Police"
  L4_2 = "phone"
  L5_2 = "view"
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  if not L1_2 then
    L1_2 = debugprint
    L2_2 = "Player does not have permission to view phone tab"
    L1_2(L2_2)
    L1_2 = false
    return L1_2
  end
  L1_2 = HasPermission
  L2_2 = A0_2
  L3_2 = "Police"
  L4_2 = "phone"
  L5_2 = "unlock"
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  if not L1_2 then
    L1_2 = debugprint
    L2_2 = "Player does not have permission to unlock phones"
    L1_2(L2_2)
    L1_2 = false
    return L1_2
  end
  L1_2 = Config
  L1_2 = L1_2.LBPhone
  if not L1_2 then
    L1_2 = debugprint
    L2_2 = "LBPhone is not enabled"
    L1_2(L2_2)
    L1_2 = false
    return L1_2
  end
  L1_2 = Config
  L1_2 = L1_2.Police
  L1_2 = L1_2.PhoneUnlock
  if not L1_2 then
    L1_2 = debugprint
    L2_2 = "Phone unlock is configured"
    L1_2(L2_2)
    L1_2 = false
    return L1_2
  end
  L1_2 = GetPhones
  if not L1_2 then
    L1_2 = infoprint
    L2_2 = "warning"
    L3_2 = "GetPhones function is not defined. Please set it up to work with your inventory script."
    L1_2(L2_2, L3_2)
    L1_2 = false
    return L1_2
  end
  L1_2 = HasPhone
  if not L1_2 then
    L1_2 = infoprint
    L2_2 = "warning"
    L3_2 = "HasPhone function is not defined. Please set it up to work with your inventory script."
    L1_2(L2_2, L3_2)
    L1_2 = false
    return L1_2
  end
  L1_2 = true
  return L1_2
end
L34_1 = L11_1
L35_1 = "getPhones"
function L36_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L2_2 = L33_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = GetPhones
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = {}
  L4_2 = {}
  L5_2 = {}
  L6_2 = {}
  if L2_2 then
    L7_2 = #L2_2
    if 0 ~= L7_2 then
      goto lbl_28
    end
  end
  L7_2 = debugprint
  L8_2 = "No phones found for player"
  L7_2(L8_2)
  do return L3_2 end
  ::lbl_28::
  L7_2 = 1
  L8_2 = #L2_2
  L9_2 = 1
  for L10_2 = L7_2, L8_2, L9_2 do
    L11_2 = L2_2[L10_2]
    L11_2 = L11_2.phoneNumber
    L4_2[L10_2] = L11_2
  end
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = "SELECT phone_number, pin FROM phone_phones WHERE phone_number IN (?)"
  L9_2 = {}
  L10_2 = L4_2
  L9_2[1] = L10_2
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = 1
  L9_2 = #L7_2
  L10_2 = 1
  for L11_2 = L8_2, L9_2, L10_2 do
    L12_2 = L7_2[L11_2]
    L13_2 = L12_2.phone_number
    L14_2 = L12_2.pin
    L5_2[L13_2] = L14_2
  end
  L8_2 = MySQL
  L8_2 = L8_2.query
  L8_2 = L8_2.await
  L9_2 = [[
        SELECT
            phone_number,
            finished_at,
            unlocked,
            attempts
        FROM
            lbtablet_police_phone_unlocks
        WHERE
            phone_number IN (?)
    ]]
  L10_2 = {}
  L11_2 = L4_2
  L10_2[1] = L11_2
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = 1
  L10_2 = #L8_2
  L11_2 = 1
  for L12_2 = L9_2, L10_2, L11_2 do
    L13_2 = L8_2[L12_2]
    L14_2 = L13_2.phone_number
    L15_2 = {}
    L16_2 = L13_2.finished_at
    if not L16_2 then
      L16_2 = nil
    end
    L15_2.finishedAt = L16_2
    L16_2 = L13_2.unlocked
    L15_2.unlocked = L16_2
    L16_2 = L13_2.attempts
    if not L16_2 then
      L16_2 = 0
    end
    L15_2.attempts = L16_2
    L6_2[L14_2] = L15_2
  end
  L9_2 = 1
  L10_2 = #L2_2
  L11_2 = 1
  for L12_2 = L9_2, L10_2, L11_2 do
    L13_2 = L2_2[L12_2]
    L14_2 = L13_2.phoneNumber
    L14_2 = L6_2[L14_2]
    L15_2 = L13_2.phoneNumber
    L15_2 = L5_2[L15_2]
    if L15_2 then
      L15_2 = #L3_2
      L15_2 = L15_2 + 1
      L16_2 = {}
      L17_2 = L13_2.phoneNumber
      L16_2.phoneNumber = L17_2
      L17_2 = L13_2.phoneName
      L16_2.phoneName = L17_2
      if L14_2 then
        L17_2 = L14_2.finishedAt
        if L17_2 then
          L17_2 = math
          L17_2 = L17_2.max
          L18_2 = 0
          L19_2 = math
          L19_2 = L19_2.floor
          L20_2 = L14_2.finishedAt
          L20_2 = L20_2 / 1000
          L19_2 = L19_2(L20_2)
          L20_2 = os
          L20_2 = L20_2.time
          L20_2 = L20_2()
          L19_2 = L19_2 - L20_2
          L17_2 = L17_2(L18_2, L19_2)
          if L17_2 then
            goto lbl_128
          end
        end
      end
      L17_2 = nil
      ::lbl_128::
      L16_2.timeRemaining = L17_2
      if L14_2 then
        L17_2 = L14_2.unlocked
        if L17_2 then
          goto lbl_135
        end
      end
      L17_2 = false
      ::lbl_135::
      L16_2.unlocked = L17_2
      if L14_2 then
        L17_2 = L14_2.attempts
        if L17_2 then
          goto lbl_142
        end
      end
      L17_2 = 0
      ::lbl_142::
      L16_2.attempts = L17_2
      L3_2[L15_2] = L16_2
    end
  end
  return L3_2
end
L34_1(L35_1, L36_1)
L34_1 = L11_1
L35_1 = "unlockPhone"
function L36_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L3_2 = L33_1
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = HasPhone
  L4_2 = A0_2
  L5_2 = A2_2
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L3_2 = debugprint
    L4_2 = "Player does not have the phone"
    L5_2 = A2_2
    L3_2(L4_2, L5_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = MySQL
  L3_2 = L3_2.single
  L3_2 = L3_2.await
  L4_2 = "SELECT finished_at > NOW() AS processing, unlocked, attempts FROM lbtablet_police_phone_unlocks WHERE phone_number = ?"
  L5_2 = {}
  L6_2 = A2_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L4_2 = L3_2.processing
    if true ~= L4_2 then
      L4_2 = L3_2.processing
      if 1 ~= L4_2 then
        goto lbl_42
      end
    end
    L4_2 = debugprint
    L5_2 = "Phone is already being unlocked"
    L4_2(L5_2)
    L4_2 = false
    do return L4_2 end
    ::lbl_42::
    L4_2 = L3_2.unlocked
    if true ~= L4_2 then
      L4_2 = L3_2.unlocked
      if 1 ~= L4_2 then
        goto lbl_53
      end
    end
    L4_2 = debugprint
    L5_2 = "Phone is already unlocked"
    L4_2(L5_2)
    L4_2 = false
    do return L4_2 end
    ::lbl_53::
    L4_2 = L3_2.attempts
    L5_2 = Config
    L5_2 = L5_2.Police
    L5_2 = L5_2.PhoneUnlock
    L5_2 = L5_2.Attempts
    if L4_2 >= L5_2 then
      L4_2 = debugprint
      L5_2 = "Phone unlock attempts exceeded"
      L4_2(L5_2)
      L4_2 = false
      return L4_2
    end
  end
  L4_2 = math
  L4_2 = L4_2.random
  L5_2 = Config
  L5_2 = L5_2.Police
  L5_2 = L5_2.PhoneUnlock
  L5_2 = L5_2.Time
  L5_2 = L5_2[1]
  L6_2 = Config
  L6_2 = L6_2.Police
  L6_2 = L6_2.PhoneUnlock
  L6_2 = L6_2.Time
  L6_2 = L6_2[2]
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = math
  L5_2 = L5_2.random
  L6_2 = 100
  L5_2 = L5_2(L6_2)
  L6_2 = Config
  L6_2 = L6_2.Police
  L6_2 = L6_2.PhoneUnlock
  L6_2 = L6_2.Chance
  L5_2 = L5_2 < L6_2
  L6_2 = MySQL
  L6_2 = L6_2.insert
  L6_2 = L6_2.await
  L7_2 = [[
        INSERT INTO lbtablet_police_phone_unlocks (phone_number, finished_at, unlocked, attempts)
            VALUES (?, NOW() + INTERVAL ? MINUTE, ?, 1)
        ON DUPLICATE KEY UPDATE
            finished_at = VALUES(finished_at), unlocked = VALUES(unlocked), attempts = attempts + 1
    ]]
  L8_2 = {}
  L9_2 = A2_2
  L10_2 = L4_2
  L11_2 = L5_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L6_2(L7_2, L8_2)
  L6_2 = {}
  L6_2.timeRemaining = L4_2
  L6_2.unlocked = L5_2
  return L6_2
end
L34_1(L35_1, L36_1)
L34_1 = L11_1
L35_1 = "resetPin"
function L36_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = L33_1
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = HasPhone
  L4_2 = A0_2
  L5_2 = A2_2
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L3_2 = debugprint
    L4_2 = "Player does not have the phone"
    L5_2 = A2_2
    L3_2(L4_2, L5_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = MySQL
  L3_2 = L3_2.scalar
  L3_2 = L3_2.await
  L4_2 = "SELECT unlocked FROM lbtablet_police_phone_unlocks WHERE phone_number = ? AND finished_at < NOW()"
  L5_2 = {}
  L6_2 = A2_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 or 0 == L3_2 then
    L4_2 = debugprint
    L5_2 = "Phone is not unlocked or is being unlocked"
    L4_2(L5_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = exports
  L4_2 = L4_2["lb-phone"]
  L5_2 = L4_2
  L4_2 = L4_2.ResetSecurity
  L6_2 = A2_2
  L4_2(L5_2, L6_2)
  L4_2 = true
  return L4_2
end
L34_1(L35_1, L36_1)
L34_1 = L11_1
L35_1 = "wiretapNumber"
function L36_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = Config
  L3_2 = L3_2.LBPhone
  if not L3_2 then
    L3_2 = debugprint
    L4_2 = "LBPhone is not enabled"
    L3_2(L4_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = Config
  L3_2 = L3_2.Police
  L3_2 = L3_2.Wiretapping
  if not L3_2 then
    L3_2 = debugprint
    L4_2 = "Wiretapping is not configured"
    L3_2(L4_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = IsPhoneNumberWiretapped
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = debugprint
    L4_2 = "Phone number is already wiretapped"
    L3_2(L4_2)
    L3_2 = true
    return L3_2
  end
  L3_2 = MySQL
  L3_2 = L3_2.scalar
  L3_2 = L3_2.await
  L4_2 = "SELECT 1 FROM phone_phones WHERE phone_number = ?"
  L5_2 = {}
  L6_2 = A2_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L3_2 = debugprint
    L4_2 = "Phone number does not exist"
    L5_2 = A2_2
    L3_2(L4_2, L5_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = CanWiretapNumber
  if L3_2 then
    L3_2 = CanWiretapNumber
    L4_2 = A0_2
    L5_2 = A2_2
    L3_2 = L3_2(L4_2, L5_2)
    if not L3_2 then
      L3_2 = debugprint
      L4_2 = "Player does not have permission to wiretap this number (CanWiretapNumber returned false)"
      L3_2(L4_2)
      L3_2 = false
      return L3_2
    end
  end
  L3_2 = AddWiretap
  L4_2 = A2_2
  L3_2(L4_2)
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = "INSERT IGNORE INTO lbtablet_police_wiretaps (phone_number, creator_tablet_id) VALUES (?, ?)"
  L5_2 = {}
  L6_2 = A2_2
  L7_2 = A1_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L3_2(L4_2, L5_2)
  L3_2 = MySQL
  L3_2 = L3_2.scalar
  L3_2 = L3_2.await
  L4_2 = "SELECT `name` FROM phone_phones WHERE phone_number = ?"
  L5_2 = {}
  L6_2 = A2_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = {}
  L4_2.phoneName = L3_2
  return L4_2
end
L37_1 = {}
L38_1 = {}
L39_1 = {}
L40_1 = "phone"
L41_1 = "createWiretap"
L39_1[1] = L40_1
L39_1[2] = L41_1
L38_1[1] = L39_1
L37_1.permissions = L38_1
L34_1(L35_1, L36_1, L37_1)
L34_1 = L11_1
L35_1 = "removeWiretap"
function L36_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = MySQL
  L3_2 = L3_2.scalar
  L3_2 = L3_2.await
  L4_2 = "SELECT creator_tablet_id FROM lbtablet_police_wiretaps WHERE phone_number = ?"
  L5_2 = {}
  L6_2 = A2_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L4_2 = debugprint
    L5_2 = "Phone number is not wiretapped"
    L6_2 = A2_2
    L4_2(L5_2, L6_2)
    L4_2 = false
    return L4_2
  end
  if L3_2 ~= A1_2 then
    L4_2 = HasPermission
    L5_2 = A0_2
    L6_2 = "Police"
    L7_2 = "phone"
    L8_2 = "removeWiretap"
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
    if not L4_2 then
      L4_2 = debugprint
      L5_2 = "Player does not have permission to remove wiretap"
      L4_2(L5_2)
      L4_2 = false
      return L4_2
    end
  end
  L4_2 = RemoveWiretap
  L5_2 = A2_2
  L4_2(L5_2)
  L4_2 = MySQL
  L4_2 = L4_2.update
  L4_2 = L4_2.await
  L5_2 = "DELETE FROM lbtablet_police_wiretaps WHERE phone_number = ?"
  L6_2 = {}
  L7_2 = A2_2
  L6_2[1] = L7_2
  L4_2(L5_2, L6_2)
  L4_2 = true
  return L4_2
end
L34_1(L35_1, L36_1)
L34_1 = L11_1
L35_1 = "toggleSubscribeWiretap"
function L36_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = Config
  L4_2 = L4_2.LBPhone
  if not L4_2 then
    L4_2 = debugprint
    L5_2 = "LBPhone is not enabled"
    L4_2(L5_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = Config
  L4_2 = L4_2.Police
  L4_2 = L4_2.Wiretapping
  if not L4_2 then
    L4_2 = debugprint
    L5_2 = "Wiretapping is not configured"
    L4_2(L5_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = IsPhoneNumberWiretapped
  L5_2 = A2_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = debugprint
    L5_2 = "Phone number is not wiretapped"
    L6_2 = A2_2
    L4_2(L5_2, L6_2)
    L4_2 = false
    return L4_2
  end
  if A3_2 then
    L4_2 = MySQL
    L4_2 = L4_2.update
    L4_2 = L4_2.await
    L5_2 = "INSERT IGNORE INTO lbtablet_police_wiretaps_subscribers (tablet_id, phone_number) VALUES (?, ?)"
    L6_2 = {}
    L7_2 = A1_2
    L8_2 = A2_2
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L4_2(L5_2, L6_2)
  else
    L4_2 = MySQL
    L4_2 = L4_2.update
    L4_2 = L4_2.await
    L5_2 = "DELETE FROM lbtablet_police_wiretaps_subscribers WHERE tablet_id = ? AND phone_number = ?"
    L6_2 = {}
    L7_2 = A1_2
    L8_2 = A2_2
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L4_2(L5_2, L6_2)
  end
  L4_2 = true
  return L4_2
end
L37_1 = {}
L38_1 = {}
L39_1 = {}
L40_1 = "phone"
L41_1 = "listenWiretap"
L39_1[1] = L40_1
L39_1[2] = L41_1
L38_1[1] = L39_1
L37_1.permissions = L38_1
L34_1(L35_1, L36_1, L37_1)
L34_1 = L11_1
L35_1 = "getWiretaps"
function L36_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  if not A2_2 then
    A2_2 = 0
  end
  L5_2 = {}
  L6_2 = A1_2
  L5_2[1] = L6_2
  L6_2 = {}
  if A3_2 and "" ~= A3_2 then
    L7_2 = #L6_2
    L7_2 = L7_2 + 1
    L6_2[L7_2] = "wiretap.phone_number LIKE ?"
    L7_2 = #L5_2
    L7_2 = L7_2 + 1
    L8_2 = "%"
    L9_2 = A3_2
    L10_2 = "%"
    L8_2 = L8_2 .. L9_2 .. L10_2
    L5_2[L7_2] = L8_2
  end
  if A4_2 then
    L7_2 = A4_2.subscribed
    if L7_2 then
      L7_2 = #L6_2
      L7_2 = L7_2 + 1
      L6_2[L7_2] = "subscribed.tablet_id = ?"
      L7_2 = #L5_2
      L7_2 = L7_2 + 1
      L5_2[L7_2] = A1_2
    end
  end
  if A4_2 then
    L7_2 = A4_2.createdByMe
    if L7_2 then
      L7_2 = #L6_2
      L7_2 = L7_2 + 1
      L6_2[L7_2] = "wiretap.creator_tablet_id = ?"
      L7_2 = #L5_2
      L7_2 = L7_2 + 1
      L5_2[L7_2] = A1_2
    end
  end
  L7_2 = [[
        SELECT
            wiretap.phone_number AS phoneNumber,
            phone.`name` AS phoneName,

            subscribed.tablet_id IS NOT NULL AS subscribed,

            wiretap.created_at AS createdAt,
            wiretap.creator_tablet_id AS createdBy,
            account.display_name AS author

        FROM
            lbtablet_police_wiretaps wiretap

        LEFT JOIN phone_phones phone ON phone.phone_number = wiretap.phone_number
        LEFT JOIN lbtablet_police_accounts account ON account.id = wiretap.creator_tablet_id
        LEFT JOIN lbtablet_police_wiretaps_subscribers subscribed ON subscribed.tablet_id = ? AND subscribed.phone_number = wiretap.phone_number

        {WHERE}

        ORDER BY wiretap.created_at DESC

        LIMIT ?, ?
    ]]
  L9_2 = L7_2
  L8_2 = L7_2.gsub
  L10_2 = "{WHERE}"
  L11_2 = #L6_2
  if L11_2 > 0 then
    L11_2 = "WHERE "
    L12_2 = table
    L12_2 = L12_2.concat
    L13_2 = L6_2
    L14_2 = " AND "
    L12_2 = L12_2(L13_2, L14_2)
    L11_2 = L11_2 .. L12_2
    if L11_2 then
      goto lbl_68
    end
  end
  L11_2 = ""
  ::lbl_68::
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  L7_2 = L8_2
  L8_2 = #L5_2
  L8_2 = L8_2 + 1
  L9_2 = A2_2 * 25
  L5_2[L8_2] = L9_2
  L8_2 = #L5_2
  L8_2 = L8_2 + 1
  L5_2[L8_2] = 25
  L8_2 = MySQL
  L8_2 = L8_2.query
  L8_2 = L8_2.await
  L9_2 = L7_2
  L10_2 = L5_2
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = 1
  L10_2 = #L8_2
  L11_2 = 1
  for L12_2 = L9_2, L10_2, L11_2 do
    L13_2 = L8_2[L12_2]
    L14_2 = GetWiretappedPhoneNumberCall
    L15_2 = L13_2.phoneNumber
    L14_2 = L14_2(L15_2)
    if L14_2 then
      L15_2 = exports
      L15_2 = L15_2["lb-phone"]
      L16_2 = L15_2
      L15_2 = L15_2.GetCall
      L17_2 = L14_2
      L15_2 = L15_2(L16_2, L17_2)
      if L15_2 then
        L16_2 = nil
        L17_2 = L15_2.caller
        L17_2 = L17_2.number
        L18_2 = L13_2.phoneNumber
        if L17_2 == L18_2 then
          L17_2 = L15_2.callee
          L17_2 = L17_2.number
          L16_2 = L17_2 or L16_2
          if not L17_2 then
            L16_2 = L15_2.company
          end
        else
          L17_2 = L15_2.caller
          L16_2 = L17_2.number
        end
        L17_2 = {}
        L17_2.inCallWith = L16_2
        L18_2 = os
        L18_2 = L18_2.time
        L18_2 = L18_2()
        L19_2 = L15_2.started
        L18_2 = L18_2 - L19_2
        L17_2.duration = L18_2
        L13_2.inCall = L17_2
      end
    end
  end
  return L8_2
end
L37_1 = {}
L38_1 = {}
L39_1 = {}
L40_1 = "phone"
L41_1 = "callHistory"
L39_1[1] = L40_1
L39_1[2] = L41_1
L38_1[1] = L39_1
L37_1.permissions = L38_1
L34_1(L35_1, L36_1, L37_1)
L34_1 = L11_1
L35_1 = "getCallHistory"
function L36_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = Config
  L5_2 = L5_2.LBPhone
  if not L5_2 then
    L5_2 = debugprint
    L6_2 = "LBPhone is not enabled"
    L5_2(L6_2)
    L5_2 = false
    return L5_2
  end
  L5_2 = IsPhoneNumberWiretapped
  L6_2 = A2_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = debugprint
    L6_2 = "Phone number is not wiretapped"
    L7_2 = A2_2
    L5_2(L6_2, L7_2)
    L5_2 = false
    return L5_2
  end
  if not A3_2 then
    A3_2 = 0
  end
  L5_2 = MySQL
  L5_2 = L5_2.scalar
  L5_2 = L5_2.await
  L6_2 = "SELECT created_at FROM lbtablet_police_wiretaps WHERE phone_number = ?"
  L7_2 = {}
  L8_2 = A2_2
  L7_2[1] = L8_2
  L5_2 = L5_2(L6_2, L7_2)
  if not L5_2 then
    L6_2 = debugprint
    L7_2 = "Wiretap created date not found for phone number"
    L8_2 = A2_2
    L6_2(L7_2, L8_2)
    L6_2 = false
    return L6_2
  end
  L6_2 = {}
  L7_2 = A2_2
  L8_2 = A2_2
  L9_2 = math
  L9_2 = L9_2.floor
  L10_2 = L5_2 / 1000
  L9_2, L10_2, L11_2 = L9_2(L10_2)
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L6_2[4] = L10_2
  L6_2[5] = L11_2
  L7_2 = "(caller = ? OR callee = ?) AND UNIX_TIMESTAMP(`timestamp`) >= ?"
  if A4_2 and "" ~= A4_2 then
    L8_2 = L7_2
    L9_2 = " AND (caller LIKE ? OR callee LIKE ?)"
    L8_2 = L8_2 .. L9_2
    L7_2 = L8_2
    L8_2 = #L6_2
    L8_2 = L8_2 + 1
    L9_2 = "%"
    L10_2 = A4_2
    L11_2 = "%"
    L9_2 = L9_2 .. L10_2 .. L11_2
    L6_2[L8_2] = L9_2
    L8_2 = #L6_2
    L8_2 = L8_2 + 1
    L9_2 = "%"
    L10_2 = A4_2
    L11_2 = "%"
    L9_2 = L9_2 .. L10_2 .. L11_2
    L6_2[L8_2] = L9_2
  end
  L8_2 = #L6_2
  L8_2 = L8_2 + 1
  L9_2 = A3_2 * 25
  L6_2[L8_2] = L9_2
  L8_2 = #L6_2
  L8_2 = L8_2 + 1
  L6_2[L8_2] = 25
  L8_2 = MySQL
  L8_2 = L8_2.query
  L8_2 = L8_2.await
  L9_2 = [[
        SELECT
            caller,
            callee,
            duration,
            answered,
            hide_caller_id AS hideCallerId,
            `timestamp`

        FROM phone_phone_calls

        WHERE
            ]]
  L10_2 = L7_2
  L11_2 = [[

        ORDER BY id DESC

        LIMIT ?, ?
    ]]
  L9_2 = L9_2 .. L10_2 .. L11_2
  L10_2 = L6_2
  return L8_2(L9_2, L10_2)
end
L37_1 = {}
L38_1 = {}
L39_1 = {}
L40_1 = "phone"
L41_1 = "callHistory"
L39_1[1] = L40_1
L39_1[2] = L41_1
L38_1[1] = L39_1
L37_1.permissions = L38_1
L34_1(L35_1, L36_1, L37_1)
L34_1 = L11_1
L35_1 = "listenToWiretap"
function L36_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = ListenToWiretappedCall
  L4_2 = A0_2
  L5_2 = A2_2
  return L3_2(L4_2, L5_2)
end
L37_1 = {}
L38_1 = {}
L39_1 = {}
L40_1 = "phone"
L41_1 = "listenWiretap"
L39_1[1] = L40_1
L39_1[2] = L41_1
L38_1[1] = L39_1
L37_1.permissions = L38_1
L34_1(L35_1, L36_1, L37_1)
L34_1 = L11_1
L35_1 = "stopListeningToWiretap"
function L36_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = StopListeningToWiretappedCall
  L3_2 = A0_2
  L2_2(L3_2)
  L2_2 = true
  return L2_2
end
L34_1(L35_1, L36_1)
L34_1 = L11_1
L35_1 = "getUnreadChats"
function L36_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = GetUndreadChatNotifications
  L3_2 = "police"
  L4_2 = A1_2
  return L2_2(L3_2, L4_2)
end
L34_1(L35_1, L36_1)
L34_1 = L11_1
L35_1 = "getPublicChatRooms"
function L36_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = GetPublicChatRooms
  L5_2 = "police"
  L6_2 = A1_2
  L7_2 = A2_2
  L8_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2)
end
L34_1(L35_1, L36_1)
L34_1 = L11_1
L35_1 = "getChatRooms"
function L36_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = GetChatRooms
  L5_2 = "police"
  L6_2 = A1_2
  L7_2 = A2_2
  L8_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2, L8_2)
end
L34_1(L35_1, L36_1)
L34_1 = L11_1
L35_1 = "createChat"
function L36_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = CreateChatRoom
  L5_2 = "police"
  L6_2 = A1_2
  L7_2 = A2_2
  L8_2 = A3_2
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if not A3_2 then
    L5_2 = Config
    L5_2 = L5_2.Police
    L5_2 = L5_2.Notifications
    L5_2 = L5_2.NewChat
    if L5_2 then
      L5_2 = L9_1
      L6_2 = {}
      L7_2 = L
      L8_2 = "BACKEND.POLICE.NEW_CHAT_CHANNEL_NOTIFICATION.TITLE"
      L7_2 = L7_2(L8_2)
      L6_2.title = L7_2
      L7_2 = L
      L8_2 = "BACKEND.POLICE.NEW_CHAT_CHANNEL_NOTIFICATION.CONTENT"
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
L37_1 = {}
L37_1.antiSpam = true
L38_1 = {}
L39_1 = {}
L40_1 = "chat"
L41_1 = "create"
L39_1[1] = L40_1
L39_1[2] = L41_1
L38_1[1] = L39_1
L37_1.permissions = L38_1
L34_1(L35_1, L36_1, L37_1)
L34_1 = L11_1
L35_1 = "toggleChatPrivate"
function L36_1(A0_2, A1_2, A2_2, A3_2)
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
    L7_2 = "Police"
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
L34_1(L35_1, L36_1)
L34_1 = L11_1
L35_1 = "setChatIcon"
function L36_1(A0_2, A1_2, A2_2, A3_2)
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
    L7_2 = "Police"
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
L34_1(L35_1, L36_1)
L34_1 = L11_1
L35_1 = "getChatMembers"
function L36_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = GetChatRoomMembers
  L4_2 = "police"
  L5_2 = A2_2
  return L3_2(L4_2, L5_2)
end
L34_1(L35_1, L36_1)
L34_1 = L11_1
L35_1 = "inviteToChat"
function L36_1(A0_2, A1_2, A2_2, A3_2)
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
    L7_2 = "Police"
    L8_2 = "chat"
    L9_2 = "invite"
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    if not L5_2 then
      L5_2 = false
      return L5_2
    end
  end
  L5_2 = AddToChatRoom
  L6_2 = "police"
  L7_2 = A2_2
  L8_2 = A3_2
  return L5_2(L6_2, L7_2, L8_2)
end
L34_1(L35_1, L36_1)
L34_1 = L11_1
L35_1 = "kickFromChat"
function L36_1(A0_2, A1_2, A2_2, A3_2)
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
    L7_2 = "Police"
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
L34_1(L35_1, L36_1)
L34_1 = L11_1
L35_1 = "joinChat"
function L36_1(A0_2, A1_2, A2_2)
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
L34_1(L35_1, L36_1)
L34_1 = L11_1
L35_1 = "leaveChat"
function L36_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = LeaveChatRoom
  L4_2 = A1_2
  L5_2 = A2_2
  return L3_2(L4_2, L5_2)
end
L34_1(L35_1, L36_1)
L34_1 = L11_1
L35_1 = "getChatMessages"
function L36_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2
  L4_2 = GetChatMessages
  L5_2 = "police"
  L6_2 = A2_2
  L7_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2)
end
L34_1(L35_1, L36_1)
L34_1 = L11_1
L35_1 = "sendMessage"
function L36_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L5_2 = SendChatMessage
  L6_2 = {}
  L6_2.id = A1_2
  L7_2 = L1_1
  L7_2 = L7_2[A1_2]
  if L7_2 then
    L7_2 = L7_2.name
  end
  if not L7_2 then
    L7_2 = ""
  end
  L6_2.name = L7_2
  L7_2 = L1_1
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
  L6_2 = L6_2.Police
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
      L9_2 = "BACKEND.POLICE.CHAT_MESSAGE_NOTIFICATION.TITLE"
      L10_2 = {}
      L11_2 = L6_2.label
      if not L11_2 then
        L11_2 = ""
      end
      L10_2.channel = L11_2
      L8_2 = L8_2(L9_2, L10_2)
      L7_2.title = L8_2
      L8_2 = L
      L9_2 = "BACKEND.POLICE.CHAT_MESSAGE_NOTIFICATION.CONTENT"
      L10_2 = {}
      L11_2 = A3_2 or L11_2
      if not A3_2 then
        L11_2 = "attachment"
      end
      L10_2.message = L11_2
      L8_2 = L8_2(L9_2, L10_2)
      L7_2.content = L8_2
      L7_2.app = "Police"
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
L37_1 = {}
L37_1.antiSpam = true
L34_1(L35_1, L36_1, L37_1)
L34_1 = L11_1
L35_1 = "clearChatNotifications"
function L36_1(A0_2, A1_2, A2_2)
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
L34_1(L35_1, L36_1)
L34_1 = AddEventHandler
L35_1 = "lb-tablet:jobUpdated"
function L36_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = GetEquippedTablet
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = Config
  L3_2 = L3_2.Police
  L3_2 = L3_2.Permissions
  L3_2 = L3_2[A1_2]
  if L3_2 then
    L3_2 = L32_1
    L4_2 = A0_2
    L5_2 = L2_2
    L3_2(L4_2, L5_2)
  else
    L3_2 = L1_1
    L3_2[L2_2] = nil
  end
end
L34_1(L35_1, L36_1)
L34_1 = OnTabletDisconnect
function L35_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = L1_1
  L2_2 = L2_2[A0_2]
  if L2_2 then
    L2_2 = L1_1
    L2_2[A0_2] = nil
    L2_2 = debugprint
    L3_2 = "Removed police user from cache"
    L4_2 = A0_2
    L5_2 = A1_2
    L2_2(L3_2, L4_2, L5_2)
  end
end
L34_1(L35_1)
