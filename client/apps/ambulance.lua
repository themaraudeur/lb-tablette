local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
function L0_1()
  local L0_2, L1_2
  L0_2 = FrameworkLoaded
  if not L0_2 then
    L0_2 = false
    return L0_2
  end
  L0_2 = Config
  L0_2 = L0_2.Ambulance
  L0_2 = L0_2.Permissions
  L1_2 = GetJob
  L1_2 = L1_2()
  L0_2 = L0_2[L1_2]
  L0_2 = nil ~= L0_2
  return L0_2
end
IsAmbulance = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = AwaitCallback
  L3_2 = "ambulance:getChatMessages"
  L4_2 = A0_2
  L5_2 = A1_2
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = {}
  L4_2 = 1
  L5_2 = #L2_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = L2_2[L7_2]
    L9_2 = {}
    L10_2 = L8_2.id
    L9_2.id = L10_2
    L10_2 = L8_2.message
    L9_2.content = L10_2
    L10_2 = L8_2.attachments
    if L10_2 then
      L10_2 = json
      L10_2 = L10_2.decode
      L11_2 = L8_2.attachments
      L10_2 = L10_2(L11_2)
      if L10_2 then
        goto lbl_29
      end
    end
    L10_2 = nil
    ::lbl_29::
    L9_2.attachments = L10_2
    L10_2 = L8_2.sent_at
    L9_2.timestamp = L10_2
    L10_2 = {}
    L11_2 = L8_2.author
    L10_2.id = L11_2
    L11_2 = L8_2.display_name
    if not L11_2 then
      L11_2 = ""
    end
    L10_2.name = L11_2
    L11_2 = L8_2.avatar
    L10_2.avatar = L11_2
    L9_2.sender = L10_2
    L3_2[L7_2] = L9_2
  end
  return L3_2
end
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = AwaitCallback
  L4_2 = "ambulance:searchUsers"
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  L4_2 = 1
  L5_2 = #L3_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = L3_2[L7_2]
    L9_2 = L8_2.isMale
    L9_2 = 1 == L9_2
    L8_2.isMale = L9_2
  end
  return L3_2
end
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = AwaitCallback
  L2_2 = "ambulance:fetchProfile"
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L2_2 = L1_2.isMale
    L2_2 = 1 == L2_2
    L1_2.isMale = L2_2
  end
  return L1_2
end
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = AwaitCallback
  L2_2 = "ambulance:getReport"
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = {}
  L3_2 = L1_2.patient
  L2_2.id = L3_2
  L3_2 = L1_2.patient_name
  L2_2.name = L3_2
  L3_2 = L1_2.patient_dob
  L2_2.dob = L3_2
  L1_2.patient = L2_2
  L2_2 = {}
  L3_2 = 1
  L4_2 = L1_2.gallery
  L4_2 = #L4_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = #L2_2
    L7_2 = L7_2 + 1
    L8_2 = L1_2.gallery
    L8_2 = L8_2[L6_2]
    L8_2 = L8_2.attachment
    L2_2[L7_2] = L8_2
  end
  L1_2.gallery = L2_2
  return L1_2
