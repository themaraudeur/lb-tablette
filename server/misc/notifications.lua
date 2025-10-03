local L0_1, L1_1, L2_1, L3_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = A0_2.title
  if L1_2 then
    L1_2 = A0_2.content
    if not L1_2 then
      L1_2 = A0_2.title
      A0_2.content = L1_2
      L1_2 = A0_2.app
      A0_2.title = L1_2
    end
  end
  L1_2 = assert
  L2_2 = type
  L3_2 = A0_2.app
  L2_2 = L2_2(L3_2)
  L2_2 = "string" == L2_2
  L3_2 = "app must be a string"
  L1_2(L2_2, L3_2)
  L1_2 = assert
  L2_2 = type
  L3_2 = A0_2.title
  L2_2 = L2_2(L3_2)
  L2_2 = "string" == L2_2
  L3_2 = "title must be a string"
  L1_2(L2_2, L3_2)
  L1_2 = assert
  L2_2 = type
  L3_2 = A0_2.content
  L2_2 = L2_2(L3_2)
  L2_2 = "string" == L2_2
  L3_2 = "content must be a string"
  L1_2(L2_2, L3_2)
  L1_2 = assert
  L2_2 = type
  L3_2 = A0_2.thumbnail
  L2_2 = L2_2(L3_2)
  L2_2 = "string" == L2_2
  L3_2 = "thumbnail must be a string or nil"
  L1_2(L2_2, L3_2)
  L1_2 = assert
  L2_2 = type
  L3_2 = A0_2.avatar
  L2_2 = L2_2(L3_2)
  L2_2 = "string" == L2_2
  L3_2 = "avatar must be a string or nil"
  L1_2(L2_2, L3_2)
  L1_2 = assert
  L2_2 = type
  L3_2 = A0_2.showAvatar
  L2_2 = L2_2(L3_2)
  L2_2 = "boolean" == L2_2
  L3_2 = "showAvatar must be a boolean or nil"
  L1_2(L2_2, L3_2)
  L1_2 = assert
  L2_2 = type
  L3_2 = A0_2.customData
  L2_2 = L2_2(L3_2)
  L2_2 = "table" == L2_2
  L3_2 = "customData must be a table or nil"
  L1_2(L2_2, L3_2)
  L1_2 = {}
  L2_2 = A0_2.app
  L1_2["@app"] = L2_2
  L2_2 = A0_2.title
  L1_2["@title"] = L2_2
  L2_2 = A0_2.content
  L1_2["@content"] = L2_2
  L2_2 = A0_2.thumbnail
  L1_2["@thumbnail"] = L2_2
  L2_2 = A0_2.avatar
  L1_2["@avatar"] = L2_2
  L2_2 = A0_2.showAvatar
  L2_2 = true == L2_2
  L1_2["@showAvatar"] = L2_2
  L2_2 = A0_2.customData
  if L2_2 then
    L2_2 = json
    L2_2 = L2_2.encode
    L3_2 = A0_2.customData
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_121
    end
  end
  L2_2 = nil
  ::lbl_121::
  L1_2["@customData"] = L2_2
  return L1_2
end
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = A0_2.tabletId
  L2_2 = A0_2.source
  L3_2 = nil
  if not L1_2 and not L2_2 then
    L4_2 = error
    L5_2 = "tabletId or source must be provided"
    return L4_2(L5_2)
  end
  L4_2 = L0_1
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if -1 ~= L2_2 and not L1_2 then
    L5_2 = GetEquippedTablet
    L6_2 = L2_2
    L5_2 = L5_2(L6_2)
    L1_2 = L5_2
  end
  if L1_2 and not L2_2 then
    L5_2 = GetSourceFromTablet
    L6_2 = L1_2
    L5_2 = L5_2(L6_2)
    L2_2 = L5_2
  end
  if -1 ~= L2_2 and L1_2 then
    L5_2 = A0_2.dontSaveToDatabase
    if not L5_2 then
      L4_2["@tabletId"] = L1_2
      L5_2 = MySQL
      L5_2 = L5_2.insert
      L5_2 = L5_2.await
      L6_2 = [[
            INSERT INTO lbtablet_notifications
                (tablet_id, app, title, content, thumbnail, avatar, show_avatar, custom_data)
            VALUES
                (@tabletId, @app, @title, @content, @thumbnail, @avatar, @showAvatar, @customData)
        ]]
      L7_2 = L4_2
      L5_2 = L5_2(L6_2, L7_2)
      L3_2 = L5_2
    end
  end
  if L2_2 then
    A0_2.id = L3_2
    L5_2 = TriggerClientEvent
    L6_2 = "tablet:notifications:new"
    L7_2 = L2_2
    L8_2 = A0_2
    L5_2(L6_2, L7_2, L8_2)
  end
  return L3_2
end
SendNotification = L1_1
L1_1 = exports
L2_1 = "SendNotification"
L3_1 = SendNotification
L1_1(L2_1, L3_1)
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = L0_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if A1_2 then
    L3_2 = MySQL
    L3_2 = L3_2.update
    L4_2 = [[
            INSERT INTO lbtablet_notifications
                (tablet_id, app, title, content, thumbnail, avatar, show_avatar, custom_data)
            SELECT
                id, @app, @title, @content, @thumbnail, @avatar, @showAvatar, @customData
            FROM
                lbtablet_tablets
        ]]
    L5_2 = L2_2
    L3_2(L4_2, L5_2)
  end
  L3_2 = TriggerClientEvent
  L4_2 = "tablet:notifications:new"
  L5_2 = -1
  L6_2 = A0_2
  L3_2(L4_2, L5_2, L6_2)
