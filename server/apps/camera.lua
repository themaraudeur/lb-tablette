local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = nil
L1_1 = RegisterCallback
L2_1 = "camera:getBaseUrl"
function L3_1()
  local L0_2, L1_2, L2_2
  L0_2 = L0_1
  if not L0_2 then
    L0_2 = GetConvar
    L1_2 = "web_baseUrl"
    L2_2 = ""
    L0_2 = L0_2(L1_2, L2_2)
    L0_1 = L0_2
  end
  L0_2 = L0_1
  return L0_2
end
L1_1(L2_1, L3_1)
L1_1 = {}
L1_1.Audio = "audio"
L1_1.Image = "image"
L1_1.Video = "video"
L2_1 = RegisterCallback
L3_1 = "camera:getPresignedUrl"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = L1_1
  L2_2 = L2_2[A1_2]
  if not L2_2 then
    return
  end
  L3_2 = Config
  L3_2 = L3_2.UploadMethod
  L3_2 = L3_2[A1_2]
  if "Fivemanage" ~= L3_2 then
    L3_2 = GetPresignedUrl
    if L3_2 then
      L3_2 = GetPresignedUrl
      L4_2 = A0_2
      L5_2 = A1_2
      return L3_2(L4_2, L5_2)
    else
      L3_2 = infoprint
      L4_2 = "warning"
      L5_2 = "GetPresignedUrl has not been set up. Set it up in lb-tablet/server/custom/functions/functions.lua, or change your upload method to Fivemanage."
      L3_2(L4_2, L5_2)
    end
    return
  end
  L3_2 = promise
  L3_2 = L3_2.new
  L3_2 = L3_2()
  L4_2 = PerformHttpRequest
  L5_2 = "https://fmapi.net/api/v2/presigned-url?fileType="
  L6_2 = L2_2
  L5_2 = L5_2 .. L6_2
  function L6_2(A0_3, A1_3, A2_3, A3_3)
    local L4_3, L5_3, L6_3, L7_3, L8_3
    if 200 ~= A0_3 then
      L4_3 = infoprint
      L5_3 = "error"
      L6_3 = "Failed to get presigned URL from Fivemanage for "
      L7_3 = L2_2
      L6_3 = L6_3 .. L7_3
      L4_3(L5_3, L6_3)
      L4_3 = print
      L5_3 = "Status:"
      L6_3 = A0_3
      L4_3(L5_3, L6_3)
      L4_3 = print
      L5_3 = "Body:"
      L6_3 = A1_3
      L4_3(L5_3, L6_3)
      L4_3 = print
      L5_3 = "Headers:"
      L6_3 = json
      L6_3 = L6_3.encode
      L7_3 = A2_3 or L7_3
      if not A2_3 then
        L7_3 = {}
      end
      L8_3 = {}
      L8_3.indent = true
      L6_3, L7_3, L8_3 = L6_3(L7_3, L8_3)
      L4_3(L5_3, L6_3, L7_3, L8_3)
      if A3_3 then
        L4_3 = print
        L5_3 = "Error:"
        L6_3 = A3_3
        L4_3(L5_3, L6_3)
      end
      L4_3 = L3_2
      L5_3 = L4_3
      L4_3 = L4_3.resolve
      L4_3(L5_3)
      return
    end
    L4_3 = json
    L4_3 = L4_3.decode
    L5_3 = A1_3
    L4_3 = L4_3(L5_3)
    L5_3 = L3_2
    L6_3 = L5_3
    L5_3 = L5_3.resolve
    L7_3 = L4_3
    if L7_3 then
      L7_3 = L7_3.data
    end
    if L7_3 then
      L7_3 = L7_3.presignedUrl
    end
    L5_3(L6_3, L7_3)
  end
  L7_2 = "GET"
  L8_2 = ""
  L9_2 = {}
  L10_2 = API_KEYS
  L10_2 = L10_2[A1_2]
  L9_2.Authorization = L10_2
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L4_2 = Citizen
  L4_2 = L4_2.Await
  L5_2 = L3_2
  return L4_2(L5_2)
