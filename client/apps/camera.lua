local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = false
L1_1 = false
L2_1 = nil
L3_1 = nil
L4_1 = {}
L4_1.selfies = "selfie"
L4_1.screenshots = "screenshot"
L4_1.imports = "import"
function L5_1()
  local L0_2, L1_2
  L0_2 = L3_1
  if not L0_2 then
    L0_2 = AwaitCallback
    L1_2 = "camera:getBaseUrl"
    L0_2 = L0_2(L1_2)
  end
  L3_1 = L0_2
  L0_2 = L3_1
  return L0_2
end
GetBaseUrl = L5_1
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = nil
  L2_2 = CustomGetUploadMethod
  if L2_2 then
    L2_2 = CustomGetUploadMethod
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    L1_2 = L2_2
  else
    L2_2 = UploadMethods
    L3_2 = Config
    L3_2 = L3_2.UploadMethod
    L3_2 = L3_2[A0_2]
    L2_2 = L2_2[L3_2]
    if not L2_2 then
      L3_2 = infoprint
      L4_2 = "error"
      L5_2 = "Upload methods not found for "
      L6_2 = A0_2
      L3_2(L4_2, L5_2, L6_2)
      return
    end
    L3_2 = L2_2[A0_2]
    L1_2 = L3_2 or L1_2
    if not L3_2 then
      L1_2 = L2_2.Default
    end
    if not L1_2 then
      L3_2 = infoprint
      L4_2 = "error"
      L5_2 = "Upload method not found for "
      L6_2 = A0_2
      L3_2(L4_2, L5_2, L6_2)
      return
    end
  end
  L2_2 = L1_2.method
  if not L2_2 then
    L2_2 = Config
    L2_2 = L2_2.UploadMethod
    L2_2 = L2_2[A0_2]
    L1_2.method = L2_2
  end
  L2_2 = L1_2.sendPlayer
  if L2_2 then
    L2_2 = TabletId
    if L2_2 then
      L2_2 = {}
      L3_2 = TabletId
      L2_2.identifier = L3_2
      L3_2 = GetPlayerName
      L4_2 = PlayerId
      L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L4_2()
      L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
      L2_2.name = L3_2
      L1_2.player = L2_2
    end
  end
  L2_2 = L1_2.url
  L3_2 = L2_2
  L2_2 = L2_2.find
  L4_2 = "BASE_URL"
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L2_2 = L1_2.url
    L3_2 = L2_2
    L2_2 = L2_2.gsub
    L4_2 = "BASE_URL"
    L5_2 = GetBaseUrl
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L5_2()
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
    L1_2.url = L2_2
  end
  L2_2 = false
  L3_2 = L1_2.url
  L4_2 = L3_2
  L3_2 = L3_2.find
  L5_2 = "API_KEY"
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L2_2 = true
  else
    L3_2 = L1_2.headers
    if L3_2 then
      L3_2 = pairs
      L4_2 = L1_2.headers
      L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
      for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
        L10_2 = L8_2
        L9_2 = L8_2.find
        L11_2 = "API_KEY"
        L9_2 = L9_2(L10_2, L11_2)
        if L9_2 then
          L2_2 = true
          break
        end
      end
    end
  end
  if L2_2 then
    L3_2 = AwaitCallback
    L4_2 = "camera:getUploadApiKey"
    L5_2 = A0_2
    L3_2 = L3_2(L4_2, L5_2)
    L4_2 = L1_2.url
    L5_2 = L4_2
    L4_2 = L4_2.gsub
    L6_2 = "API_KEY"
    L7_2 = L3_2
    L4_2 = L4_2(L5_2, L6_2, L7_2)
    L1_2.url = L4_2
    L4_2 = L1_2.headers
    if L4_2 then
      L4_2 = pairs
      L5_2 = L1_2.headers
      L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
      for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
        L10_2 = L1_2.headers
        L12_2 = L9_2
        L11_2 = L9_2.gsub
        L13_2 = "API_KEY"
        L14_2 = L3_2
        L11_2 = L11_2(L12_2, L13_2, L14_2)
        L10_2[L8_2] = L11_2
      end
    end
  end
  L3_2 = L1_2.url
  L4_2 = L3_2
  L3_2 = L3_2.find
  L5_2 = "PRESIGNED_URL"
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L3_2 = AwaitCallback
    L4_2 = "camera:getPresignedUrl"
    L5_2 = A0_2
    L3_2 = L3_2(L4_2, L5_2)
    if not L3_2 then
      L4_2 = infoprint
      L5_2 = "error"
      L6_2 = "Failed to get presigned url for "
      L7_2 = A0_2
      L6_2 = L6_2 .. L7_2
      L4_2(L5_2, L6_2)
      return
    end
    L4_2 = L1_2.url
    L5_2 = L4_2
    L4_2 = L4_2.gsub
    L6_2 = "PRESIGNED_URL"
    L7_2 = L3_2
    L4_2 = L4_2(L5_2, L6_2, L7_2)
    L1_2.presignedUrl = L4_2
  end
  return L1_2
