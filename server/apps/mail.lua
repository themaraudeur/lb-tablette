local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = BaseCallback
  L4_2 = "mail:"
  L5_2 = A0_2
  L4_2 = L4_2 .. L5_2
  function L5_2(A0_3, A1_3, ...)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L2_3 = GetActiveAccount
    L3_3 = A1_3
    L4_3 = "mail"
    L2_3 = L2_3(L3_3, L4_3)
    if not L2_3 then
      L3_3 = A2_2
      return L3_3
    end
    L3_3 = A1_2
    L4_3 = A0_3
    L5_3 = A1_3
    L6_3 = L2_3
    L7_3 = ...
    return L3_3(L4_3, L5_3, L6_3, L7_3)
  end
  L6_2 = A2_2
  L3_2(L4_2, L5_2, L6_2)
end
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = MySQL
  L1_2 = L1_2.query
  L1_2 = L1_2.await
  L2_2 = "SELECT phone_number FROM phone_logged_in_accounts WHERE app = 'Mail' AND username = ?"
  L3_2 = {}
  L4_2 = A0_2.to
  L3_2[1] = L4_2
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = 1
  L3_2 = #L1_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = L1_2[L5_2]
    L6_2 = L6_2.phone_number
    L7_2 = exports
    L7_2 = L7_2["lb-phone"]
    L8_2 = L7_2
    L7_2 = L7_2.GetSourceFromNumber
    L9_2 = L6_2
    L7_2 = L7_2(L8_2, L9_2)
    if L7_2 then
      L8_2 = TriggerClientEvent
      L9_2 = "phone:mail:newMail"
      L10_2 = L7_2
      L11_2 = A0_2
      L8_2(L9_2, L10_2, L11_2)
    end
    L8_2 = exports
    L8_2 = L8_2["lb-phone"]
    L9_2 = L8_2
    L8_2 = L8_2.SendNotification
    L10_2 = L6_2
    L11_2 = {}
    L11_2.app = "Mail"
    L12_2 = A0_2.sender
    L11_2.title = L12_2
    L12_2 = A0_2.subject
    L11_2.content = L12_2
    L12_2 = A0_2.attachments
    if L12_2 then
      L12_2 = A0_2.attachments
      L12_2 = L12_2[1]
    end
    L11_2.thumbnail = L12_2
    L8_2(L9_2, L10_2, L11_2)
  end
end
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = {}
  L1_2.app = "Mail"
  L2_2 = A0_2.sender
  L1_2.title = L2_2
  L2_2 = A0_2.subject
  L1_2.content = L2_2
  L2_2 = A0_2.attachments
  if L2_2 then
    L2_2 = A0_2.attachments
    L2_2 = L2_2[1]
  end
  L1_2.thumbnail = L2_2
  L2_2 = A0_2.to
  if "all" == L2_2 then
    L2_2 = NotifyEveryone
    L3_2 = L1_2
    L2_2(L3_2)
    L2_2 = TriggerClientEvent
    L3_2 = "tablet:mail:newMail"
    L4_2 = -1
    L5_2 = A0_2
    L2_2(L3_2, L4_2, L5_2)
    L2_2 = TriggerClientEvent
    L3_2 = "phone:mail:newMail"
    L4_2 = -1
    L5_2 = A0_2
    L2_2(L3_2, L4_2, L5_2)
    return
  end
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "SELECT `tablet_id` FROM lbtablet_apps_loggedin WHERE `app` = 'mail' AND `account` = ? AND `active` = 1"
  L4_2 = {}
  L5_2 = A0_2.to
  L4_2[1] = L5_2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = {}
  L4_2 = 1
  L5_2 = #L2_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = #L3_2
    L8_2 = L8_2 + 1
    L9_2 = L2_2[L7_2]
    L9_2 = L9_2.tablet_id
    L3_2[L8_2] = L9_2
  end
  L4_2 = NotifyTablets
  L5_2 = L3_2
  L6_2 = L1_2
  L4_2(L5_2, L6_2)