end
L2_1(L3_1, L4_1)
L2_1 = RegisterCallback
L3_1 = "camera:getUploadApiKey"
function L4_1(A0_2, A1_2)
  local L2_2
  if A1_2 then
    L2_2 = API_KEYS
    L2_2 = L2_2[A1_2]
    if L2_2 then
      goto lbl_8
    end
  end
  do return end
  ::lbl_8::
  L2_2 = API_KEYS
  L2_2 = L2_2[A1_2]
  return L2_2
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "tablet:setListeningPeerId"
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = Config
  L1_2 = L1_2.Voice
  L1_2 = L1_2.RecordNearby
  if not L1_2 then
    return
  end
  L1_2 = source
  L2_2 = Player
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2.state
  L3_2 = L2_2.lbTabletListeningPeerId
  if L3_2 then
    L4_2 = TriggerClientEvent
    L5_2 = "tablet:stoppedListening"
    L6_2 = -1
    L7_2 = L3_2
    L4_2(L5_2, L6_2, L7_2)
  end
  L2_2.lbTabletListeningPeerId = A0_2
  L4_2 = debugprint
  L5_2 = L1_2
  L6_2 = "set lbTabletListeningPeerId to"
  L7_2 = A0_2
  L4_2(L5_2, L6_2, L7_2)
  if A0_2 then
    L4_2 = TriggerClientEvent
    L5_2 = "tablet:startedListening"
    L6_2 = -1
    L7_2 = L1_2
    L8_2 = A0_2
    L4_2(L5_2, L6_2, L7_2, L8_2)
  end
end
L2_1(L3_1, L4_1)
L2_1 = {}
L2_1.selfie = true
L2_1.import = true
L2_1.screenshot = true
L3_1 = BaseCallback
L4_1 = "camera:saveToGallery"
function L5_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  if A5_2 then
    L7_2 = L2_1
    L7_2 = L7_2[A5_2]
    if not L7_2 then
      L7_2 = debugprint
      L8_2 = "Invalid metadata"
      L9_2 = A5_2
      L7_2(L8_2, L9_2)
      A5_2 = nil
    end
  end
  L7_2 = IsMediaLinkAllowed
  L8_2 = A2_2
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    L7_2 = infoprint
    L8_2 = "error"
    L9_2 = "%s %s tried to save an image with a link that is not allowed:"
    L10_2 = L9_2
    L9_2 = L9_2.format
    L11_2 = A0_2
    L12_2 = A1_2
    L9_2 = L9_2(L10_2, L11_2, L12_2)
    L10_2 = A2_2
    L7_2(L8_2, L9_2, L10_2)
    L7_2 = false
    return L7_2
  end
  if A6_2 then
    L7_2 = Log
    L8_2 = A0_2
    L9_2 = "TakePhoto"
    L10_2 = "info"
    L11_2 = L
    L12_2 = "BACKEND.LOGS.TOOK_"
    if A4_2 then
      L13_2 = "VIDEO"
      if L13_2 then
        goto lbl_42
      end
    end
    L13_2 = "PHOTO"
    ::lbl_42::
    L12_2 = L12_2 .. L13_2
    L11_2 = L11_2(L12_2)
    L12_2 = {}
    L12_2.link = A2_2
    L12_2.size = A3_2
    L12_2.metadata = A5_2
    L13_2 = A2_2
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  end
  L7_2 = MySQL
  L7_2 = L7_2.insert
  L7_2 = L7_2.await
  L8_2 = "INSERT INTO lbtablet_photos (tablet_id, link, is_video, size, metadata) VALUES (?, ?, ?, ?, ?)"
  L9_2 = {}
  L10_2 = A1_2
  L11_2 = A2_2
  L12_2 = true == A4_2
  L13_2 = A3_2 or L13_2
  if not A3_2 then
    L13_2 = 0
  end
  L14_2 = A5_2
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L9_2[3] = L12_2
  L9_2[4] = L13_2
  L9_2[5] = L14_2
  return L7_2(L8_2, L9_2)
end
L3_1(L4_1, L5_1)
L3_1 = BaseCallback
L4_1 = "camera:deleteFromGallery"
function L5_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = "DELETE FROM lbtablet_photos WHERE tablet_id = ? AND id IN (?)"
  L5_2 = {}
  L6_2 = A1_2
  L7_2 = A2_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L3_2(L4_2, L5_2)
  L3_2 = true
  return L3_2
end
L3_1(L4_1, L5_1)
L3_1 = BaseCallback
L4_1 = "camera:toggleFavourites"
function L5_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = MySQL
  L4_2 = L4_2.update
  L4_2 = L4_2.await
  L5_2 = "UPDATE lbtablet_photos SET is_favourite = ? WHERE tablet_id = ? AND id IN (?)"
  L6_2 = {}
  L7_2 = true == A2_2
  L8_2 = A1_2
  L9_2 = A3_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L4_2(L5_2, L6_2)
  L4_2 = true
  return L4_2
