local L0_1, L1_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = {}
  L4_2 = A1_2
  L3_2[1] = L4_2
  if A2_2 then
    L4_2 = #L3_2
    L4_2 = L4_2 + 1
    L3_2[L4_2] = A2_2
  end
  L4_2 = MySQL
  L4_2 = L4_2.query
  L4_2 = L4_2.await
  L5_2 = [[
        SELECT
            m.id, m.message, m.attachments, m.sent_at, m.author,
            a.avatar, a.display_name

        FROM lbtablet_chat_rooms_messages m
        LEFT JOIN lbtablet_]]
  L6_2 = A0_2
  L7_2 = [[
_accounts a ON a.id = m.author

        WHERE room_id = ? ]]
  if A2_2 then
    L8_2 = "AND m.id < ?"
    if L8_2 then
      goto lbl_23
    end
  end
  L8_2 = ""
  ::lbl_23::
  L9_2 = [[

        ORDER BY sent_at DESC

        LIMIT 25
    ]]
  L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2
  L6_2 = L3_2
  return L4_2(L5_2, L6_2)
end
GetChatMessages = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = MySQL
  L2_2 = L2_2.scalar
  L2_2 = L2_2.await
  L3_2 = "SELECT SUM(notifications) FROM lbtablet_chat_rooms_members WHERE `account` = ? AND notifications > 0"
  L4_2 = {}
  L5_2 = A1_2
  L4_2[1] = L5_2
  L2_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    L2_2 = 0
  end
  L3_2 = tonumber
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = 0
  end
  return L3_2
end
GetUndreadChatNotifications = L0_1
function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if "" ~= A3_2 then
    L4_2 = type
    L5_2 = A3_2
    L4_2 = L4_2(L5_2)
    if "string" == L4_2 then
      goto lbl_9
    end
  end
  A3_2 = nil
  ::lbl_9::
  L4_2 = MySQL
  L4_2 = L4_2.query
  L4_2 = L4_2.await
  L5_2 = [[
        SELECT
            id,
            label,
            icon AS avatar,
            creator,
            last_message AS lastMessage,
            last_updated AS `timestamp`

        FROM lbtablet_chat_rooms

        WHERE
            terminal_type = @job AND private = 0
            ]]
  if A3_2 then
    L6_2 = "AND label LIKE @search"
    if L6_2 then
      goto lbl_19
    end
  end
  L6_2 = ""
  ::lbl_19::
  L7_2 = [[

        ORDER BY last_updated DESC
        LIMIT @page, @perPage
    ]]
  L5_2 = L5_2 .. L6_2 .. L7_2
  L6_2 = {}
  L6_2["@job"] = A0_2
  L7_2 = "%"
  L8_2 = A3_2 or L8_2
  if not A3_2 then
    L8_2 = ""
  end
  L9_2 = "%"
  L7_2 = L7_2 .. L8_2 .. L9_2
  L6_2["@search"] = L7_2
  L6_2["@tabletId"] = A1_2
  L7_2 = A2_2 or L7_2
  if not A2_2 then
    L7_2 = 0
  end
  L7_2 = L7_2 * 25
  L6_2["@page"] = L7_2
  L6_2["@perPage"] = 25
  return L4_2(L5_2, L6_2)
end
GetPublicChatRooms = L0_1
function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if "" ~= A3_2 then
    L4_2 = type
    L5_2 = A3_2
    L4_2 = L4_2(L5_2)
    if "string" == L4_2 then
      goto lbl_9
    end
  end
  A3_2 = nil
  ::lbl_9::
  L4_2 = MySQL
  L4_2 = L4_2.query
  L4_2 = L4_2.await
  L5_2 = [[
        SELECT
            id,
            label,
            icon AS avatar,
            creator,
            last_message AS lastMessage,
            last_updated AS `timestamp`,
            m.notifications,
            private

        FROM lbtablet_chat_rooms

        INNER JOIN lbtablet_chat_rooms_members m
            ON m.room_id = lbtablet_chat_rooms.id

        WHERE
            terminal_type = @job
            AND m.account = @tabletId
            ]]
  if A3_2 then
    L6_2 = " AND label LIKE @search"
    if L6_2 then
      goto lbl_19
    end
  end
  L6_2 = ""
  ::lbl_19::
  L7_2 = [[

        ORDER BY last_updated DESC
        LIMIT @page, @perPage
    ]]
  L5_2 = L5_2 .. L6_2 .. L7_2
  L6_2 = {}
  L6_2["@job"] = A0_2
  L6_2["@tabletId"] = A1_2
  L7_2 = "%"
  L8_2 = A3_2 or L8_2
  if not A3_2 then
    L8_2 = ""
  end
  L9_2 = "%"
  L7_2 = L7_2 .. L8_2 .. L9_2
  L6_2["@search"] = L7_2
  L7_2 = A2_2 or L7_2
  if not A2_2 then
    L7_2 = 0
  end
  L7_2 = L7_2 * 25
  L6_2["@page"] = L7_2
  L6_2["@perPage"] = 25
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = 1
  L6_2 = #L4_2
  L7_2 = 1
  for L8_2 = L5_2, L6_2, L7_2 do
    L9_2 = L4_2[L8_2]
    L10_2 = L9_2.creator
    L10_2 = L10_2 == A1_2
    L9_2.creator = L10_2
  end
  return L4_2