end
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = assert
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L2_2 = "table" == L2_2
  L3_2 = "Invalid argument #1 (table expected, got "
  L4_2 = type
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L5_2 = ")"
  L3_2 = L3_2 .. L4_2 .. L5_2
  L1_2(L2_2, L3_2)
  L1_2 = assert
  L2_2 = type
  L3_2 = A0_2.to
  L2_2 = L2_2(L3_2)
  L2_2 = "string" == L2_2
  L3_2 = "Invalid field to: string expected, got "
  L4_2 = type
  L5_2 = A0_2.to
  L4_2 = L4_2(L5_2)
  L3_2 = L3_2 .. L4_2
  L1_2(L2_2, L3_2)
  L1_2 = assert
  L2_2 = type
  L3_2 = A0_2.sender
  L2_2 = L2_2(L3_2)
  L2_2 = "string" == L2_2
  L3_2 = "Invalid field sender: string expected, got "
  L4_2 = type
  L5_2 = A0_2.sender
  L4_2 = L4_2(L5_2)
  L3_2 = L3_2 .. L4_2
  L1_2(L2_2, L3_2)
  L1_2 = assert
  L2_2 = type
  L3_2 = A0_2.subject
  L2_2 = L2_2(L3_2)
  L2_2 = "string" == L2_2
  L3_2 = "Invalid field subject: string expected, got "
  L4_2 = type
  L5_2 = A0_2.subject
  L4_2 = L4_2(L5_2)
  L3_2 = L3_2 .. L4_2
  L1_2(L2_2, L3_2)
  L1_2 = assert
  L2_2 = type
  L3_2 = A0_2.message
  L2_2 = L2_2(L3_2)
  L2_2 = "string" == L2_2
  L3_2 = "Invalid field message: string expected, got "
  L4_2 = type
  L5_2 = A0_2.message
  L4_2 = L4_2(L5_2)
  L3_2 = L3_2 .. L4_2
  L1_2(L2_2, L3_2)
  L1_2 = A0_2.to
  if "all" ~= L1_2 then
    L1_2 = MySQL
    L1_2 = L1_2.scalar
    L1_2 = L1_2.await
    L2_2 = "SELECT 1 FROM phone_mail_accounts WHERE address = ?"
    L3_2 = {}
    L4_2 = A0_2.to
    L3_2[1] = L4_2
    L1_2 = L1_2(L2_2, L3_2)
    if not L1_2 then
      L1_2 = false
      L2_2 = "INVALID_ADDRESS"
      return L1_2, L2_2
    end
  end
  L1_2 = A0_2.attachments
  if not L1_2 then
    L1_2 = {}
  end
  A0_2.attachments = L1_2
  L1_2 = A0_2.actions
  if not L1_2 then
    L1_2 = {}
  end
  A0_2.actions = L1_2
  L1_2 = A0_2.attachments
  L1_2 = #L1_2
  if L1_2 > 0 then
    L1_2 = json
    L1_2 = L1_2.encode
    L2_2 = A0_2.attachments
    L1_2 = L1_2(L2_2)
    if L1_2 then
      goto lbl_112
    end
  end
  L1_2 = nil
  ::lbl_112::
  L2_2 = A0_2.actions
  L2_2 = #L2_2
  if L2_2 > 0 then
    L2_2 = json
    L2_2 = L2_2.encode
    L3_2 = A0_2.actions
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_123
    end
  end
  L2_2 = nil
  ::lbl_123::
  L3_2 = MySQL
  L3_2 = L3_2.insert
  L3_2 = L3_2.await
  L4_2 = "INSERT INTO phone_mail_messages (recipient, sender, `subject`, content, attachments, actions) VALUE (?, ?, ?, ?, ?, ?)"
  L5_2 = {}
  L6_2 = A0_2.to
  L7_2 = A0_2.sender
  L8_2 = A0_2.subject
  L9_2 = A0_2.message
  L10_2 = L1_2
  L11_2 = L2_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L5_2[4] = L9_2
  L5_2[5] = L10_2
  L5_2[6] = L11_2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = Citizen
  L4_2 = L4_2.CreateThreadNow
  function L5_2()
    local L0_3, L1_3, L2_3
    L0_3 = A0_2
    L1_3 = L3_2
    L0_3.id = L1_3
    L1_3 = os
    L1_3 = L1_3.time
    L1_3 = L1_3()
    L1_3 = L1_3 * 1000
    L0_3.timestamp = L1_3
    L1_3 = L2_1
    L2_3 = L0_3
    L1_3(L2_3)
    L1_3 = Config
    L1_3 = L1_3.LBPhone
    if L1_3 then
      L1_3 = L1_1
      L2_3 = L0_3
      L1_3(L2_3)
    end
  end
  L4_2(L5_2)
  L4_2 = true
  L5_2 = L3_2
  return L4_2, L5_2