end
L3_1(L4_1, L5_1)
L3_1 = BaseCallback
L4_1 = "camera:getLastPhoto"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = MySQL
  L2_2 = L2_2.scalar
  L2_2 = L2_2.await
  L3_2 = "SELECT link FROM lbtablet_photos WHERE tablet_id = ? ORDER BY id DESC LIMIT 1"
  L4_2 = {}
  L5_2 = A1_2
  L4_2[1] = L5_2
  return L2_2(L3_2, L4_2)
end
L3_1(L4_1, L5_1)
L3_1 = {}
L4_1 = "videos"
L5_1 = "photos"
L6_1 = "favouritesVideos"
L7_1 = "favouritesPhotos"
L8_1 = "selfiesVideos"
L9_1 = "selfiesPhotos"
L10_1 = "screenshotsVideos"
L11_1 = "screenshotsPhotos"
L12_1 = "importsVideos"
L13_1 = "importsPhotos"
L14_1 = "duplicatesPhotos"
L15_1 = "duplicatesVideos"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L3_1[7] = L10_1
L3_1[8] = L11_1
L3_1[9] = L12_1
L3_1[10] = L13_1
L3_1[11] = L14_1
L3_1[12] = L15_1
L4_1 = BaseCallback
L5_1 = "camera:getHomePageData"
function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = MySQL
  L2_2 = L2_2.single
  L2_2 = L2_2.await
  L3_2 = [[
        SELECT
            SUM(is_video = 1) AS videos,
            SUM(is_video = 0) AS photos,
            SUM(is_video = 1 AND is_favourite = 1) AS favouritesVideos,
            SUM(is_video = 0 AND is_favourite = 1) AS favouritesPhotos,
            SUM(metadata = 'selfie' AND is_video = 1) AS selfiesVideos,
            SUM(metadata = 'selfie' AND is_video = 0) AS selfiesPhotos,
            SUM(metadata = 'screenshot' AND is_video = 1) AS screenshotsVideos,
            SUM(metadata = 'screenshot' AND is_video = 0) AS screenshotsPhotos,
            SUM(metadata = 'import' AND is_video = 1) AS importsVideos,
            SUM(metadata = 'import' AND is_video = 0) AS importsPhotos

        FROM lbtablet_photos
        WHERE tablet_id = ?
    ]]
  L4_2 = {}
  L5_2 = A1_2
  L4_2[1] = L5_2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = L2_2.photos
  L4_2 = MySQL
  L4_2 = L4_2.scalar
  L4_2 = L4_2.await
  L5_2 = [[
        SELECT COUNT(DISTINCT link)
        FROM lbtablet_photos
        WHERE tablet_id = ? AND is_video = 0
    ]]
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L4_2 = L4_2(L5_2, L6_2)
  L3_2 = L3_2 - L4_2
  L2_2.duplicatesPhotos = L3_2
  L3_2 = L2_2.videos
  L4_2 = MySQL
  L4_2 = L4_2.scalar
  L4_2 = L4_2.await
  L5_2 = [[
        SELECT COUNT(DISTINCT link)
        FROM lbtablet_photos
        WHERE tablet_id = ? AND is_video = 1
    ]]
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L4_2 = L4_2(L5_2, L6_2)
  L3_2 = L3_2 - L4_2
  L2_2.duplicatesVideos = L3_2
  L3_2 = 1
  L4_2 = L3_1
  L4_2 = #L4_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = L3_1
    L7_2 = L7_2[L6_2]
    L8_2 = tonumber
    L9_2 = L2_2[L7_2]
    if not L9_2 then
      L9_2 = 0
    end
    L8_2 = L8_2(L9_2)
    L2_2[L7_2] = L8_2
  end
  L3_2 = L2_2.duplicatesPhotos
  if L3_2 > 0 then
    L3_2 = L2_2.duplicatesPhotos
    L3_2 = L3_2 + 1
    L2_2.duplicatesPhotos = L3_2
  end
  L3_2 = L2_2.duplicatesVideos
  if L3_2 > 0 then
    L3_2 = L2_2.duplicatesVideos
    L3_2 = L3_2 + 1
    L2_2.duplicatesVideos = L3_2
  end
  L3_2 = {}
  L4_2 = {}
  L4_2.id = "recents"
  L5_2 = L
  L6_2 = "APPS.PHOTOS.RECENTS"
  L5_2 = L5_2(L6_2)
  L4_2.title = L5_2
  L5_2 = L2_2.videos
  L4_2.videoCount = L5_2
  L5_2 = L2_2.photos
  L4_2.photoCount = L5_2
  L5_2 = MySQL
  L5_2 = L5_2.scalar
  L5_2 = L5_2.await
  L6_2 = "SELECT link FROM lbtablet_photos WHERE tablet_id = ? ORDER BY id DESC LIMIT 1"
  L7_2 = {}
  L8_2 = A1_2
  L7_2[1] = L8_2
  L5_2 = L5_2(L6_2, L7_2)
  L4_2.cover = L5_2
  L4_2.removable = false
  L5_2 = {}
  L5_2.id = "favourites"
  L6_2 = L
  L7_2 = "APPS.PHOTOS.FAVOURITES"
  L6_2 = L6_2(L7_2)
  L5_2.title = L6_2
  L6_2 = L2_2.favouritesVideos
  L5_2.videoCount = L6_2
  L6_2 = L2_2.favouritesPhotos
  L5_2.photoCount = L6_2
  L6_2 = MySQL
  L6_2 = L6_2.scalar
  L6_2 = L6_2.await
  L7_2 = "SELECT link FROM lbtablet_photos WHERE tablet_id = ? AND is_favourite = 1 ORDER BY id DESC LIMIT 1"
  L8_2 = {}
  L9_2 = A1_2
  L8_2[1] = L9_2
  L6_2 = L6_2(L7_2, L8_2)
  L5_2.cover = L6_2
  L5_2.removable = false
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L4_2 = MySQL
  L4_2 = L4_2.query
  L4_2 = L4_2.await
  L5_2 = [[
        SELECT
            pa.id,
            pa.title,
            (SELECT lp.link FROM lbtablet_photos lp WHERE lp.id = MAX(ap.photo_id)) AS cover,
            SUM(CASE WHEN pp.is_video = 1 THEN 1 ELSE 0 END) AS videoCount,
            SUM(CASE WHEN pp.is_video = 0 THEN 1 ELSE 0 END) AS photoCount
        FROM
            lbtablet_photo_albums pa
        LEFT JOIN
            lbtablet_photo_album_photos ap ON ap.album_id = pa.id
        LEFT JOIN
            lbtablet_photos pp ON pp.id = ap.photo_id
        WHERE
            pa.tablet_id = ?
        GROUP BY
            pa.id
        ORDER BY
            pa.id ASC
    ]]
  L6_2 = {}
  L7_2 = A1_2
  L6_2[1] = L7_2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = 1
  L6_2 = #L4_2
  L7_2 = 1
  for L8_2 = L5_2, L6_2, L7_2 do
    L9_2 = L4_2[L8_2]
    L9_2.removable = true
    L10_2 = #L3_2
    L10_2 = L10_2 + 1
    L11_2 = L4_2[L8_2]
    L3_2[L10_2] = L11_2
  end
  L5_2 = 1
  L6_2 = #L3_2
  L7_2 = 1
  for L8_2 = L5_2, L6_2, L7_2 do
    L9_2 = L3_2[L8_2]
    L10_2 = L9_2.photoCount
    L11_2 = L9_2.videoCount
    L10_2 = L10_2 + L11_2
    L9_2.count = L10_2
  end
  L5_2 = {}
  L5_2.albums = L3_2
  L5_2.mediaTypes = L2_2
  return L5_2