end
function L6_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  if not A0_2 then
    L3_2 = {}
    A0_2 = L3_2
  end
  L3_2 = A0_2.album
  if "recents" == L3_2 then
    A0_2.album = nil
  else
    L3_2 = A0_2.album
    if "favourites" == L3_2 then
      A0_2.album = nil
      A0_2.favourites = true
    end
  end
  L3_2 = A0_2.type
  if "videos" == L3_2 then
    L3_2 = {}
    L3_2.showPhotos = false
    L3_2.showVideos = true
    A0_2 = L3_2
  end
  L3_2 = A0_2.type
  if L3_2 then
    A0_2.album = nil
    L4_2 = A0_2.type
    L3_2 = L4_1
    L3_2 = L3_2[L4_2]
    if L3_2 then
      L4_2 = A0_2.type
      L3_2 = L4_1
      L3_2 = L3_2[L4_2]
      A0_2.type = L3_2
    else
      L3_2 = A0_2.type
      if "duplicates" == L3_2 then
        A0_2.type = nil
        A0_2.duplicates = true
      else
        A0_2.type = nil
      end
    end
  end
  L3_2 = A0_2.showPhotos
  if not L3_2 then
    L3_2 = A0_2.showVideos
    if not L3_2 then
      A0_2.showPhotos = true
      A0_2.showVideos = true
    end
  end
  L3_2 = AwaitCallback
  L4_2 = "camera:getPhotos"
  L5_2 = A0_2
  L6_2 = A1_2 or L6_2
  if not A1_2 then
    L6_2 = 0
  end
  L7_2 = A2_2
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  L4_2 = {}
  L5_2 = 1
  L6_2 = #L3_2
  L7_2 = 1
  for L8_2 = L5_2, L6_2, L7_2 do
    L9_2 = L3_2[L8_2]
    L10_2 = {}
    L11_2 = L9_2.id
    L10_2.id = L11_2
    L11_2 = L9_2.link
    L10_2.src = L11_2
    L11_2 = L9_2.is_video
    L10_2.isVideo = L11_2
    L11_2 = L9_2.metadata
    L10_2.type = L11_2
    L11_2 = L9_2.is_favourite
    L10_2.favourite = L11_2
    L11_2 = L9_2.created_at
    L10_2.timestamp = L11_2
    L11_2 = L9_2.size
    L10_2.size = L11_2
    L4_2[L8_2] = L10_2
  end
  return L4_2