end
GetChatRooms = L0_1
function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = MySQL
  L4_2 = L4_2.insert
  L4_2 = L4_2.await
  L5_2 = [[
        INSERT INTO lbtablet_chat_rooms (terminal_type, label, private, creator)
        VALUES (?, ?, ?, ?)
    ]]
  L6_2 = {}
  L7_2 = A0_2
  L8_2 = A2_2
  L9_2 = true == A3_2
  L10_2 = A1_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L6_2[4] = L10_2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = MySQL
  L5_2 = L5_2.update
  L5_2 = L5_2.await
  L6_2 = "INSERT INTO lbtablet_chat_rooms_members (room_id, account) VALUES (?, ?)"
  L7_2 = {}
  L8_2 = L4_2
  L9_2 = A1_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L5_2(L6_2, L7_2)
  return L4_2
end
CreateChatRoom = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = MySQL
  L2_2 = L2_2.update
  L2_2 = L2_2.await
  L3_2 = "UPDATE lbtablet_chat_rooms SET private = ? WHERE id = ?"
  L4_2 = {}
  L5_2 = A1_2
  L6_2 = A0_2
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L2_2 = L2_2(L3_2, L4_2)
  L2_2 = L2_2 > 0
  if L2_2 then
    L3_2 = TriggerClientEvent
    L4_2 = "tablet:chat:setPrivate"
    L5_2 = -1
    L6_2 = A0_2
    L7_2 = A1_2
    L3_2(L4_2, L5_2, L6_2, L7_2)
  end
  return L2_2
end
ToggleChatRoomPrivate = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = MySQL
  L2_2 = L2_2.update
  L2_2 = L2_2.await
  L3_2 = "UPDATE lbtablet_chat_rooms SET icon = ? WHERE id = ?"
  L4_2 = {}
  L5_2 = A1_2
  L6_2 = A0_2
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L2_2 = L2_2(L3_2, L4_2)
  L2_2 = L2_2 > 0
  if L2_2 then
    L3_2 = TriggerClientEvent
    L4_2 = "tablet:chat:setIcon"
    L5_2 = -1
    L6_2 = A0_2
    L7_2 = A1_2
    L3_2(L4_2, L5_2, L6_2, L7_2)
  end
  return L2_2
end
SetChatRoomIcon = L0_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = "INSERT IGNORE INTO lbtablet_chat_rooms_members (room_id, account) VALUES (?, ?)"
  L5_2 = {}
  L6_2 = A1_2
  L7_2 = A2_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L3_2 = L3_2(L4_2, L5_2)
  L3_2 = L3_2 > 0
  L4_2 = GetSourceFromIdentifier
  L5_2 = A2_2
  L4_2 = L4_2(L5_2)
  if L3_2 and L4_2 then
    L5_2 = MySQL
    L5_2 = L5_2.single
    L5_2 = L5_2.await
    L6_2 = [[
            SELECT
                id,
                label,
                icon AS avatar,
                last_message AS lastMessage,
                last_updated AS `timestamp`,
                m.notifications,
                private

            FROM lbtablet_chat_rooms

            INNER JOIN lbtablet_chat_rooms_members m
                ON m.room_id = lbtablet_chat_rooms.id

            WHERE terminal_type = ? AND m.account = ? AND lbtablet_chat_rooms.id = ?
        ]]
    L7_2 = {}
    L8_2 = A2_2
    L9_2 = A1_2
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L5_2 = L5_2(L6_2, L7_2)
    if L5_2 then
      L6_2 = TriggerClientEvent
      L7_2 = "tablet:chat:joinRoom"
      L8_2 = L4_2
      L9_2 = L5_2
      L6_2(L7_2, L8_2, L9_2)
    end
  end
  return L3_2
end
AddToChatRoom = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = [[
        SELECT
            a.display_name AS `name`,
            m.account AS id

        FROM lbtablet_chat_rooms_members m

        LEFT JOIN lbtablet_]]
  L4_2 = A0_2
  L5_2 = [[
_accounts a
            ON a.id = m.account

        WHERE m.room_id = ?
    ]]
  L3_2 = L3_2 .. L4_2 .. L5_2
  L4_2 = {}
  L5_2 = A1_2
  L4_2[1] = L5_2
  return L2_2(L3_2, L4_2)
