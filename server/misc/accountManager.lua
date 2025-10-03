local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = {}
L1_1 = {}
L1_1.mail = true
function L2_1(A0_2)
  local L1_2
  L1_2 = L1_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L1_2 = false
  end
  return L1_2
end
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = {}
  L2_2.active = false
  L3_2 = {}
  L2_2.accounts = L3_2
  L3_2 = MySQL
  L3_2 = L3_2.query
  L3_2 = L3_2.await
  L4_2 = "SELECT `account`, `active` FROM lbtablet_apps_loggedin WHERE tablet_id = ? AND `app` = ?"
  L5_2 = {}
  L6_2 = A0_2
  L7_2 = A1_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = 1
  L5_2 = #L3_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = L3_2[L7_2]
    L9_2 = L8_2.active
    if L9_2 then
      L9_2 = L8_2.account
      L2_2.active = L9_2
    end
    L9_2 = L2_2.accounts
    L10_2 = L2_2.accounts
    L10_2 = #L10_2
    L10_2 = L10_2 + 1
    L11_2 = L8_2.account
    L9_2[L10_2] = L11_2
  end
  L4_2 = L0_1
  L5_2 = L0_1
  L5_2 = L5_2[A0_2]
  if not L5_2 then
    L5_2 = {}
  end
  L4_2[A0_2] = L5_2
  L4_2 = L0_1
  L4_2 = L4_2[A0_2]
  L4_2[A1_2] = L2_2
  L4_2 = debugprint
  L5_2 = "Fetched logged in accounts for tablet %s and app %s"
  L6_2 = L5_2
  L5_2 = L5_2.format
  L7_2 = A0_2
  L8_2 = A1_2
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = L2_2
  L4_2(L5_2, L6_2)
  return L2_2
end
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = L2_1
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = L0_1
  L2_2 = L2_2[A0_2]
  if L2_2 then
    L2_2 = L2_2[A1_2]
  end
  if L2_2 then
    L2_2 = L2_2.active
  end
  if nil ~= L2_2 then
    return L2_2
  end
  L3_2 = L3_1
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2)
  L3_2 = L3_2.active
  return L3_2
end
GetActiveAccount = L4_1
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L2_1
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = {}
    return L2_2
  end
  L2_2 = L0_1
  L2_2 = L2_2[A0_2]
  if L2_2 then
    L2_2 = L2_2[A1_2]
  end
  if L2_2 then
    L2_2 = L2_2.accounts
  end
  if not L2_2 then
    L2_2 = L3_1
    L3_2 = A0_2
    L4_2 = A1_2
    L2_2 = L2_2(L3_2, L4_2)
    L2_2 = L2_2.accounts
  end
  return L2_2
end
GetSignedInAccounts = L4_1
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = L2_1
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  if L3_2 then
    L3_2 = L3_2[A1_2]
  end
  if L3_2 then
    L3_2 = L3_2.accounts
  end
  if not L3_2 then
    L3_2 = {}
  end
  L4_2 = 1
  L5_2 = #A2_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = L3_2[L7_2]
    if L8_2 == A2_2 then
      L8_2 = debugprint
      L9_2 = "Account already signed in"
      L10_2 = A2_2
      L8_2(L9_2, L10_2)
      L8_2 = true
      return L8_2
    end
  end
  L4_2 = MySQL
  L4_2 = L4_2.query
  L4_2 = L4_2.await
  L5_2 = "INSERT INTO lbtablet_apps_loggedin (tablet_id, app, `account`) VALUES (?, ?, ?)"
  L6_2 = {}
  L7_2 = A0_2
  L8_2 = A1_2
  L9_2 = A2_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L4_2(L5_2, L6_2)
  L4_2 = L3_1
  L5_2 = A0_2
  L6_2 = A1_2
  L4_2(L5_2, L6_2)
  L4_2 = true
  return L4_2
