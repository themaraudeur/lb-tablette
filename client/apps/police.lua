local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
function L0_1()
  local L0_2, L1_2
  L0_2 = FrameworkLoaded
  if not L0_2 then
    L0_2 = false
    return L0_2
  end
  L0_2 = Config
  L0_2 = L0_2.Police
  L0_2 = L0_2.Permissions
  L1_2 = GetJob
  L1_2 = L1_2()
  L0_2 = L0_2[L1_2]
  L0_2 = nil ~= L0_2
  return L0_2
end
IsPolice = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = AwaitCallback
  L3_2 = "police:getChatMessages"
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
  L4_2 = "police:searchUsers"
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
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = AwaitCallback
  L2_2 = "police:fetchUser"
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L2_2 = L1_2.isMale
    L2_2 = 1 == L2_2
    L1_2.isMale = L2_2
    L2_2 = 1
    L3_2 = L1_2.vehicles
    L3_2 = #L3_2
    L4_2 = 1
    for L5_2 = L2_2, L3_2, L4_2 do
      L6_2 = FormatVehicle
      L7_2 = L1_2.vehicles
      L7_2 = L7_2[L5_2]
      L6_2(L7_2)
    end
  end
  return L1_2
end
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = AwaitCallback
  L4_2 = "police:searchVehicles"
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  L4_2 = 1
  L5_2 = #L3_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = FormatVehicle
    L9_2 = L3_2[L7_2]
    L8_2(L9_2)
  end
  L4_2 = debugprint
  L5_2 = "Got vehicles: "
  L6_2 = L3_2
  L4_2(L5_2, L6_2)
  return L3_2
end
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = AwaitCallback
  L2_2 = "police:fetchVehicle"
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = FormatVehicle
  L3_2 = L1_2
  L2_2(L3_2)
  L2_2 = debugprint
  L3_2 = "Got vehicle: "
  L4_2 = L1_2
  L2_2(L3_2, L4_2)
  return L1_2
end
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = AwaitCallback
  L2_2 = "police:getCase"
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = {}
  L3_2 = 1
  L4_2 = L1_2.evidence
  L4_2 = #L4_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = L1_2.evidence
    L7_2 = L7_2[L6_2]
    L7_2 = L7_2.attachment
    L2_2[L6_2] = L7_2
  end
  L1_2.evidence = L2_2
  L3_2 = {}
  L4_2 = 1
  L5_2 = L1_2.vehicleModels
  L5_2 = #L5_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = L1_2.vehicleModels
    L8_2 = L8_2[L7_2]
    L9_2 = L8_2.plate
    L10_2 = tonumber
    L11_2 = L8_2.model
    L10_2 = L10_2(L11_2)
    L3_2[L9_2] = L10_2
  end
  L4_2 = {}
  L5_2 = {}
  L6_2 = {}
  L7_2 = 1
  L8_2 = L1_2.involved
  L8_2 = #L8_2
  L9_2 = 1
  for L10_2 = L7_2, L8_2, L9_2 do
    L11_2 = L1_2.involved
    L11_2 = L11_2[L10_2]
    L12_2 = L11_2.involvement
    if "vehicle" == L12_2 then
      L12_2 = GetVehicleLabel
      L13_2 = L11_2.involved
      L13_2 = L3_2[L13_2]
      L12_2 = L12_2(L13_2)
      L11_2.model = L12_2
      L12_2 = L11_2.involved
      L11_2.plate = L12_2
      L11_2.involved = nil
      L12_2 = #L5_2
      L12_2 = L12_2 + 1
      L5_2[L12_2] = L11_2
    else
      L12_2 = L11_2.involvement
      if "officer" == L12_2 then
        L12_2 = L11_2.involved
        L11_2.id = L12_2
        L11_2.involved = nil
        L12_2 = #L4_2
        L12_2 = L12_2 + 1
        L4_2[L12_2] = L11_2
      else
        L12_2 = L11_2.involvement
        if "civilian" == L12_2 then
          L12_2 = L11_2.involved
          L11_2.id = L12_2
          L11_2.involved = nil
          L12_2 = #L6_2
          L12_2 = L12_2 + 1
          L6_2[L12_2] = L11_2
        end
      end
    end
  end
  L7_2 = {}
  L1_2.involved = L7_2
  L1_2.officersInvolved = L4_2
  L1_2.vehiclesInvolved = L5_2
  L1_2.civiliansInvolved = L6_2
  return L1_2