end
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if A0_2 and A1_2 then
    L3_2 = #A0_2
    if not (L3_2 < 3) then
      L3_2 = #A1_2
      if not (L3_2 < 3) then
        goto lbl_14
      end
    end
  end
  L3_2 = false
  L4_2 = "Invalid address / password"
  do return L3_2, L4_2 end
  ::lbl_14::
  L4_2 = A0_2
  L3_2 = A0_2.find
  L5_2 = "@"
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L3_2 = A0_2
    L4_2 = "@"
    L5_2 = Config
    L5_2 = L5_2.EmailDomain
    L3_2 = L3_2 .. L4_2 .. L5_2
    A0_2 = L3_2
  end
  L4_2 = A0_2
  L3_2 = A0_2.lower
  L3_2 = L3_2(L4_2)
  A0_2 = L3_2
  L3_2 = GetPasswordHash
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  A1_2 = L3_2
  L3_2 = MySQL
  L3_2 = L3_2.scalar
  L3_2 = L3_2.await
  L4_2 = "SELECT 1 FROM phone_mail_accounts WHERE address=?"
  L5_2 = {}
  L6_2 = A0_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L4_2 = false
    L5_2 = "Address already exists"
    return L4_2, L5_2
  end
  L4_2 = MySQL
  L4_2 = L4_2.update
  L4_2 = L4_2.await
  L5_2 = "INSERT INTO phone_mail_accounts (address, `password`) VALUES (?, ?)"
  L6_2 = {}
  L7_2 = A0_2
  L8_2 = A1_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L4_2 = L4_2(L5_2, L6_2)
  L4_2 = 1 == L4_2
  if not L4_2 then
    L5_2 = false
    L6_2 = "Failed to create account"
    return L5_2, L6_2
  end
  L5_2 = debugprint
  L6_2 = "Created email account"
  L7_2 = A0_2
  L5_2(L6_2, L7_2)
  if A2_2 then
    L5_2 = AddSignedInAccount
    L6_2 = A2_2
    L7_2 = "mail"
    L8_2 = A0_2
    L5_2 = L5_2(L6_2, L7_2, L8_2)
    if L5_2 then
      L5_2 = SetActiveAccount
      L6_2 = A2_2
      L7_2 = "mail"
      L8_2 = A0_2
      L5_2(L6_2, L7_2, L8_2)
    end
  end
  L5_2 = true
  return L5_2