end
NotifyEveryone = L1_1
L1_1 = exports
L2_1 = "NotifyEveryone"
L3_1 = NotifyEveryone
L1_1(L2_1, L3_1)
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  if A0_2 then
    L3_2 = #A0_2
    if 0 ~= L3_2 then
      goto lbl_10
    end
  end
  L3_2 = debugprint
  L4_2 = "NotifyTablets: No tablet ids provided"
  L3_2(L4_2)
  do return end
  ::lbl_10::
  L3_2 = L0_1
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  L3_2["@tabletIds"] = A0_2
  L3_2["@excludeTablets"] = A2_2
  L4_2 = debugprint
  L5_2 = "NotifyTablets"
  L6_2 = L3_2
  L4_2(L5_2, L6_2)
  L4_2 = MySQL
  L4_2 = L4_2.query
  L5_2 = [[
        INSERT INTO lbtablet_notifications
            (tablet_id, app, title, content, thumbnail, avatar, show_avatar, custom_data)
        SELECT
            id, @app, @title, @content, @thumbnail, @avatar, @showAvatar, @customData
        FROM
            lbtablet_tablets
        WHERE
            id IN (@tabletIds) ]]
  if A2_2 then
    L6_2 = "AND id NOT IN (@excludeTablets)"
    if L6_2 then
      goto lbl_28
    end
  end
  L6_2 = ""
  ::lbl_28::
  L7_2 = [[
        RETURNING
            id, tablet_id
    ]]
  L5_2 = L5_2 .. L6_2 .. L7_2
  L6_2 = L3_2
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    L1_3 = 1
    L2_3 = #A0_3
    L3_3 = 1
    for L4_3 = L1_3, L2_3, L3_3 do
      L5_3 = A0_3[L4_3]
      L5_3 = L5_3.id
      L6_3 = A0_3[L4_3]
      L6_3 = L6_3.tablet_id
      L7_3 = GetSourceFromTablet
      L8_3 = L6_3
      L7_3 = L7_3(L8_3)
      if L7_3 then
        A1_2.id = L5_3
        L8_3 = TriggerClientEvent
        L9_3 = "tablet:notifications:new"
        L10_3 = L7_3
        L11_3 = A1_2
        L8_3(L9_3, L10_3, L11_3)
      end
    end
  end
  L4_2(L5_2, L6_2, L7_2)
end
NotifyTablets = L1_1
L1_1 = exports
L2_1 = "NotifyTablets"
L3_1 = NotifyTablets
L1_1(L2_1, L3_1)
L1_1 = BaseCallback
L2_1 = "notifications:get"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = [[
        SELECT
            id,
            app,
            title,
            content,
            thumbnail,
            avatar,
            show_avatar AS showAvatar,
            custom_data AS customData,
            received_at AS `timestamp`

        FROM
            lbtablet_notifications
        WHERE
            tablet_id = ?
        ORDER BY
            received_at DESC
    ]]
  L4_2 = {}
  L5_2 = A1_2
  L4_2[1] = L5_2
  return L2_2(L3_2, L4_2)
end
L1_1(L2_1, L3_1)
L1_1 = BaseCallback
L2_1 = "notifications:delete"
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = "DELETE FROM lbtablet_notifications WHERE id = ? AND tablet_id = ?"
  L5_2 = {}
  L6_2 = A2_2
  L7_2 = A1_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L3_2 = L3_2(L4_2, L5_2)
  L3_2 = L3_2 > 0
  return L3_2
end
L1_1(L2_1, L3_1)
L1_1 = BaseCallback
L2_1 = "notifications:clear"
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = "DELETE FROM lbtablet_notifications WHERE tablet_id = ? AND app = ?"
  L5_2 = {}
  L6_2 = A1_2
  L7_2 = A2_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L3_2 = L3_2(L4_2, L5_2)
  L3_2 = L3_2 > 0
  return L3_2
end
L1_1(L2_1, L3_1)
L1_1 = MySQL
L1_1 = L1_1.ready
function L2_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = Config
  L0_2 = L0_2.AutoDeleteNotifications
  if not L0_2 then
    return
  end
  while true do
    L0_2 = DatabaseCheckerFinished
    if L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 500
    L0_2(L1_2)
  end
  L0_2 = 168
  L1_2 = type
  L2_2 = Config
  L2_2 = L2_2.AutoDeleteNotifications
  L1_2 = L1_2(L2_2)
  if "number" == L1_2 then
    L1_2 = Config
    L1_2 = L1_2.AutoDeleteNotifications
    if L1_2 > 0 then
      L1_2 = math
      L1_2 = L1_2.floor
      L2_2 = Config
      L2_2 = L2_2.AutoDeleteNotifications
      L1_2 = L1_2(L2_2)
      L0_2 = L1_2
    end
  end
  L1_2 = SetInterval
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = debugprint
    L1_3 = "Deleting old notifications..."
    L0_3(L1_3)
    L0_3 = MySQL
    L0_3 = L0_3.update
    L0_3 = L0_3.await
    L1_3 = "DELETE FROM lbtablet_notifications WHERE received_at < DATE_SUB(NOW(), INTERVAL ? HOUR)"
    L2_3 = {}
    L3_3 = L0_2
    L2_3[1] = L3_3
    L0_3 = L0_3(L1_3, L2_3)
    L1_3 = debugprint
    L2_3 = "Deleted "
    L3_3 = L0_3
    L4_3 = " old notifications"
    L2_3 = L2_3 .. L3_3 .. L4_3
    L1_3(L2_3)
  end
  L3_2 = 3600000
  L1_2(L2_2, L3_2)
end
L1_1(L2_1)