end
L4_1 = ReactCallback
L5_1 = "Ambulance"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = A0_2.action
  if "getUser" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:getLoggedIn"
    return L2_2(L3_2)
  elseif "updateUser" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:updateOwnAccount"
    L4_2 = A0_2.callsign
    L5_2 = A0_2.avatar
    return L2_2(L3_2, L4_2, L5_2)
  elseif "getPermissions" == L1_2 then
    L2_2 = GetPermissions
    L3_2 = "Ambulance"
    return L2_2(L3_2)
  elseif "getLogs" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:getLogs"
    L4_2 = A0_2.query
    L5_2 = A0_2.lastId
    return L2_2(L3_2, L4_2, L5_2)
  elseif "getActiveUnits" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:getActiveUnits"
    return L2_2(L3_2)
  elseif "getEmployees" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:getEmployees"
    return L2_2(L3_2)
  end
  if "getUnits" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:getUnits"
    return L2_2(L3_2)
  elseif "addUnit" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:addUnit"
    L4_2 = A0_2.name
    return L2_2(L3_2, L4_2)
  elseif "deleteUnit" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:deleteUnit"
    L4_2 = A0_2.unit
    return L2_2(L3_2, L4_2)
  elseif "updateUnitStatus" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:updateUnitStatus"
    L4_2 = A0_2.unit
    L5_2 = A0_2.status
    return L2_2(L3_2, L4_2, L5_2)
  elseif "renameUnit" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:renameUnit"
    L4_2 = A0_2.unit
    L5_2 = A0_2.name
    return L2_2(L3_2, L4_2, L5_2)
  elseif "assignOfficerToUnit" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:assignOfficerToUnit"
    L4_2 = A0_2.unit
    L5_2 = A0_2.officerId
    return L2_2(L3_2, L4_2, L5_2)
  elseif "removeOfficerFromUnit" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:removeOfficerFromUnit"
    L4_2 = A0_2.officerId
    return L2_2(L3_2, L4_2)
  end
  if "getTags" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:getTags"
    return L2_2(L3_2)
  elseif "createTag" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:createTag"
    L4_2 = A0_2.tag
    L5_2 = A0_2.color
    L6_2 = A0_2.type
    return L2_2(L3_2, L4_2, L5_2, L6_2)
  elseif "deleteTag" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:deleteTag"
    L4_2 = A0_2.id
    return L2_2(L3_2, L4_2)
  end
  if "searchProfiles" == L1_2 then
    L2_2 = L1_1
    L3_2 = A0_2.query
    L4_2 = A0_2.filter
    L5_2 = A0_2.page
    return L2_2(L3_2, L4_2, L5_2)
  elseif "fetchProfile" == L1_2 then
    L2_2 = L2_1
    L3_2 = A0_2.id
    return L2_2(L3_2)
  elseif "updateProfile" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:updateProfile"
    L4_2 = A0_2
    return L2_2(L3_2, L4_2)
  elseif "addTag" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:addTag"
    L4_2 = A0_2.id
    L5_2 = A0_2.tag
    return L2_2(L3_2, L4_2, L5_2)
  elseif "removeTag" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:removeTag"
    L4_2 = A0_2.id
    L5_2 = A0_2.tag
    return L2_2(L3_2, L4_2, L5_2)
  elseif "billPlayer" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:billPlayer"
    L4_2 = A0_2.id
    L5_2 = A0_2.fine
    L6_2 = A0_2.label
    return L2_2(L3_2, L4_2, L5_2, L6_2)
  end
  if "saveReport" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:saveReport"
    L4_2 = A0_2
    return L2_2(L3_2, L4_2)
  elseif "getReports" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:getReports"
    L4_2 = A0_2.page
    L5_2 = A0_2.query
    return L2_2(L3_2, L4_2, L5_2)
  elseif "getReport" == L1_2 then
    L2_2 = L3_1
    L3_2 = A0_2.id
    return L2_2(L3_2)
  elseif "deleteReport" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:deleteReport"
    L4_2 = A0_2.id
    return L2_2(L3_2, L4_2)
  end
  if "getBulletinBoard" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:getBulletinBoard"
    L4_2 = A0_2.page
    L5_2 = A0_2.query
    return L2_2(L3_2, L4_2, L5_2)
  elseif "saveBulletin" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:saveBulletin"
    L4_2 = A0_2.id
    L5_2 = A0_2.title
    L6_2 = A0_2.content
    return L2_2(L3_2, L4_2, L5_2, L6_2)
  elseif "toggleBulletinPinned" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:toggleBulletinPinned"
    L4_2 = A0_2.id
    L5_2 = A0_2.pinned
    return L2_2(L3_2, L4_2, L5_2)
  elseif "deleteBulletin" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:deleteBulletin"
    L4_2 = A0_2.id
    return L2_2(L3_2, L4_2)
  end
  if "getConditions" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:getConditions"
    return L2_2(L3_2)
  elseif "addConditionCategory" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:addConditionCategory"
    L4_2 = A0_2.category
    return L2_2(L3_2, L4_2)
  elseif "updateConditionCategory" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:updateConditionCategory"
    L4_2 = A0_2.oldCategory
    L5_2 = A0_2.newCategory
    return L2_2(L3_2, L4_2, L5_2)
  elseif "deleteConditionCategory" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:deleteConditionCategory"
    L4_2 = A0_2.category
    return L2_2(L3_2, L4_2)
  elseif "addCondition" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:addCondition"
    L4_2 = A0_2.category
    L5_2 = A0_2.title
    L6_2 = A0_2.severity
    return L2_2(L3_2, L4_2, L5_2, L6_2)
  elseif "updateCondition" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:updateCondition"
    L4_2 = A0_2.id
    L5_2 = A0_2.title
    L6_2 = A0_2.severity
    return L2_2(L3_2, L4_2, L5_2, L6_2)
  elseif "deleteCondition" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:deleteCondition"
    L4_2 = A0_2.id
    return L2_2(L3_2, L4_2)
  end
  if "getUnreadChats" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:getUnreadChats"
    return L2_2(L3_2)
  elseif "getChatRooms" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:getChatRooms"
    L4_2 = A0_2.page
    L5_2 = A0_2.query
    return L2_2(L3_2, L4_2, L5_2)
  elseif "getPublicChatRooms" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:getPublicChatRooms"
    L4_2 = A0_2.page
    L5_2 = A0_2.query
    return L2_2(L3_2, L4_2, L5_2)
  elseif "createChat" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:createChat"
    L4_2 = A0_2.name
    L5_2 = A0_2.private
    return L2_2(L3_2, L4_2, L5_2)
  elseif "togglePrivate" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:toggleChatPrivate"
    L4_2 = A0_2.id
    L5_2 = A0_2.toggle
    return L2_2(L3_2, L4_2, L5_2)
  elseif "setChatRoomAvatar" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:setChatIcon"
    L4_2 = A0_2.id
    L5_2 = A0_2.avatar
    return L2_2(L3_2, L4_2, L5_2)
  elseif "getChatMembers" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:getChatMembers"
    L4_2 = A0_2.id
    return L2_2(L3_2, L4_2)
  elseif "inviteToChat" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:inviteToChat"
    L4_2 = A0_2.id
    L5_2 = A0_2.user
    return L2_2(L3_2, L4_2, L5_2)
  elseif "kickFromChat" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:kickFromChat"
    L4_2 = A0_2.id
    L5_2 = A0_2.user
    return L2_2(L3_2, L4_2, L5_2)
  elseif "getMessages" == L1_2 then
    L2_2 = L0_1
    L3_2 = A0_2.id
    L4_2 = A0_2.lastId
    return L2_2(L3_2, L4_2)
  elseif "sendMessage" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:sendMessage"
    L4_2 = A0_2.id
    L5_2 = A0_2.content
    L6_2 = A0_2.attachments
    return L2_2(L3_2, L4_2, L5_2, L6_2)
  elseif "leaveChat" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:leaveChat"
    L4_2 = A0_2.id
    return L2_2(L3_2, L4_2)
  elseif "joinChat" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:joinChat"
    L4_2 = A0_2.id
    return L2_2(L3_2, L4_2)
  elseif "clearChatNotifications" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "ambulance:clearChatNotifications"
    L4_2 = A0_2.id
    return L2_2(L3_2, L4_2)
  end
  L2_2 = debugprint
  L3_2 = "Unknown action Ambulance:"
  L4_2 = tostring
  L5_2 = L1_2
  L4_2 = L4_2(L5_2)
  L3_2 = L3_2 .. L4_2
  L2_2(L3_2)