end
L7_1 = {}
L8_1 = {}
L7_1.albums = L8_1
L8_1 = {}
L7_1.mediaTypes = L8_1
L4_1(L5_1, L6_1, L7_1)
L4_1 = BaseCallback
L5_1 = "camera:getPhotos"
function L6_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L5_2 = A2_2.showVideos
  if not L5_2 then
    L5_2 = A2_2.showPhotos
    if not L5_2 then
      L5_2 = debugprint
      L6_2 = "not showing either videos nor photos, returning"
      L5_2(L6_2)
      L5_2 = {}
      return L5_2
    end
  end
  L5_2 = {}
  L6_2 = A1_2
  L5_2[1] = L6_2
  L6_2 = "SELECT id, link, is_video, size, metadata, is_favourite, created_at FROM lbtablet_photos WHERE tablet_id = ?"
  L7_2 = A2_2.showPhotos
  L8_2 = A2_2.showVideos
  if L7_2 ~= L8_2 then
    L7_2 = L6_2
    L8_2 = " AND is_video = ?"
    L7_2 = L7_2 .. L8_2
    L6_2 = L7_2
    L7_2 = #L5_2
    L7_2 = L7_2 + 1
    L8_2 = A2_2.showVideos
    L8_2 = true == L8_2
    L5_2[L7_2] = L8_2
  end
  L7_2 = A2_2.favourites
  if L7_2 then
    L7_2 = L6_2
    L8_2 = " AND is_favourite = 1"
    L7_2 = L7_2 .. L8_2
    L6_2 = L7_2
  end
  L7_2 = A2_2.type
  if L7_2 then
    L7_2 = L6_2
    L8_2 = " AND metadata = ?"
    L7_2 = L7_2 .. L8_2
    L6_2 = L7_2
    L7_2 = #L5_2
    L7_2 = L7_2 + 1
    L8_2 = A2_2.type
    L5_2[L7_2] = L8_2
  else
    L7_2 = A2_2.album
    if L7_2 then
      L7_2 = L6_2
      L8_2 = " AND id IN (select ap.photo_id FROM lbtablet_photo_album_photos ap WHERE ap.album_id = ?)"
      L7_2 = L7_2 .. L8_2
      L6_2 = L7_2
      L7_2 = #L5_2
      L7_2 = L7_2 + 1
      L8_2 = A2_2.album
      L5_2[L7_2] = L8_2
    end
  end
  L7_2 = A2_2.duplicates
  if L7_2 then
    L7_2 = L6_2
    L8_2 = [[
            AND link IN (
                SELECT link
                FROM lbtablet_photos
                WHERE tablet_id = ?
                GROUP BY link
                HAVING COUNT(1) > 1
            )
        ]]
    L7_2 = L7_2 .. L8_2
    L6_2 = L7_2
    L7_2 = #L5_2
    L7_2 = L7_2 + 1
    L5_2[L7_2] = A1_2
  end
  L7_2 = clamp
  L8_2 = A2_2.perPage
  if not L8_2 then
    L8_2 = 30
  end
  L9_2 = 1
  L10_2 = 32
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  if A4_2 then
    L8_2 = L6_2
    L9_2 = " AND id < ? ORDER BY id DESC limit ?"
    L8_2 = L8_2 .. L9_2
    L6_2 = L8_2
    L8_2 = #L5_2
    L8_2 = L8_2 + 1
    L5_2[L8_2] = A4_2
  else
    L8_2 = L6_2
    L9_2 = " ORDER BY id DESC limit ?, ?"
    L8_2 = L8_2 .. L9_2
    L6_2 = L8_2
    L8_2 = #L5_2
    L8_2 = L8_2 + 1
    L9_2 = A3_2 or L9_2
    if not A3_2 then
      L9_2 = 0
    end
    L9_2 = L9_2 * L7_2
    L5_2[L8_2] = L9_2
  end
  L8_2 = #L5_2
  L8_2 = L8_2 + 1
  L5_2[L8_2] = L7_2
  L8_2 = MySQL
  L8_2 = L8_2.query
  L8_2 = L8_2.await
  L9_2 = L6_2
  L10_2 = L5_2
  return L8_2(L9_2, L10_2)