end
function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = L2_1
  if not L0_2 then
    L0_2 = L1_1
    if not L0_2 then
      L0_2 = L0_1
      if L0_2 then
        L0_2 = Config
        L0_2 = L0_2.Camera
        L0_2 = L0_2.ShowTip
        if false ~= L0_2 then
          goto lbl_16
        end
      end
    end
  end
  do return end
  ::lbl_16::
  L0_2 = {}
  L1_2 = Config
  L1_2 = L1_2.KeyBinds
  L1_2 = L1_2.TakePhoto
  if L1_2 then
    L1_2 = L1_2.bindData
  end
  if L1_2 then
    L1_2 = #L0_2
    L1_2 = L1_2 + 1
    L2_2 = L
    L3_2 = "BACKEND.CAMERA.TAKE_PHOTO"
    L4_2 = {}
    L5_2 = Config
    L5_2 = L5_2.KeyBinds
    L5_2 = L5_2.TakePhoto
    L5_2 = L5_2.bindData
    L5_2 = L5_2.instructional
    L4_2.key = L5_2
    L2_2 = L2_2(L3_2, L4_2)
    L0_2[L1_2] = L2_2
  end
  L1_2 = Config
  L1_2 = L1_2.KeyBinds
  L1_2 = L1_2.FlipCamera
  if L1_2 then
    L1_2 = L1_2.bindData
  end
  if L1_2 then
    L1_2 = #L0_2
    L1_2 = L1_2 + 1
    L2_2 = L
    L3_2 = "BACKEND.CAMERA.FLIP_CAMERA"
    L4_2 = {}
    L5_2 = Config
    L5_2 = L5_2.KeyBinds
    L5_2 = L5_2.FlipCamera
    L5_2 = L5_2.bindData
    L5_2 = L5_2.instructional
    L4_2.key = L5_2
    L2_2 = L2_2(L3_2, L4_2)
    L0_2[L1_2] = L2_2
  end
  L1_2 = Config
  L1_2 = L1_2.KeyBinds
  L1_2 = L1_2.ToggleFlash
  if L1_2 then
    L1_2 = L1_2.bindData
  end
  if L1_2 then
    L1_2 = #L0_2
    L1_2 = L1_2 + 1
    L2_2 = L
    L3_2 = "BACKEND.CAMERA.TOGGLE_FLASH"
    L4_2 = {}
    L5_2 = Config
    L5_2 = L5_2.KeyBinds
    L5_2 = L5_2.ToggleFlash
    L5_2 = L5_2.bindData
    L5_2 = L5_2.instructional
    L4_2.key = L5_2
    L2_2 = L2_2(L3_2, L4_2)
    L0_2[L1_2] = L2_2
  end
  L1_2 = Config
  L1_2 = L1_2.KeyBinds
  L1_2 = L1_2.LeftMode
  if L1_2 then
    L1_2 = L1_2.bindData
  end
  if L1_2 then
    L1_2 = Config
    L1_2 = L1_2.KeyBinds
    L1_2 = L1_2.RightMode
    if L1_2 then
      L1_2 = L1_2.bindData
    end
    if L1_2 then
      L1_2 = #L0_2
      L1_2 = L1_2 + 1
      L2_2 = L
      L3_2 = "BACKEND.CAMERA.CHANGE_MODE"
      L4_2 = {}
      L5_2 = Config
      L5_2 = L5_2.KeyBinds
      L5_2 = L5_2.LeftMode
      L5_2 = L5_2.bindData
      L5_2 = L5_2.instructional
      L4_2.key = L5_2
      L5_2 = Config
      L5_2 = L5_2.KeyBinds
      L5_2 = L5_2.RightMode
      L5_2 = L5_2.bindData
      L5_2 = L5_2.instructional
      L4_2.key2 = L5_2
      L2_2 = L2_2(L3_2, L4_2)
      L0_2[L1_2] = L2_2
    end
  end
  L1_2 = Config
  L1_2 = L1_2.KeyBinds
  L1_2 = L1_2.RollLeft
  if L1_2 then
    L1_2 = L1_2.bindData
  end
  if L1_2 then
    L1_2 = Config
    L1_2 = L1_2.KeyBinds
    L1_2 = L1_2.RollRight
    if L1_2 then
      L1_2 = L1_2.bindData
    end
    if L1_2 then
      L1_2 = #L0_2
      L1_2 = L1_2 + 1
      L2_2 = L
      L3_2 = "BACKEND.CAMERA.ROLL"
      L4_2 = {}
      L5_2 = Config
      L5_2 = L5_2.KeyBinds
      L5_2 = L5_2.RollLeft
      L5_2 = L5_2.bindData
      L5_2 = L5_2.instructional
      L4_2.key = L5_2
      L5_2 = Config
      L5_2 = L5_2.KeyBinds
      L5_2 = L5_2.RollRight
      L5_2 = L5_2.bindData
      L5_2 = L5_2.instructional
      L4_2.key2 = L5_2
      L2_2 = L2_2(L3_2, L4_2)
      L0_2[L1_2] = L2_2
    end
  end
  L1_2 = Config
  L1_2 = L1_2.Camera
  if L1_2 then
    L1_2 = L1_2.Freeze
  end
  if L1_2 then
    L1_2 = L1_2.Enabled
  end
  if L1_2 then
    L1_2 = Config
    L1_2 = L1_2.KeyBinds
    L1_2 = L1_2.FreezeCamera
    if L1_2 then
      L1_2 = L1_2.bindData
    end
    if L1_2 then
      L1_2 = #L0_2
      L1_2 = L1_2 + 1
      L2_2 = L
      L3_2 = "BACKEND.CAMERA."
      L4_2 = IsCameraFrozen
      L4_2 = L4_2()
      if L4_2 then
        L4_2 = "UNFREEZE"
        if L4_2 then
          goto lbl_192
        end
      end
      L4_2 = "FREEZE"
      ::lbl_192::
      L3_2 = L3_2 .. L4_2
      L4_2 = {}
      L5_2 = Config
      L5_2 = L5_2.KeyBinds
      L5_2 = L5_2.FreezeCamera
      L5_2 = L5_2.bindData
      L5_2 = L5_2.instructional
      L4_2.key = L5_2
      L2_2 = L2_2(L3_2, L4_2)
      L0_2[L1_2] = L2_2
    end
  end
  L1_2 = Config
  L1_2 = L1_2.KeyBinds
  L1_2 = L1_2.Focus
  if L1_2 then
    L1_2 = L1_2.bindData
  end
  if L1_2 then
    L1_2 = #L0_2
    L1_2 = L1_2 + 1
    L2_2 = L
    L3_2 = "BACKEND.CAMERA.TOGGLE_CURSOR"
    L4_2 = {}
    L5_2 = Config
    L5_2 = L5_2.KeyBinds
    L5_2 = L5_2.Focus
    L5_2 = L5_2.bindData
    L5_2 = L5_2.instructional
    L4_2.key = L5_2
    L2_2 = L2_2(L3_2, L4_2)
    L0_2[L1_2] = L2_2
  end
  L1_2 = Config
  L1_2 = L1_2.KeyBinds
  L1_2 = L1_2.ToggleCameraTip
  if L1_2 then
    L1_2 = L1_2.bindData
  end
  if L1_2 then
    L1_2 = #L0_2
    L1_2 = L1_2 + 1
    L2_2 = L
    L3_2 = "BACKEND.CAMERA.TOGGLE_TIP"
    L4_2 = {}
    L5_2 = Config
    L5_2 = L5_2.KeyBinds
    L5_2 = L5_2.ToggleCameraTip
    L5_2 = L5_2.bindData
    L5_2 = L5_2.instructional
    L4_2.key = L5_2
    L2_2 = L2_2(L3_2, L4_2)
    L0_2[L1_2] = L2_2
  end
  L1_2 = #L0_2
  if L1_2 > 0 then
    L1_2 = table
    L1_2 = L1_2.concat
    L2_2 = L0_2
    L3_2 = "\n"
    L1_2 = L1_2(L2_2, L3_2)
    L2_2 = AddTextEntry
    L3_2 = "LB_TABLET_CAMERA_TIP"
    L4_2 = L1_2
    L2_2(L3_2, L4_2)
    L2_2 = BeginTextCommandDisplayHelp
    L3_2 = "LB_TABLET_CAMERA_TIP"
    L2_2(L3_2)
    L2_2 = EndTextCommandDisplayHelp
    L3_2 = 0
    L4_2 = true
    L5_2 = false
    L6_2 = 0
    L2_2(L3_2, L4_2, L5_2, L6_2)
  end