end
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L2_2 = Config
  L2_2 = L2_2.AutoCreateEmail
  if not L2_2 or not A1_2 then
    return
  end
  L2_2 = Config
  L2_2 = L2_2.LBPhone
  if L2_2 then
    L2_2 = exports
    L2_2 = L2_2["lb-phone"]
    L3_2 = L2_2
    L2_2 = L2_2.GetEquippedPhoneNumber
    L4_2 = A0_2
    L2_2 = L2_2(L3_2, L4_2)
    L3_2 = L2_2 or L3_2
    if L2_2 then
      L3_2 = MySQL
      L3_2 = L3_2.scalar
      L3_2 = L3_2.await
      L4_2 = "SELECT 1 FROM phone_logged_in_accounts WHERE app = 'Mail' AND phone_number = ?"
      L5_2 = {}
      L6_2 = L2_2
      L5_2[1] = L6_2
      L3_2 = L3_2(L4_2, L5_2)
    end
    if L3_2 then
      L4_2 = debugprint
      L5_2 = "Email account already exists for "
      L6_2 = GetPlayerName
      L7_2 = A0_2
      L6_2 = L6_2(L7_2)
      L5_2 = L5_2 .. L6_2
      return L4_2(L5_2)
    end
  end
  L2_2 = GetCharacterName
  L3_2 = A0_2
  L2_2, L3_2 = L2_2(L3_2)
  L5_2 = L2_2
  L4_2 = L2_2.gsub
  L6_2 = "[^%w]"
  L7_2 = ""
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L2_2 = L4_2
  L5_2 = L3_2
  L4_2 = L3_2.gsub
  L6_2 = "[^%w]"
  L7_2 = ""
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L3_2 = L4_2
  L4_2 = #L2_2
  if 0 == L4_2 then
    L4_2 = GenerateString
    L5_2 = 5
    L4_2 = L4_2(L5_2)
    L2_2 = L4_2
  end
  L4_2 = #L3_2
  if 0 == L4_2 then
    L4_2 = GenerateString
    L5_2 = 5
    L4_2 = L4_2(L5_2)
    L3_2 = L4_2
  end
  L4_2 = L2_2
  L5_2 = "."
  L6_2 = L3_2
  L4_2 = L4_2 .. L5_2 .. L6_2
  L5_2 = MySQL
  L5_2 = L5_2.scalar
  L5_2 = L5_2.await
  L6_2 = "SELECT COUNT(1) FROM phone_mail_accounts WHERE address LIKE ?"
  L7_2 = {}
  L8_2 = L4_2
  L9_2 = "%"
  L8_2 = L8_2 .. L9_2
  L7_2[1] = L8_2
  L5_2 = L5_2(L6_2, L7_2)
  if not L5_2 then
    L5_2 = 0
  end
  if L5_2 > 0 then
    L6_2 = L4_2
    L7_2 = L5_2 + 1
    L6_2 = L6_2 .. L7_2
    L4_2 = L6_2
  end
  L6_2 = L4_2
  L7_2 = "@"
  L8_2 = Config
  L8_2 = L8_2.EmailDomain
  L6_2 = L6_2 .. L7_2 .. L8_2
  L7_2 = MySQL
  L7_2 = L7_2.scalar
  L7_2 = L7_2.await
  L8_2 = "SELECT 1 FROM phone_mail_accounts WHERE address=?"
  L9_2 = {}
  L10_2 = L6_2
  L9_2[1] = L10_2
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = 0
  while L7_2 and L8_2 < 50 do
    L9_2 = L2_2
    L10_2 = "."
    L11_2 = L3_2
    L12_2 = math
    L12_2 = L12_2.random
    L13_2 = 1000
    L14_2 = 9999
    L12_2 = L12_2(L13_2, L14_2)
    L13_2 = "@"
    L14_2 = Config
    L14_2 = L14_2.EmailDomain
    L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2
    L6_2 = L9_2
    L9_2 = MySQL
    L9_2 = L9_2.scalar
    L9_2 = L9_2.await
    L10_2 = "SELECT 1 FROM phone_mail_accounts WHERE address=?"
    L11_2 = {}
    L12_2 = L6_2
    L11_2[1] = L12_2
    L9_2 = L9_2(L10_2, L11_2)
    L7_2 = L9_2
    L8_2 = L8_2 + 1
    L9_2 = Wait
    L10_2 = 0
    L9_2(L10_2)
  end
  if L7_2 then
    L9_2 = infoprint
    L10_2 = "warning"
    L11_2 = "Failed to generate email address for "
    L12_2 = GetPlayerName
    L13_2 = A0_2
    L12_2 = L12_2(L13_2)
    L11_2 = L11_2 .. L12_2
    L9_2(L10_2, L11_2)
    return
  end
  L10_2 = L6_2
  L9_2 = L6_2.lower
  L9_2 = L9_2(L10_2)
  L6_2 = L9_2
  L9_2 = GenerateString
  L10_2 = 5
  L9_2 = L9_2(L10_2)
  L10_2 = L9_2
  L9_2 = L9_2.lower
  L9_2 = L9_2(L10_2)
  L10_2 = L4_1
  L11_2 = L6_2
  L12_2 = L9_2
  L13_2 = A1_2
  L10_2 = L10_2(L11_2, L12_2, L13_2)
  if not L10_2 then
    return
  end
  L11_2 = L3_1
  L12_2 = {}
  L12_2.to = L6_2
  L13_2 = L
  L14_2 = "BACKEND.MAIL.AUTOMATIC_PASSWORD.SENDER"
  L13_2 = L13_2(L14_2)
  L12_2.sender = L13_2
  L13_2 = L
  L14_2 = "BACKEND.MAIL.AUTOMATIC_PASSWORD.SUBJECT"
  L13_2 = L13_2(L14_2)
  L12_2.subject = L13_2
  L13_2 = L
  L14_2 = "BACKEND.MAIL.AUTOMATIC_PASSWORD.MESSAGE"
  L15_2 = {}
  L15_2.address = L6_2
  L15_2.password = L9_2
  L13_2 = L13_2(L14_2, L15_2)
  L12_2.message = L13_2
  L11_2(L12_2)