end
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = AwaitCallback
  L2_2 = "police:getReport"
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = {}
  L1_2.officersInvolved = L2_2
  L2_2 = {}
  L1_2.civiliansInvolved = L2_2
  L2_2 = {}
  L1_2.suspectsInvolved = L2_2
  L2_2 = L1_2.involved
  L3_2 = 1
  L4_2 = #L2_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = L2_2[L6_2]
    L8_2 = {}
    L9_2 = L7_2.involved
    L8_2.id = L9_2
    L9_2 = L7_2.name
    L8_2.name = L9_2
    L9_2 = L7_2.involvement
    if "officer" == L9_2 then
      L9_2 = L1_2.officersInvolved
      L10_2 = L1_2.officersInvolved
      L10_2 = #L10_2
      L10_2 = L10_2 + 1
      L9_2[L10_2] = L8_2
    else
      L9_2 = L7_2.involvement
      if "civilian" == L9_2 then
        L9_2 = L1_2.civiliansInvolved
        L10_2 = L1_2.civiliansInvolved
        L10_2 = #L10_2
        L10_2 = L10_2 + 1
        L9_2[L10_2] = L8_2
      else
        L9_2 = L7_2.involvement
        if "suspect" == L9_2 then
          L9_2 = L1_2.suspectsInvolved
          L10_2 = L1_2.suspectsInvolved
          L10_2 = #L10_2
          L10_2 = L10_2 + 1
          L9_2[L10_2] = L8_2
        end
      end
    end
  end
  L3_2 = {}
  L4_2 = 1
  L5_2 = L1_2.gallery
  L5_2 = #L5_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = #L3_2
    L8_2 = L8_2 + 1
    L9_2 = L1_2.gallery
    L9_2 = L9_2[L7_2]
    L9_2 = L9_2.attachment
    L3_2[L8_2] = L9_2
  end
  L1_2.involved = nil
  L1_2.gallery = L3_2
  return L1_2
end
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = AwaitCallback
  L2_2 = "police:getWarrant"
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = L1_2.target
  if L2_2 then
    L2_2 = L1_2.target
    L2_2 = L2_2.type
    if "vehicle" == L2_2 then
      L2_2 = FormatVehicle
      L3_2 = L1_2.target
      L3_2 = L3_2.vehicle
      L2_2 = L2_2(L3_2)
      L3_2 = L1_2.target
      L4_2 = L2_2.model
      L3_2.name = L4_2
      L3_2 = L1_2.target
      L4_2 = L2_2.color
      L3_2.color = L4_2
      L3_2 = L1_2.target
      L3_2.vehicle = nil
    end
  end
  return L1_2
end
function L8_1()
  local L0_2, L1_2, L2_2
  L0_2 = GetPermissions
  L1_2 = "Police"
  L0_2 = L0_2(L1_2)
  if not L0_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = Config
  L1_2 = L1_2.LBPhone
  if L1_2 then
    L1_2 = L0_2.phone
    if L1_2 then
      L1_2 = L0_2.phone
      L1_2 = L1_2.unlock
      if L1_2 then
        L1_2 = GetPhoneConfig
        L1_2 = L1_2()
        if L1_2 then
          L1_2 = L1_2.Item
        end
        if L1_2 then
          L1_2 = L1_2.Unique
        end
        if not L1_2 then
          L1_2 = L0_2.phone
          L1_2.unlock = false
          L1_2 = debugprint
          L2_2 = "Unlock phone permission is disabled for police because phone item is not unique"
          L1_2(L2_2)
        end
      end
    end
  end
  return L0_2