end
L7_1 = false
L8_1 = true
L4_1(L5_1, L6_1, L7_1, L8_1)
L4_1 = RegisterNetEvent
L5_1 = "tablet:ambulance:bulletinCreated"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "ambulance:bulletinCreated"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "tablet:ambulance:bulletinUpdated"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "ambulance:bulletinUpdated"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "tablet:ambulance:bulletinDeleted"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "ambulance:bulletinDeleted"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "tablet:ambulance:addConditionCategory"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "ambulance:addConditionCategory"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "tablet:ambulance:updateConditionCategory"
function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = SendReactMessage
  L3_2 = "ambulance:updateConditionCategory"
  L4_2 = {}
  L4_2.oldCategory = A0_2
  L4_2.newCategory = A1_2
  L2_2(L3_2, L4_2)
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "tablet:ambulance:deleteConditionCategory"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "ambulance:deleteConditionCategory"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "tablet:ambulance:addCondition"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "ambulance:addCondition"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "tablet:ambulance:updateCondition"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "ambulance:updateCondition"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "tablet:ambulance:deleteCondition"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "ambulance:deleteCondition"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L4_1(L5_1, L6_1)
L4_1 = SetTimeout
L5_1 = 500
function L6_1()
  local L0_2, L1_2, L2_2
  L0_2 = RegisterDutyBlipsListener
  L1_2 = "ambulance"
  L2_2 = IsAmbulance
  L0_2(L1_2, L2_2)
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "tablet:ambulance:createdTag"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "ambulance:tagCreated"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "tablet:ambulance:deletedTag"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "ambulance:tagDeleted"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "tablet:ambulance:addedTag"
function L6_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = SendReactMessage
  L4_2 = "ambulance:tagAdded"
  L5_2 = {}
  L5_2.id = A0_2
  L5_2.type = A1_2
  L5_2.tagId = A2_2
  L3_2(L4_2, L5_2)
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "tablet:ambulance:removedTag"
function L6_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = SendReactMessage
  L4_2 = "ambulance:tagRemoved"
  L5_2 = {}
  L5_2.id = A0_2
  L5_2.type = A1_2
  L5_2.tagId = A2_2
  L3_2(L4_2, L5_2)
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "tablet:ambulance:profileUpdated"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "ambulance:profileUpdated"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "tablet:ambulance:reportUpdated"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "ambulance:reportUpdated"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "tablet:ambulance:reportDeleted"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "ambulance:reportDeleted"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L4_1(L5_1, L6_1)
L4_1 = AddEventHandler
L5_1 = "lb-tablet:jobUpdated"
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = debugprint
  L1_2 = "Ambulance: job updated, refreshing permissions etc"
  L0_2(L1_2)
  L0_2 = IsAmbulance
  L0_2 = L0_2()
  L1_2 = Config
  L1_2 = L1_2.RequireDutyMDT
  if L1_2 then
    L1_2 = IsOnDuty
    L1_2 = L1_2()
    if not L1_2 then
      L1_2 = debugprint
      L2_2 = "Not on duty, removing ambulance app"
      L1_2(L2_2)
      L0_2 = false
    end
  end
  L1_2 = {}
  L1_2.app = "ambulance"
  L1_2.hasAccess = L0_2
  if L0_2 then
    L2_2 = AmbulanceAppData
    if L2_2 then
      goto lbl_28
    end
  end
  L2_2 = nil
  ::lbl_28::
  L1_2.appData = L2_2
  L2_2 = debugprint
  L3_2 = "Ambulance: setHasAccess:"
  L4_2 = L1_2
  L2_2(L3_2, L4_2)
  L2_2 = SendReactMessage
  L3_2 = "ambulance:updatePermissions"
  L4_2 = GetPermissions
  L5_2 = "Ambulance"
  L4_2, L5_2 = L4_2(L5_2)
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = SendReactMessage
  L3_2 = "app:setHasAccess"
  L4_2 = L1_2
  L2_2(L3_2, L4_2)
end
L4_1(L5_1, L6_1)