end
GetChatRoomMembers = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = MySQL
  L2_2 = L2_2.update
  L2_2 = L2_2.await
  L3_2 = "DELETE FROM lbtablet_chat_rooms_members WHERE room_id = ? AND account = ?"
  L4_2 = {}
  L5_2 = A0_2
  L6_2 = A1_2
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L2_2 = L2_2(L3_2, L4_2)
  L2_2 = L2_2 > 0
  L3_2 = GetSourceFromIdentifier
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if L2_2 and L3_2 then
    L4_2 = TriggerClientEvent
    L5_2 = "tablet:chat:leaveRoom"
    L6_2 = L3_2
    L7_2 = A0_2
    L4_2(L5_2, L6_2, L7_2)
  end
  return L2_2
end
RemoveMemberFromChatRoom = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = MySQL
  L2_2 = L2_2.update
  L2_2 = L2_2.await
  L3_2 = "DELETE FROM lbtablet_chat_rooms_members WHERE room_id = ? AND account = ?"
  L4_2 = {}
  L5_2 = A1_2
  L6_2 = A0_2
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L2_2 = L2_2(L3_2, L4_2)
  L2_2 = L2_2 > 0
  if not L2_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = MySQL
  L3_2 = L3_2.scalar
  L3_2 = L3_2.await
  L4_2 = "SELECT private FROM lbtablet_chat_rooms WHERE id = ?"
  L5_2 = {}
  L6_2 = A1_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L4_2 = true
    return L4_2
  end
  L4_2 = MySQL
  L4_2 = L4_2.scalar
  L4_2 = L4_2.await
  L5_2 = "SELECT COUNT(1) FROM lbtablet_chat_rooms_members WHERE room_id = ?"
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L4_2 = L4_2(L5_2, L6_2)
  if 0 == L4_2 then
    L5_2 = MySQL
    L5_2 = L5_2.update
    L5_2 = L5_2.await
    L6_2 = "DELETE FROM lbtablet_chat_rooms WHERE id = ?"
    L7_2 = {}
    L8_2 = A1_2
    L7_2[1] = L8_2
    L5_2(L6_2, L7_2)
  end
  L5_2 = true
  return L5_2
end
LeaveChatRoom = L0_1
function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = A0_2.id
  L5_2 = type
  L6_2 = A2_2
  L5_2 = L5_2(L6_2)
  if "string" == L5_2 then
    L5_2 = #A2_2
    if 0 ~= L5_2 then
      goto lbl_11
    end
  end
  A2_2 = nil
  ::lbl_11::
  L5_2 = type
  L6_2 = A3_2
  L5_2 = L5_2(L6_2)
  if "table" == L5_2 then
    L5_2 = #A3_2
    if 0 ~= L5_2 then
      goto lbl_20
    end
  end
  A3_2 = nil
  ::lbl_20::
  if not A2_2 and not A3_2 then
    L5_2 = false
    return L5_2
  end
  L5_2 = MySQL
  L5_2 = L5_2.insert
  L5_2 = L5_2.await
  L6_2 = [[
        INSERT INTO lbtablet_chat_rooms_messages (room_id, author, message, attachments)
        VALUES (@roomId, @author, @message, @attachments)
    ]]
  L7_2 = {}
  L7_2["@roomId"] = A1_2
  L7_2["@author"] = L4_2
  L7_2["@message"] = A2_2
  if A3_2 then
    L8_2 = json
    L8_2 = L8_2.encode
    L9_2 = A3_2
    L8_2 = L8_2(L9_2)
    if L8_2 then
      goto lbl_44
    end
  end
  L8_2 = nil
  ::lbl_44::
  L7_2["@attachments"] = L8_2
  L5_2 = L5_2(L6_2, L7_2)
  if not L5_2 then
    L6_2 = false
    return L6_2
  end
  L6_2 = MySQL
  L6_2 = L6_2.update
  L6_2 = L6_2.await
  L7_2 = "UPDATE lbtablet_chat_rooms_members SET notifications = notifications + 1 WHERE room_id = ? AND account != ?"
  L8_2 = {}
  L9_2 = A1_2
  L10_2 = L4_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L6_2(L7_2, L8_2)
  L6_2 = MySQL
  L6_2 = L6_2.update
  L6_2 = L6_2.await
  L7_2 = "UPDATE lbtablet_chat_rooms SET last_message = ? WHERE id = ?"
  L8_2 = {}
  L9_2 = A2_2 or L9_2
  if not A2_2 then
    L9_2 = "<!ATTACHMENT!>"
  end
  L10_2 = A1_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L6_2(L7_2, L8_2)
  L6_2 = TriggerClientEvent
  L7_2 = "tablet:chat:newMessage"
  L8_2 = -1
  L9_2 = {}
  L9_2.id = A1_2
  L10_2 = {}
  L10_2.id = L5_2
  L10_2.content = A2_2
  L10_2.attachments = A3_2
  L11_2 = os
  L11_2 = L11_2.time
  L11_2 = L11_2()
  L11_2 = L11_2 * 1000
  L10_2.timestamp = L11_2
  L10_2.sender = A0_2
  L9_2.message = L10_2
  L6_2(L7_2, L8_2, L9_2)
  return L5_2
end
SendChatMessage = L0_1