end
L9_1 = ReactCallback
L10_1 = "Police"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = A0_2.action
  if "getPermissions" == L1_2 then
    L2_2 = L8_1
    return L2_2()
  elseif "getActiveUnits" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:getActiveUnits"
    return L2_2(L3_2)
  elseif "getLogs" == L1_2 then
    L2_2 = A0_2.query
    if "" == L2_2 then
      A0_2.query = nil
    end
    L2_2 = AwaitCallback
    L3_2 = "police:getLogs"
    L4_2 = A0_2.query
    L5_2 = A0_2.lastId
    return L2_2(L3_2, L4_2, L5_2)
  end
  if "getUnits" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:getUnits"
    return L2_2(L3_2)
  elseif "addUnit" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:addUnit"
    L4_2 = A0_2.name
    return L2_2(L3_2, L4_2)
  elseif "deleteUnit" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:deleteUnit"
    L4_2 = A0_2.unit
    return L2_2(L3_2, L4_2)
  elseif "updateUnitStatus" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:updateUnitStatus"
    L4_2 = A0_2.unit
    L5_2 = A0_2.status
    return L2_2(L3_2, L4_2, L5_2)
  elseif "renameUnit" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:renameUnit"
    L4_2 = A0_2.unit
    L5_2 = A0_2.name
    return L2_2(L3_2, L4_2, L5_2)
  elseif "assignOfficerToUnit" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:assignOfficerToUnit"
    L4_2 = A0_2.unit
    L5_2 = A0_2.officerId
    return L2_2(L3_2, L4_2, L5_2)
  elseif "removeOfficerFromUnit" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:removeOfficerFromUnit"
    L4_2 = A0_2.officerId
    return L2_2(L3_2, L4_2)
  end
  if "getOffences" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:getOffences"
    return L2_2(L3_2)
  elseif "addOffenceCategory" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:addOffenceCategory"
    L4_2 = A0_2.category
    return L2_2(L3_2, L4_2)
  elseif "updateOffenceCategory" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:updateOffenceCategory"
    L4_2 = A0_2.oldCategory
    L5_2 = A0_2.newCategory
    return L2_2(L3_2, L4_2, L5_2)
  elseif "deleteOffenceCategory" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:deleteOffenceCategory"
    L4_2 = A0_2.category
    return L2_2(L3_2, L4_2)
  elseif "addOffence" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:addOffence"
    L4_2 = A0_2.category
    L5_2 = A0_2.data
    return L2_2(L3_2, L4_2, L5_2)
  elseif "updateOffence" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:updateOffence"
    L4_2 = A0_2.id
    L5_2 = A0_2.data
    return L2_2(L3_2, L4_2, L5_2)
  elseif "deleteOffence" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:deleteOffence"
    L4_2 = A0_2.id
    return L2_2(L3_2, L4_2)
  end
  if "getTags" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:getTags"
    return L2_2(L3_2)
  elseif "createTag" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:createTag"
    L4_2 = A0_2.tag
    L5_2 = A0_2.color
    L6_2 = A0_2.type
    return L2_2(L3_2, L4_2, L5_2, L6_2)
  elseif "deleteTag" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:deleteTag"
    L4_2 = A0_2.id
    return L2_2(L3_2, L4_2)
  elseif "addTag" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:addTag"
    L4_2 = A0_2.id
    L5_2 = A0_2.tag
    return L2_2(L3_2, L4_2, L5_2)
  elseif "removeTag" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:removeTag"
    L4_2 = A0_2.id
    L5_2 = A0_2.tag
    return L2_2(L3_2, L4_2, L5_2)
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
    L3_2 = "police:updateProfile"
    L4_2 = A0_2
    return L2_2(L3_2, L4_2)
  elseif "revokeLicense" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:revokeLicense"
    L4_2 = A0_2.id
    L5_2 = A0_2.license
    return L2_2(L3_2, L4_2, L5_2)
  elseif "addLicense" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:addLicense"
    L4_2 = A0_2.id
    L5_2 = A0_2.license
    return L2_2(L3_2, L4_2, L5_2)
  elseif "getAllLicenses" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:getAllLicenses"
    return L2_2(L3_2)
  end
  if "searchProperties" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:searchProperties"
    L4_2 = A0_2.query
    L5_2 = A0_2.filter
    L6_2 = A0_2.page
    return L2_2(L3_2, L4_2, L5_2, L6_2)
  elseif "fetchProperty" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:getProperty"
    L4_2 = A0_2.id
    L2_2 = L2_2(L3_2, L4_2)
    if L2_2 then
      L3_2 = L2_2.avatar
      L2_2.picture = L3_2
      L2_2.avatar = nil
    end
    return L2_2
  elseif "updateProperty" == L1_2 then
    L2_2 = A0_2.data
    L2_2.type = "property"
    L2_2 = AwaitCallback
    L3_2 = "police:updateProfile"
    L4_2 = A0_2.data
    return L2_2(L3_2, L4_2)
  end
  if "searchWeapons" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:searchWeapons"
    L4_2 = A0_2.query
    L5_2 = A0_2.filter
    L6_2 = A0_2.page
    return L2_2(L3_2, L4_2, L5_2, L6_2)
  elseif "fetchWeapon" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:fetchWeapon"
    L4_2 = A0_2.id
    return L2_2(L3_2, L4_2)
  elseif "getWeapons" == L1_2 then
    L2_2 = GetWeaponsList
    return L2_2()
  elseif "registerWeapon" == L1_2 then
    L2_2 = A0_2.data
    L2_2.type = "weapon"
    L2_2 = A0_2.data
    L3_2 = "weapon:"
    L4_2 = A0_2.data
    L4_2 = L4_2.serialNumber
    L3_2 = L3_2 .. L4_2
    L2_2.id = L3_2
    L2_2 = AwaitCallback
    L3_2 = "police:registerWeapon"
    L4_2 = A0_2.data
    L2_2 = L2_2(L3_2, L4_2)
    if not L2_2 then
      L2_2 = false
      return L2_2
    end
    L2_2 = AwaitCallback
    L3_2 = "police:updateProfile"
    L4_2 = A0_2.data
    L2_2(L3_2, L4_2)
    L2_2 = true
    return L2_2
  elseif "deleteWeapon" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:deleteWeapon"
    L4_2 = A0_2.id
    return L2_2(L3_2, L4_2)
  elseif "updateWeapon" == L1_2 then
    L2_2 = A0_2.data
    L2_2.type = "weapon"
    L2_2 = AwaitCallback
    L3_2 = "police:updateProfile"
    L4_2 = A0_2.data
    return L2_2(L3_2, L4_2)
  end
  if "searchVehicles" == L1_2 then
    L2_2 = L3_1
    L3_2 = A0_2.query
    L4_2 = A0_2.filter
    L5_2 = A0_2.page
    return L2_2(L3_2, L4_2, L5_2)
  elseif "fetchVehicle" == L1_2 then
    L2_2 = L4_1
    L3_2 = A0_2.plate
    return L2_2(L3_2)
  end
  if "getEmployees" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:getEmployees"
    return L2_2(L3_2)
  elseif "getUser" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:getLoggedIn"
    L4_2 = A0_2
    return L2_2(L3_2, L4_2)
  elseif "updateUser" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:updateOwnAccount"
    L4_2 = A0_2.callsign
    L5_2 = A0_2.avatar
    return L2_2(L3_2, L4_2, L5_2)
  end
  if "saveReport" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:saveReport"
    L4_2 = A0_2
    return L2_2(L3_2, L4_2)
  elseif "getReports" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:getReports"
    L4_2 = A0_2.page
    L5_2 = A0_2.query
    L6_2 = A0_2.filter
    return L2_2(L3_2, L4_2, L5_2, L6_2)
  elseif "getReport" == L1_2 then
    L2_2 = L6_1
    L3_2 = A0_2.id
    return L2_2(L3_2)
  elseif "deleteReport" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:deleteReport"
    L4_2 = A0_2.id
    return L2_2(L3_2, L4_2)
  end
  if "saveCase" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:saveCase"
    L4_2 = A0_2
    return L2_2(L3_2, L4_2)
  elseif "getCases" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:getCases"
    L4_2 = A0_2.page
    L5_2 = A0_2.query
    L6_2 = A0_2.filter
    return L2_2(L3_2, L4_2, L5_2, L6_2)
  elseif "getCase" == L1_2 then
    L2_2 = L5_1
    L3_2 = A0_2.id
    return L2_2(L3_2)
  elseif "deleteCase" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:deleteCase"
    L4_2 = A0_2.id
    return L2_2(L3_2, L4_2)
  else
    if "openStash" == L1_2 then
      L2_2 = Config
      L2_2 = L2_2.EvidenceStash
      if L2_2 then
        L2_2 = AwaitCallback
        L3_2 = "police:openStash"
        L4_2 = A0_2.id
        return L2_2(L3_2, L4_2)
    end
    elseif "finePlayer" == L1_2 then
      L2_2 = AwaitCallback
      L3_2 = "police:finePlayer"
      L4_2 = A0_2.id
      L5_2 = A0_2.fine
      L6_2 = A0_2.label
      L7_2 = A0_2.caseId
      return L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
    end
  end
  if "saveWarrant" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:saveWarrant"
    L4_2 = A0_2.data
    return L2_2(L3_2, L4_2)
  elseif "getWarrants" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:getWarrants"
    L4_2 = A0_2.page
    L5_2 = A0_2.query
    L6_2 = A0_2.filter
    return L2_2(L3_2, L4_2, L5_2, L6_2)
  elseif "getWarrant" == L1_2 then
    L2_2 = L7_1
    L3_2 = A0_2.id
    return L2_2(L3_2)
  elseif "deleteWarrant" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:deleteWarrant"
    L4_2 = A0_2.id
    return L2_2(L3_2, L4_2)
  end
  if "getBulletinBoard" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:getBulletinBoard"
    L4_2 = A0_2.page
    L5_2 = A0_2.query
    return L2_2(L3_2, L4_2, L5_2)
  elseif "saveBulletin" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:saveBulletin"
    L4_2 = A0_2.id
    L5_2 = A0_2.title
    L6_2 = A0_2.content
    return L2_2(L3_2, L4_2, L5_2, L6_2)
  elseif "toggleBulletinPinned" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:toggleBulletinPinned"
    L4_2 = A0_2.id
    L5_2 = A0_2.pinned
    return L2_2(L3_2, L4_2, L5_2)
  elseif "deleteBulletin" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:deleteBulletin"
    L4_2 = A0_2.id
    return L2_2(L3_2, L4_2)
  end
  if "getJailees" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:getPrisoners"
    L4_2 = A0_2.query
    L5_2 = A0_2.lastId
    return L2_2(L3_2, L4_2, L5_2)
  elseif "jailPlayer" == L1_2 then
    L2_2 = nil
    L3_2 = A0_2.case
    if L3_2 then
      L3_2 = type
      L4_2 = A0_2.case
      L3_2 = L3_2(L4_2)
      if "table" == L3_2 then
        L3_2 = A0_2.case
        L3_2 = L3_2.id
        if L3_2 then
          L3_2 = A0_2.case
          L2_2 = L3_2.id
        end
      end
    end
    L3_2 = AwaitCallback
    L4_2 = "police:jailPlayer"
    L5_2 = A0_2.id
    L6_2 = A0_2.sentence
    L7_2 = A0_2.description
    L8_2 = L2_2
    return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  elseif "unjail" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:unjailPlayer"
    L4_2 = A0_2.id
    L2_2 = L2_2(L3_2, L4_2)
    if not L2_2 then
      L2_2 = false
    end
    return L2_2
  elseif "getJailee" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:getPrisoner"
    L4_2 = A0_2.id
    return L2_2(L3_2, L4_2)
  elseif "updateJailee" == L1_2 then
    L2_2 = nil
    L3_2 = A0_2.case
    if L3_2 then
      L3_2 = type
      L4_2 = A0_2.case
      L3_2 = L3_2(L4_2)
      if "table" == L3_2 then
        L3_2 = A0_2.case
        L3_2 = L3_2.id
        if L3_2 then
          L3_2 = A0_2.case
          L2_2 = L3_2.id
        end
      end
    end
    L3_2 = AwaitCallback
    L4_2 = "police:updatePrisoner"
    L5_2 = A0_2.id
    L6_2 = A0_2.description
    L7_2 = L2_2
    return L3_2(L4_2, L5_2, L6_2, L7_2)
  end
  if "getUnreadChats" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:getUnreadChats"
    return L2_2(L3_2)
  elseif "getChatRooms" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:getChatRooms"
    L4_2 = A0_2.page
    L5_2 = A0_2.query
    return L2_2(L3_2, L4_2, L5_2)
  elseif "getPublicChatRooms" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:getPublicChatRooms"
    L4_2 = A0_2.page
    L5_2 = A0_2.query
    return L2_2(L3_2, L4_2, L5_2)
  elseif "createChat" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:createChat"
    L4_2 = A0_2.name
    L5_2 = A0_2.private
    return L2_2(L3_2, L4_2, L5_2)
  elseif "togglePrivate" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:toggleChatPrivate"
    L4_2 = A0_2.id
    L5_2 = A0_2.toggle
    return L2_2(L3_2, L4_2, L5_2)
  elseif "setChatRoomAvatar" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:setChatIcon"
    L4_2 = A0_2.id
    L5_2 = A0_2.avatar
    return L2_2(L3_2, L4_2, L5_2)
  elseif "getChatMembers" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:getChatMembers"
    L4_2 = A0_2.id
    return L2_2(L3_2, L4_2)
  elseif "inviteToChat" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:inviteToChat"
    L4_2 = A0_2.id
    L5_2 = A0_2.user
    return L2_2(L3_2, L4_2, L5_2)
  elseif "kickFromChat" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:kickFromChat"
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
    L3_2 = "police:sendMessage"
    L4_2 = A0_2.id
    L5_2 = A0_2.content
    L6_2 = A0_2.attachments
    return L2_2(L3_2, L4_2, L5_2, L6_2)
  elseif "leaveChat" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:leaveChat"
    L4_2 = A0_2.id
    return L2_2(L3_2, L4_2)
  elseif "joinChat" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:joinChat"
    L4_2 = A0_2.id
    return L2_2(L3_2, L4_2)
  elseif "clearChatNotifications" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:clearChatNotifications"
    L4_2 = A0_2.id
    return L2_2(L3_2, L4_2)
  end
  if "getServiceConfig" == L1_2 then
    L2_2 = {}
    L3_2 = GetCellTowers
    L3_2 = L3_2()
    L4_2 = 1
    L5_2 = #L3_2
    L6_2 = 1
    for L7_2 = L4_2, L5_2, L6_2 do
      L8_2 = L3_2[L7_2]
      L9_2 = {}
      L10_2 = L8_2.x
      L9_2.x = L10_2
      L10_2 = L8_2.y
      L9_2.y = L10_2
      L10_2 = L8_2.z
      L9_2.z = L10_2
      L2_2[L7_2] = L9_2
    end
    L4_2 = {}
    L5_2 = GetPhoneConfig
    L5_2 = L5_2()
    L5_2 = L5_2.CellTowers
    L5_2 = L5_2.Range
    L4_2.rangeData = L5_2
    L4_2.cellTowers = L2_2
    return L4_2
  elseif "triangulate" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:triangulate"
    L4_2 = A0_2.phoneNumber
    return L2_2(L3_2, L4_2)
  end
  if "getPhones" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:getPhones"
    return L2_2(L3_2)
  elseif "unlockPhone" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:unlockPhone"
    L4_2 = A0_2.phoneNumber
    L5_2 = A0_2.name
    return L2_2(L3_2, L4_2, L5_2)
  elseif "resetPin" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:resetPin"
    L4_2 = A0_2.phoneNumber
    return L2_2(L3_2, L4_2)
  end
  if "getWiretaps" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:getWiretaps"
    L4_2 = A0_2.page
    L5_2 = A0_2.query
    L6_2 = A0_2.filter
    return L2_2(L3_2, L4_2, L5_2, L6_2)
  elseif "getCallHistory" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:getCallHistory"
    L4_2 = A0_2.phoneNumber
    L5_2 = A0_2.page
    L6_2 = A0_2.query
    return L2_2(L3_2, L4_2, L5_2, L6_2)
  elseif "wiretapNumber" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:wiretapNumber"
    L4_2 = A0_2.phoneNumber
    return L2_2(L3_2, L4_2)
  elseif "removeWiretap" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:removeWiretap"
    L4_2 = A0_2.phoneNumber
    return L2_2(L3_2, L4_2)
  elseif "toggleSubscribeWiretap" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:toggleSubscribeWiretap"
    L4_2 = A0_2.phoneNumber
    L5_2 = A0_2.subscribe
    return L2_2(L3_2, L4_2, L5_2)
  elseif "listenToWiretap" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:listenToWiretap"
    L4_2 = A0_2.phoneNumber
    return L2_2(L3_2, L4_2)
  elseif "stopListeningToWiretap" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "police:stopListeningToWiretap"
    return L2_2(L3_2)
  end
  L2_2 = debugprint
  L3_2 = "Unknown action Police:"
  L4_2 = tostring
  L5_2 = L1_2
  L4_2 = L4_2(L5_2)
  L3_2 = L3_2 .. L4_2
  L2_2(L3_2)