end
GenerateEmailAccount = L5_1
L5_1 = BaseCallback
L6_1 = "mail:isLoggedIn"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = GetActiveAccount
  L3_2 = A1_2
  L4_2 = "mail"
  return L2_2(L3_2, L4_2)
end
L5_1(L6_1, L7_1)
L5_1 = BaseCallback
L6_1 = "mail:createMail"
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2
  if not A2_2 or not A3_2 then
    L4_2 = {}
    L4_2.success = false
    L4_2.reason = "Invalid address / password"
    return L4_2
  end
  L4_2 = A2_2
  L5_2 = "@"
  L6_2 = Config
  L6_2 = L6_2.EmailDomain
  L4_2 = L4_2 .. L5_2 .. L6_2
  A2_2 = L4_2
  L4_2 = L4_1
  L5_2 = A2_2
  L6_2 = A3_2
  L7_2 = A1_2
  L4_2, L5_2 = L4_2(L5_2, L6_2, L7_2)
  if L4_2 then
    L6_2 = {}
    L6_2.success = true
    return L6_2
  end
  L6_2 = {}
  L6_2.success = false
  L6_2.reason = L5_2
  return L6_2
end
L5_1(L6_1, L7_1)
L5_1 = BaseCallback
L6_1 = "mail:logout"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = SetActiveAccount
  L3_2 = A1_2
  L4_2 = "mail"
  L2_2(L3_2, L4_2)
  L2_2 = {}
  L2_2.success = true
  return L2_2
end
L5_1(L6_1, L7_1)
L5_1 = BaseCallback
L6_1 = "mail:login"
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  if not A2_2 or not A3_2 then
    L4_2 = {}
    L4_2.success = false
    L4_2.reason = "Invalid address / password"
    return L4_2
  end
  L5_2 = A2_2
  L4_2 = A2_2.find
  L6_2 = "@"
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L4_2 = A2_2
    L5_2 = "@"
    L6_2 = Config
    L6_2 = L6_2.EmailDomain
    L4_2 = L4_2 .. L5_2 .. L6_2
    A2_2 = L4_2
  end
  L4_2 = MySQL
  L4_2 = L4_2.scalar
  L4_2 = L4_2.await
  L5_2 = "SELECT `password` FROM phone_mail_accounts WHERE address=?"
  L6_2 = {}
  L7_2 = A2_2
  L6_2[1] = L7_2
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 then
    L5_2 = VerifyPasswordHash
    L6_2 = A3_2
    L7_2 = L4_2
    L5_2 = L5_2(L6_2, L7_2)
    if L5_2 then
      goto lbl_43
    end
  end
  L5_2 = {}
  L5_2.success = false
  L5_2.reason = "Incorrect address / password"
  do return L5_2 end
  ::lbl_43::
  L5_2 = AddSignedInAccount
  L6_2 = A1_2
  L7_2 = "mail"
  L8_2 = A2_2
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  if L5_2 then
    L5_2 = SetActiveAccount
    L6_2 = A1_2
    L7_2 = "mail"
    L8_2 = A2_2
    L5_2(L6_2, L7_2, L8_2)
    L5_2 = {}
    L5_2.success = true
    return L5_2
  end
end
L5_1(L6_1, L7_1)
L5_1 = L0_1
L6_1 = "sendMail"
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L4_2 = A3_2
  if L4_2 then
    L4_2 = L4_2.to
  end
  L5_2 = A3_2
  if L5_2 then
    L5_2 = L5_2.subject
  end
  L6_2 = A3_2
  if L6_2 then
    L6_2 = L6_2.message
  end
  L7_2 = A3_2
  if L7_2 then
    L7_2 = L7_2.attachments
  end
  if not (L4_2 and L5_2) or not L6_2 then
    L8_2 = debugprint
    L9_2 = "Invalid to, subject or message"
    L8_2(L9_2)
    L8_2 = false
    return L8_2
  end
  L8_2 = L3_1
  L9_2 = {}
  L9_2.to = L4_2
  L9_2.sender = A2_2
  L9_2.subject = L5_2
  L9_2.message = L6_2
  L9_2.attachments = L7_2
  L8_2, L9_2 = L8_2(L9_2)
  L10_2 = debugprint
  L11_2 = "Mail sent"
  L12_2 = L8_2
  L13_2 = L9_2
  L10_2(L11_2, L12_2, L13_2)
  L10_2 = L8_2 or L10_2
  if L8_2 then
    L10_2 = L9_2
  end
  return L10_2