end
DisplayCameraTip = L7_1
L7_1 = RegisterNUICallback
L8_1 = "Camera"
function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = A0_2.action
  if "toggleHud" == L2_2 then
    L3_2 = A0_2.hide
    if L3_2 then
      L3_2 = L2_1
      if not L3_2 then
        L3_2 = SetInterval
        L4_2 = HideHudComponents
        L3_2 = L3_2(L4_2)
        L2_1 = L3_2
        L3_2 = Wait
        L4_2 = 100
        L3_2(L4_2)
    end
    else
      L3_2 = A0_2.hide
      if not L3_2 then
        L3_2 = L2_1
        if L3_2 then
          L3_2 = ClearInterval
          L4_2 = L2_1
          L3_2 = L3_2(L4_2)
          L2_1 = L3_2
        end
      end
    end
    L3_2 = A1_2
    L4_2 = true
    L3_2(L4_2)
  elseif "getLastPhoto" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "camera:getLastPhoto"
    L5_2 = A1_2
    L3_2(L4_2, L5_2)
  elseif "getImages" == L2_2 then
    L3_2 = A1_2
    L4_2 = L6_1
    L5_2 = A0_2.filter
    L6_2 = A0_2.page
    L7_2 = A0_2.lastId
    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L4_2(L5_2, L6_2, L7_2)
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  elseif "saveToGallery" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "camera:saveToGallery"
    L5_2 = A1_2
    L6_2 = A0_2.url
    L7_2 = A0_2.size
    L8_2 = A0_2.isVideo
    if L8_2 then
      L8_2 = true
      if L8_2 then
        goto lbl_63
      end
    end
    L8_2 = false
    ::lbl_63::
    L9_2 = A0_2.type
    L10_2 = A0_2.shouldLog
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  elseif "deleteFromGallery" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "camera:deleteFromGallery"
    L5_2 = A1_2
    L6_2 = A0_2.ids
    L3_2(L4_2, L5_2, L6_2)
  elseif "createAlbum" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "camera:createAlbum"
    L5_2 = A1_2
    L6_2 = A0_2.title
    L3_2(L4_2, L5_2, L6_2)
  elseif "renameAlbum" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "camera:renameAlbum"
    L5_2 = A1_2
    L6_2 = A0_2.id
    L7_2 = A0_2.title
    L3_2(L4_2, L5_2, L6_2, L7_2)
  elseif "deleteAlbum" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "camera:deleteAlbum"
    L5_2 = A1_2
    L6_2 = A0_2.id
    L3_2(L4_2, L5_2, L6_2)
  elseif "addToAlbum" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "camera:addToAlbum"
    L5_2 = A1_2
    L6_2 = A0_2.album
    L7_2 = A0_2.ids
    L3_2(L4_2, L5_2, L6_2, L7_2)
  elseif "removeFromAlbum" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "camera:removeFromAlbum"
    L5_2 = A1_2
    L6_2 = A0_2.album
    L7_2 = A0_2.ids
    L3_2(L4_2, L5_2, L6_2, L7_2)
  elseif "toggleFavourites" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "camera:toggleFavourites"
    L5_2 = A1_2
    L6_2 = A0_2.favourite
    L7_2 = A0_2.ids
    L3_2(L4_2, L5_2, L6_2, L7_2)
  elseif "getAlbums" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "camera:getHomePageData"
    L5_2 = A1_2
    L3_2(L4_2, L5_2)
  elseif "getPhoneAlbum" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "camera:getPhoneAlbum"
    L5_2 = A1_2
    L3_2(L4_2, L5_2)
  elseif "importFromPhone" == L2_2 then
    L3_2 = TriggerCallback
    L4_2 = "camera:importFromPhone"
    L5_2 = A1_2
    L6_2 = A0_2.ids
    L3_2(L4_2, L5_2, L6_2)
  elseif "getUploadMethod" == L2_2 then
    L3_2 = A1_2
    L4_2 = L5_1
    L5_2 = A0_2.uploadType
    L4_2 = L4_2(L5_2)
    if not L4_2 then
      L4_2 = false
    end
    L3_2(L4_2)
  elseif "open" == L2_2 then
    L3_2 = true
    L0_1 = L3_2
    L3_2 = DisplayCameraTip
    L3_2()
    L3_2 = EnableWalkableCam
    L3_2()
    L3_2 = A1_2
    L4_2 = true
    L3_2(L4_2)
  elseif "flipCamera" == L2_2 then
    L3_2 = ToggleSelfieCam
    L4_2 = A0_2.value
    L3_2(L4_2)
    L3_2 = A1_2
    L4_2 = true
    L3_2(L4_2)
  elseif "close" == L2_2 then
    L3_2 = false
    L0_1 = L3_2
    L3_2 = ClearAllHelpMessages
    L3_2()
    L3_2 = DisableWalkableCam
    L3_2()
    L3_2 = L2_1
    if L3_2 then
      L3_2 = ClearInterval
      L4_2 = L2_1
      L3_2 = L3_2(L4_2)
      L2_1 = L3_2
    end
    L3_2 = A1_2
    L4_2 = true
    L3_2(L4_2)
  end
end
L7_1(L8_1, L9_1)
L7_1 = AddEventHandler
L8_1 = "lb-tablet:keyPressed"
function L9_1(A0_2)
  local L1_2
  if "ToggleCameraTip" == A0_2 then
    L1_2 = L1_1
    L1_2 = not L1_2
    L1_1 = L1_2
    L1_2 = L1_1
    if L1_2 then
      L1_2 = ClearAllHelpMessages
      L1_2()
    else
      L1_2 = DisplayCameraTip
      L1_2()
    end
  end
end
L7_1(L8_1, L9_1)