end
L12_1 = false
L13_1 = true
L14_1 = {}
L15_1 = "jailPlayer"
L16_1 = "finePlayer"
L14_1[1] = L15_1
L14_1[2] = L16_1
L9_1(L10_1, L11_1, L12_1, L13_1, L14_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:createdTag"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "police:tagCreated"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:deletedTag"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "police:tagDeleted"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:addedTag"
function L11_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = SendReactMessage
  L4_2 = "police:tagAdded"
  L5_2 = {}
  L5_2.id = A0_2
  L5_2.type = A1_2
  L5_2.tagId = A2_2
  L3_2(L4_2, L5_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:removedTag"
function L11_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = SendReactMessage
  L4_2 = "police:tagRemoved"
  L5_2 = {}
  L5_2.id = A0_2
  L5_2.type = A1_2
  L5_2.tagId = A2_2
  L3_2(L4_2, L5_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:profileUpdated"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "police:profileUpdated"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:reportUpdated"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "police:reportUpdated"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:reportDeleted"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "police:reportDeleted"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:caseUpdated"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "police:caseUpdated"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:caseDeleted"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "police:caseDeleted"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:warrantUpdated"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "police:warrantUpdated"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:warrantDeleted"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "police:warrantDeleted"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:bulletinCreated"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "police:bulletinCreated"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:bulletinUpdated"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "police:bulletinUpdated"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:bulletinDeleted"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "police:bulletinDeleted"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:addOffenceCategory"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "police:addOffenceCategory"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:updateOffenceCategory"
function L11_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = SendReactMessage
  L3_2 = "police:updateOffenceCategory"
  L4_2 = {}
  L4_2.oldCategory = A0_2
  L4_2.newCategory = A1_2
  L2_2(L3_2, L4_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:deleteOffenceCategory"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "police:deleteOffenceCategory"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:addOffence"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "police:addOffence"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:updateOffence"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "police:updateOffence"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:deleteOffence"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "police:deleteOffence"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:revokedLicense"
function L11_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = SendReactMessage
  L3_2 = "police:licenseRevoked"
  L4_2 = {}
  L4_2.id = A0_2
  L4_2.license = A1_2
  L2_2(L3_2, L4_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:licenseAdded"
function L11_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = SendReactMessage
  L3_2 = "police:licenseAdded"
  L4_2 = {}
  L4_2.id = A0_2
  L4_2.license = A1_2
  L2_2(L3_2, L4_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:newPrisoner"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = A0_2.identifier
  A0_2.id = L1_2
  L1_2 = SendReactMessage
  L2_2 = "police:newPrisoner"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:prisonerReleased"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "police:prisonerReleased"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:updateCallsign"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "police:updateCallsign"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:weaponDeleted"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "police:weaponDeleted"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:setInCall"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "police:setInCall"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:removeWiretap"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "police:removeWiretap"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L9_1(L10_1, L11_1)
L9_1 = RegisterNetEvent
L10_1 = "tablet:police:createWiretap"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = debugprint
  L2_2 = "police:createWiretap"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
  L1_2 = SendReactMessage
  L2_2 = "police:createWiretap"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L9_1(L10_1, L11_1)
L9_1 = SetTimeout
L10_1 = 500
function L11_1()
  local L0_2, L1_2, L2_2
  L0_2 = RegisterDutyBlipsListener
  L1_2 = "police"
  L2_2 = IsPolice
  L0_2(L1_2, L2_2)
end
L9_1(L10_1, L11_1)
L9_1 = AddEventHandler
L10_1 = "lb-tablet:jobUpdated"
function L11_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = debugprint
  L1_2 = "Police: job updated, refreshing permissions etc"
  L0_2(L1_2)
  L0_2 = IsPolice
  L0_2 = L0_2()
  L1_2 = Config
  L1_2 = L1_2.RequireDutyMDT
  if L1_2 then
    L1_2 = IsOnDuty
    L1_2 = L1_2()
    if not L1_2 then
      L1_2 = debugprint
      L2_2 = "Not on duty, removing police app"
      L1_2(L2_2)
      L0_2 = false
    end
  end
  L1_2 = {}
  L1_2.app = "police"
  L1_2.hasAccess = L0_2
  if L0_2 then
    L2_2 = PoliceAppData
    if L2_2 then
      goto lbl_28
    end
  end
  L2_2 = nil
  ::lbl_28::
  L1_2.appData = L2_2
  L2_2 = debugprint
  L3_2 = "Police: setHasAccess:"
  L4_2 = L1_2
  L2_2(L3_2, L4_2)
  L2_2 = SendReactMessage
  L3_2 = "police:updatePermissions"
  L4_2 = L8_1
  L4_2 = L4_2()
  L2_2(L3_2, L4_2)
  L2_2 = SendReactMessage
  L3_2 = "app:setHasAccess"
  L4_2 = L1_2
  L2_2(L3_2, L4_2)
end
L9_1(L10_1, L11_1)