end
L4_1(L5_1, L6_1)
L4_1 = BaseCallback
L5_1 = "camera:createAlbum"
function L6_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = MySQL
  L3_2 = L3_2.insert
  L3_2 = L3_2.await
  L4_2 = "INSERT INTO lbtablet_photo_albums (tablet_id, title) VALUES (?, ?)"
  L5_2 = {}
  L6_2 = A1_2
  L7_2 = A2_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  return L3_2(L4_2, L5_2)
end
L4_1(L5_1, L6_1)
L4_1 = BaseCallback
L5_1 = "camera:renameAlbum"
function L6_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = MySQL
  L4_2 = L4_2.update
  L4_2 = L4_2.await
  L5_2 = "UPDATE lbtablet_photo_albums SET title = ? WHERE tablet_id = ? AND id = ?"
  L6_2 = {}
  L7_2 = A3_2
  L8_2 = A1_2
  L9_2 = A2_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L4_2 = L4_2(L5_2, L6_2)
  L4_2 = L4_2 > 0
  return L4_2
end
L4_1(L5_1, L6_1)
L4_1 = BaseCallback
L5_1 = "camera:deleteAlbum"
function L6_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = "DELETE FROM lbtablet_photo_albums WHERE tablet_id = ? AND id = ?"
  L5_2 = {}
  L6_2 = A1_2
  L7_2 = A2_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L3_2 = L3_2(L4_2, L5_2)
  L3_2 = L3_2 > 0
  return L3_2
