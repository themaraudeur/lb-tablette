local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = 0
L1_1 = 60
L2_1 = BaseCallback
L3_1 = "services:getCompanies"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = L0_1
  L3_2 = L1_1
  L2_2 = L2_2 + L3_2
  L3_2 = os
  L3_2 = L3_2.time
  L3_2 = L3_2()
  if L2_2 < L3_2 then
    L2_2 = RefreshCompanies
    if L2_2 then
      L2_2 = RefreshCompanies
      L2_2()
      L2_2 = os
      L2_2 = L2_2.time
      L2_2 = L2_2()
      L0_1 = L2_2
    end
  end
  L2_2 = Config
  L2_2 = L2_2.Services
  L2_2 = L2_2.Companies
  return L2_2
end
L2_1(L3_1, L4_1)
L2_1 = BaseCallback
L3_1 = "services:getEmployeeList"
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  L3_2 = Config
  L3_2 = L3_2.Services
  L3_2 = L3_2.SeeEmployees
  if L3_2 then
    L3_2 = Config
    L3_2 = L3_2.Services
    L3_2 = L3_2.SeeEmployees
    if "none" ~= L3_2 then
      L3_2 = GetEmployeeList
      if L3_2 then
        goto lbl_16
      end
    end
  end
  L3_2 = false
  do return L3_2 end
  ::lbl_16::
  L3_2 = Config
  L3_2 = L3_2.Services
  L3_2 = L3_2.SeeEmployees
  if "employees" == L3_2 then
    L3_2 = GetJob
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      L3_2 = L3_2.name
    end
    if L3_2 ~= A2_2 then
      L3_2 = false
      return L3_2
    end
  end
  L3_2 = GetEmployeeList
  L4_2 = A2_2
  return L3_2(L4_2)
end
L2_1(L3_1, L4_1)
L2_1 = BaseCallback
L3_1 = "services:getRecentMessages"
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if not A2_2 then
    A2_2 = 0
  end
  L3_2 = GetJob
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2.name
  L4_2 = MySQL
  L4_2 = L4_2.query
  L4_2 = L4_2.await
  L5_2 = [[
        SELECT
            id, phone_number AS `number`, company, last_message AS lastMessage, `timestamp`
        FROM
            phone_services_channels
        WHERE
            company = ?
            AND last_message IS NOT NULL
        ORDER BY
            `timestamp` DESC
        LIMIT
            ?, ?
    ]]
  L6_2 = {}
  L7_2 = L3_2
  L8_2 = A2_2 * 25
  L9_2 = 25
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  return L4_2(L5_2, L6_2)
end
L2_1(L3_1, L4_1)
L2_1 = BaseCallback
L3_1 = "services:getMessages"
function L4_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = {}
  L5_2 = A2_2
  L4_2[1] = L5_2
  if A3_2 then
    L5_2 = #L4_2
    L5_2 = L5_2 + 1
    L4_2[L5_2] = A3_2
  end
  L5_2 = MySQL
  L5_2 = L5_2.query
  L5_2 = L5_2.await
  L6_2 = [[
        SELECT
            id, sender, message AS content, x_pos, y_pos, `timestamp`
        FROM
            phone_services_messages
        WHERE
            channel_id = ?
            ]]
  if A3_2 then
    L7_2 = "AND id < ?"
    if L7_2 then
      goto lbl_21
    end
  end
  L7_2 = ""
  ::lbl_21::
  L8_2 = [[
        ORDER BY
            id DESC
        LIMIT
            25
    ]]
  L6_2 = L6_2 .. L7_2 .. L8_2
  L7_2 = L4_2
  return L5_2(L6_2, L7_2)
end
L2_1(L3_1, L4_1)