end
AddSignedInAccount = L4_1
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L3_2 = L2_1
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = GetSignedInAccounts
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = L0_1
  L4_2 = L4_2[A0_2]
  L4_2 = L4_2[A1_2]
  L4_2 = L4_2.active
  L5_2 = false
  if not A2_2 then
    if not L4_2 then
      L6_2 = false
      return L6_2
    end
    L6_2 = 1
    L7_2 = #L3_2
    L8_2 = 1
    for L9_2 = L6_2, L7_2, L8_2 do
      L10_2 = L3_2[L9_2]
      if L10_2 == L4_2 then
        L10_2 = table
        L10_2 = L10_2.remove
        L11_2 = L3_2
        L12_2 = L9_2
        L10_2(L11_2, L12_2)
        break
      end
    end
    L6_2 = MySQL
    L6_2 = L6_2.update
    L6_2 = L6_2.await
    L7_2 = "DELETE FROM lbtablet_apps_loggedin WHERE tablet_id = ? AND `app`= ? AND `account`= ?"
    L8_2 = {}
    L9_2 = A0_2
    L10_2 = A1_2
    L11_2 = L4_2
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L8_2[3] = L11_2
    L6_2(L7_2, L8_2)
    L6_2 = L0_1
    L6_2 = L6_2[A0_2]
    L6_2 = L6_2[A1_2]
    L6_2.active = false
    L6_2 = debugprint
    L7_2 = GetSignedInAccounts
    L8_2 = A0_2
    L9_2 = A1_2
    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L7_2(L8_2, L9_2)
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
    L6_2 = true
    return L6_2
  end
  L6_2 = 1
  L7_2 = #L3_2
  L8_2 = 1
  for L9_2 = L6_2, L7_2, L8_2 do
    L10_2 = L3_2[L9_2]
    if L10_2 == A2_2 then
      L5_2 = true
      break
    end
  end
  if not L5_2 then
    L6_2 = false
    return L6_2
  end
  L6_2 = MySQL
  L6_2 = L6_2.transaction
  L6_2 = L6_2.await
  L7_2 = {}
  L8_2 = {}
  L9_2 = "UPDATE lbtablet_apps_loggedin SET `active` = 0 WHERE tablet_id = ? AND app = ?"
  L10_2 = {}
  L11_2 = A0_2
  L12_2 = A1_2
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L9_2 = {}
  L10_2 = "UPDATE lbtablet_apps_loggedin SET `active` = 1 WHERE tablet_id = ? AND app = ? AND `account` = ?"
  L11_2 = {}
  L12_2 = A0_2
  L13_2 = A1_2
  L14_2 = A2_2
  L11_2[1] = L12_2
  L11_2[2] = L13_2
  L11_2[3] = L14_2
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L6_2 = false
    return L6_2
  end
  L6_2 = debugprint
  L7_2 = "Set active account for tablet %s and app %s to %s"
  L8_2 = L7_2
  L7_2 = L7_2.format
  L9_2 = A0_2
  L10_2 = A1_2
  L11_2 = A2_2
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  L6_2 = L0_1
  L6_2 = L6_2[A0_2]
  L6_2 = L6_2[A1_2]
  L6_2.active = A2_2
  L6_2 = true
  return L6_2
end
SetActiveAccount = L4_1
L4_1 = BaseCallback
L5_1 = "accountManager:switch"
function L6_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2
  L4_2 = L2_1
  L5_2 = A2_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = SetActiveAccount
  L5_2 = A1_2
  L6_2 = A2_2
  L7_2 = A3_2
  return L4_2(L5_2, L6_2, L7_2)
end
L4_1(L5_1, L6_1)
L4_1 = BaseCallback
L5_1 = "accountManager:getAccounts"
function L6_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = L2_1
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = GetSignedInAccounts
  L4_2 = A1_2
  L5_2 = A2_2
  return L3_2(L4_2, L5_2)
end
L4_1(L5_1, L6_1)
L4_1 = OnTabletDisconnect
function L5_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L0_1
  L1_2 = L1_2[A0_2]
  if L1_2 then
    L1_2 = debugprint
    L2_2 = "Removing logged in accounts for tablet "
    L3_2 = A0_2
    L2_2 = L2_2 .. L3_2
    L1_2(L2_2)
    L1_2 = L0_1
    L1_2[A0_2] = nil
  end
end
L4_1(L5_1)