end
L4_1(L5_1, L6_1)
L4_1 = BaseCallback
L5_1 = "camera:addToAlbum"
function L6_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = MySQL
  L4_2 = L4_2.scalar
  L4_2 = L4_2.await
  L5_2 = "SELECT 1 FROM lbtablet_photo_albums WHERE tablet_id = ? AND id = ?"
  L6_2 = {}
  L7_2 = A1_2
  L8_2 = A2_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = MySQL
  L4_2 = L4_2.update
  L4_2 = L4_2.await
  L5_2 = "INSERT IGNORE INTO lbtablet_photo_album_photos (album_id, photo_id) SELECT ?, id FROM lbtablet_photos WHERE tablet_id = ? AND id IN (?)"
  L6_2 = {}
  L7_2 = A2_2
  L8_2 = A1_2
  L9_2 = A3_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L4_2(L5_2, L6_2)
  L4_2 = true
  return L4_2
end
L4_1(L5_1, L6_1)
L4_1 = BaseCallback
L5_1 = "camera:removeFromAlbum"
function L6_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = MySQL
  L4_2 = L4_2.scalar
  L4_2 = L4_2.await
  L5_2 = "SELECT 1 FROM lbtablet_photo_albums WHERE tablet_id = ? AND id = ?"
  L6_2 = {}
  L7_2 = A1_2
  L8_2 = A2_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = MySQL
  L4_2 = L4_2.update
  L4_2 = L4_2.await
  L5_2 = "DELETE FROM lbtablet_photo_album_photos WHERE album_id = ? AND photo_id IN (?)"
  L6_2 = {}
  L7_2 = A2_2
  L8_2 = A3_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L4_2(L5_2, L6_2)
  L4_2 = true
  return L4_2
end
L4_1(L5_1, L6_1)
L4_1 = BaseCallback
L5_1 = "camera:getPhoneAlbum"
function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = Config
  L2_2 = L2_2.LBPhone
  if not L2_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = exports
  L2_2 = L2_2["lb-phone"]
  L3_2 = L2_2
  L2_2 = L2_2.GetEquippedPhoneNumber
  L4_2 = A0_2
  L2_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = MySQL
  L3_2 = L3_2.single
  L3_2 = L3_2.await
  L4_2 = [[
        SELECT
            SUM(is_video = 1) AS videoCount,
            SUM(is_video = 0) AS photoCount,
            (SELECT link FROM phone_photos WHERE phone_number = ? ORDER BY id DESC LIMIT 1) AS cover
        FROM
            phone_photos
        WHERE
            phone_number = ?
    ]]
  L5_2 = {}
  L6_2 = L2_2
  L7_2 = L2_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = tonumber
  L5_2 = L3_2.photoCount
  if not L5_2 then
    L5_2 = 0
  end
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = 0
  end
  L3_2.photoCount = L4_2
  L4_2 = tonumber
  L5_2 = L3_2.videoCount
  if not L5_2 then
    L5_2 = 0
  end
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = 0
  end
  L3_2.videoCount = L4_2
  L4_2 = L3_2.photoCount
  L5_2 = L3_2.videoCount
  L4_2 = L4_2 + L5_2
  L3_2.count = L4_2
  return L3_2
end
L7_1 = false
L4_1(L5_1, L6_1, L7_1)
L4_1 = BaseCallback
L5_1 = "camera:importFromPhone"
function L6_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = Config
  L3_2 = L3_2.LBPhone
  if not L3_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = exports
  L3_2 = L3_2["lb-phone"]
  L4_2 = L3_2
  L3_2 = L3_2.GetEquippedPhoneNumber
  L5_2 = A0_2
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = MySQL
  L4_2 = L4_2.update
  L4_2 = L4_2.await
  L5_2 = "INSERT IGNORE INTO lbtablet_photos (tablet_id, link, is_video, size, metadata) SELECT ?, link, is_video, size, metadata FROM phone_photos WHERE phone_number = ? AND id IN (?)"
  L6_2 = {}
  L7_2 = A1_2
  L8_2 = L3_2
  L9_2 = A2_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L4_2(L5_2, L6_2)
  L4_2 = true
  return L4_2
end
L4_1(L5_1, L6_1)