end
L5_1(L6_1, L7_1)
L5_1 = L0_1
L6_1 = "getMails"
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = {}
  L5_2 = A2_2
  L6_2 = A2_2
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  if A3_2 then
    L5_2 = #L4_2
    L5_2 = L5_2 + 1
    L4_2[L5_2] = A3_2
  end
  L5_2 = MySQL
  L5_2 = L5_2.query
  L5_2 = L5_2.await
  L6_2 = [[
        SELECT id, recipient AS `to`, sender, `subject`, LEFT(content, 70) AS message, `read`, `timestamp`
        FROM phone_mail_messages
        WHERE (recipient = ? OR recipient = 'all' OR sender = ?) ]]
  if A3_2 then
    L7_2 = "AND id < ?"
    if L7_2 then
      goto lbl_22
    end
  end
  L7_2 = ""
  ::lbl_22::
  L8_2 = [[

        ORDER BY id DESC

        LIMIT 10
    ]]
  L6_2 = L6_2 .. L7_2 .. L8_2
  L7_2 = L4_2
  return L5_2(L6_2, L7_2)
end
L5_1(L6_1, L7_1)
L5_1 = L0_1
L6_1 = "getMail"
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = MySQL
  L4_2 = L4_2.single
  L4_2 = L4_2.await
  L5_2 = [[
        SELECT id, recipient AS `to`, sender, `subject`, content AS message, attachments, actions, `read`, `timestamp`
        FROM phone_mail_messages
        WHERE id = ? AND (recipient = ? OR recipient = 'all' OR sender = ?)
    ]]
  L6_2 = {}
  L7_2 = A3_2
  L8_2 = A2_2
  L9_2 = A2_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 then
    L5_2 = L4_2.read
    if not L5_2 then
      L5_2 = L4_2.sender
      if L5_2 ~= A2_2 then
        L5_2 = MySQL
        L5_2 = L5_2.update
        L6_2 = "UPDATE phone_mail_messages SET `read`=1 WHERE id=?"
        L7_2 = {}
        L8_2 = A3_2
        L7_2[1] = L8_2
        L5_2(L6_2, L7_2)
      end
    end
  end
  return L4_2
end
L5_1(L6_1, L7_1)
L5_1 = L0_1
L6_1 = "search"
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L5_2 = "%"
  L6_2 = A3_2
  L7_2 = "%"
  L5_2 = L5_2 .. L6_2 .. L7_2
  L6_2 = {}
  L7_2 = A2_2
  L8_2 = A2_2
  L9_2 = L5_2
  L10_2 = L5_2
  L11_2 = L5_2
  L12_2 = L5_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L6_2[4] = L10_2
  L6_2[5] = L11_2
  L6_2[6] = L12_2
  if A4_2 then
    L7_2 = #L6_2
    L7_2 = L7_2 + 1
    L6_2[L7_2] = A4_2
  end
  L7_2 = MySQL
  L7_2 = L7_2.query
  L7_2 = L7_2.await
  L8_2 = [[
        SELECT id, recipient AS `to`, sender, `subject`, LEFT(content, 70) AS message, `read`, `timestamp`
        FROM phone_mail_messages
        WHERE (
            recipient = ? OR recipient = 'all' OR sender = ?
        ) AND (
            recipient LIKE ? OR sender LIKE ? OR `subject` LIKE ? OR content LIKE ?
        ) ]]
  if A4_2 then
    L9_2 = "AND id < ?"
    if L9_2 then
      goto lbl_30
    end
  end
  L9_2 = ""
  ::lbl_30::
  L10_2 = [[

        ORDER BY id DESC

        LIMIT 10
    ]]
  L8_2 = L8_2 .. L9_2 .. L10_2
  L9_2 = L6_2
  return L7_2(L8_2, L9_2)
end
L5_1(L6_1, L7_1)
L5_1 = AddEventHandler
L6_1 = "lb-phone:mail:mailSent"
function L7_1(A0_2)
  local L1_2, L2_2
  L1_2 = L2_1
  L2_2 = A0_2
  L1_2(L2_2)
end
L5_1(L6_1, L7_1)
