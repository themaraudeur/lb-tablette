local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1
L0_1 = IsPedInAnyVehicle
L1_1 = SetFollowPedCamViewMode
L2_1 = SetGameplayCamRelativeHeading
L3_1 = DisableControlAction
L4_1 = SetPedResetFlag
L5_1 = SetCamFov
L6_1 = AttachCamToPedBone_2
L7_1 = DetachCam
L8_1 = SetCamCoord
L9_1 = SetCamRot
L10_1 = IsNuiFocused
L11_1 = GetDisabledControlNormal
L12_1 = GetProfileSetting
L13_1 = SetEntityHeading
L14_1 = IsDisabledControlPressed
L15_1 = GetCamFov
L16_1 = Config
L16_1 = L16_1.Camera
if L16_1 then
  L16_1 = L16_1.MaxFOV
end
if not L16_1 then
  L16_1 = 60.0
end
L17_1 = Config
L17_1 = L17_1.Camera
if L17_1 then
  L17_1 = L17_1.MinFOV
end
if not L17_1 then
  L17_1 = 10.0
end
L18_1 = Config
L18_1 = L18_1.Camera
if L18_1 then
  L18_1 = L18_1.MaxLookUp
end
if not L18_1 then
  L18_1 = 80.0
end
L19_1 = Config
L19_1 = L19_1.Camera
if L19_1 then
  L19_1 = L19_1.MaxLookDown
end
if not L19_1 then
  L19_1 = -80.0
end
L20_1 = Config
L20_1 = L20_1.Camera
if L20_1 then
  L20_1 = L20_1.AllowRunning
end
L20_1 = true == L20_1
L21_1 = Config
L21_1 = L21_1.Camera
if L21_1 then
  L21_1 = L21_1.Vehicle
end
if L21_1 then
  L21_1 = L21_1.Zoom
end
L21_1 = true == L21_1
L22_1 = Config
L22_1 = L22_1.Camera
if L22_1 then
  L22_1 = L22_1.Vehicle
end
if L22_1 then
  L22_1 = L22_1.MaxFOV
end
if not L22_1 then
  L22_1 = 80.0
end
L23_1 = Config
L23_1 = L23_1.Camera
if L23_1 then
  L23_1 = L23_1.Vehicle
end
if L23_1 then
  L23_1 = L23_1.MinFOV
end
if not L23_1 then
  L23_1 = 10.0
end
L24_1 = Config
L24_1 = L24_1.Camera
if L24_1 then
  L24_1 = L24_1.Vehicle
end
if L24_1 then
  L24_1 = L24_1.MaxLookUp
end
if not L24_1 then
  L24_1 = 50.0
end
L25_1 = Config
L25_1 = L25_1.Camera
if L25_1 then
  L25_1 = L25_1.Vehicle
end
if L25_1 then
  L25_1 = L25_1.MaxLookDown
end
if not L25_1 then
  L25_1 = -30.0
end
L26_1 = Config
L26_1 = L26_1.Camera
if L26_1 then
  L26_1 = L26_1.Vehicle
end
if L26_1 then
  L26_1 = L26_1.MaxLeftRight
end
if not L26_1 then
  L26_1 = 120.0
end
L27_1 = Config
L27_1 = L27_1.Camera
if L27_1 then
  L27_1 = L27_1.Vehicle
end
if L27_1 then
  L27_1 = L27_1.MinLeftRight
end
if not L27_1 then
  L27_1 = -120.0
end
L28_1 = Config
L28_1 = L28_1.Camera
if L28_1 then
  L28_1 = L28_1.Selfie
end
if L28_1 then
  L28_1 = L28_1.MaxFOV
end
if not L28_1 then
  L28_1 = 80.0
end
L29_1 = Config
L29_1 = L29_1.Camera
if L29_1 then
  L29_1 = L29_1.Selfie
end
if L29_1 then
  L29_1 = L29_1.MinFOV
end
if not L29_1 then
  L29_1 = 50.0
end
L30_1 = Config
L30_1 = L30_1.Camera
if L30_1 then
  L30_1 = L30_1.Freeze
end
if L30_1 then
  L30_1 = L30_1.Enabled
end
L30_1 = true == L30_1
L31_1 = Config
L31_1 = L31_1.Camera
if L31_1 then
  L31_1 = L31_1.Freeze
end
if L31_1 then
  L31_1 = L31_1.MaxDistance
end
if not L31_1 then
  L31_1 = 10.0
end
L32_1 = Config
L32_1 = L32_1.Camera
if L32_1 then
  L32_1 = L32_1.Freeze
end
if L32_1 then
  L32_1 = L32_1.MaxTime
end
if not L32_1 then
  L32_1 = 60
end
L32_1 = L32_1 * 1000
L33_1 = Config
L33_1 = L33_1.Camera
if L33_1 then
  L33_1 = L33_1.Selfie
end
if L33_1 then
  L33_1 = L33_1.Offset
end
if not L33_1 then
  L33_1 = vector3
  L34_1 = 0.1
  L35_1 = 0.55
  L36_1 = 0.6
  L33_1 = L33_1(L34_1, L35_1, L36_1)
end
L34_1 = Config
L34_1 = L34_1.Camera
if L34_1 then
  L34_1 = L34_1.Selfie
end
if L34_1 then
  L34_1 = L34_1.Rotation
end
if not L34_1 then
  L34_1 = vector3
  L35_1 = 10.0
  L36_1 = 0.0
  L37_1 = -180.0
  L34_1 = L34_1(L35_1, L36_1, L37_1)
end
L35_1 = Config
L35_1 = L35_1.Camera
L35_1 = L35_1.Roll
L35_1 = true == L35_1
L36_1 = vector3
L37_1 = 0.0
L38_1 = 0.5
L39_1 = 0.6
L36_1 = L36_1(L37_1, L38_1, L39_1)
L37_1 = 0.0
L38_1 = 0.0
L39_1 = 60.0
L40_1 = 0
L41_1 = 0.0
L42_1 = false
L43_1 = false
L44_1 = 0
L45_1 = PlayerPedId
L45_1 = L45_1()
L46_1 = false
L47_1 = false
L48_1 = 0.0
L49_1 = L12_1
L50_1 = 754
L49_1 = L49_1(L50_1)
L49_1 = L49_1 + 10
L50_1 = nil
function L51_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = L0_1
  L1_2 = L45_1
  L2_2 = true
  L0_2 = L0_2(L1_2, L2_2)
  L1_2 = L46_1
  L1_2 = L14_1
  L2_2 = 0
  L3_2 = 33
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L1_2 = L14_1
    L2_2 = 0
    L3_2 = 34
    L1_2 = L1_2(L2_2, L3_2)
    if not L1_2 then
      L1_2 = L14_1
      L2_2 = 0
      L3_2 = 35
      L1_2 = not L1_2 and not L0_2 and L1_2
    end
  end
  L47_1 = L1_2
  L1_2 = HideHudAndRadarThisFrame
  L1_2()
  L1_2 = L1_1
  L2_2 = 0
  L1_2(L2_2)
  L1_2 = L2_1
  L2_2 = 0.0
  L1_2(L2_2)
  L1_2 = L3_1
  L2_2 = 0
  L3_2 = 1
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = L3_1
  L2_2 = 0
  L3_2 = 14
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = L3_1
  L2_2 = 0
  L3_2 = 15
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = L3_1
  L2_2 = 0
  L3_2 = 16
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = L3_1
  L2_2 = 0
  L3_2 = 17
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = L3_1
  L2_2 = 0
  L3_2 = 99
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = L3_1
  L2_2 = 0
  L3_2 = 100
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = L3_1
  L2_2 = 0
  L3_2 = 115
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = L3_1
  L2_2 = 0
  L3_2 = 116
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = L3_1
  L2_2 = 0
  L3_2 = 261
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = L3_1
  L2_2 = 0
  L3_2 = 262
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = L4_1
  L2_2 = L45_1
  L3_2 = 47
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = L43_1
  if L1_2 and not L0_2 then
    L1_2 = GetEntityCoords
    L2_2 = L45_1
    L1_2 = L1_2(L2_2)
    L2_2 = GetCamCoord
    L3_2 = L50_1
    L2_2 = L2_2(L3_2)
    L1_2 = L1_2 - L2_2
    L1_2 = #L1_2
    L2_2 = L31_1
    if not (L1_2 > L2_2) then
      L2_2 = GetGameTimer
      L2_2 = L2_2()
      L3_2 = L44_1
      if not (L2_2 > L3_2) then
        goto lbl_127
      end
    end
    L2_2 = false
    L43_1 = L2_2
    L2_2 = ToggleAnimations
    L3_2 = true
    L2_2(L3_2)
    L2_2 = DisplayCameraTip
    L2_2()
    ::lbl_127::
    return
  end
  L1_2 = L20_1
  if not L1_2 then
    L1_2 = L3_1
    L2_2 = 0
    L3_2 = 21
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
  end
  L1_2 = L46_1
  if L1_2 and not L0_2 then
    L1_2 = L6_1
    L2_2 = L50_1
    L3_2 = L45_1
    L4_2 = 0
    L5_2 = L34_1.x
    L6_2 = L34_1.y
    L7_2 = L34_1.z
    L8_2 = L33_1.x
    L9_2 = L33_1.y
    L10_2 = L33_1.z
    L11_2 = true
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  else
    L1_2 = L46_1
    if not L1_2 and not L0_2 then
      L1_2 = GetOffsetFromEntityInWorldCoords
      L2_2 = L45_1
      L3_2 = L36_1.x
      L4_2 = L36_1.y
      L5_2 = L36_1.z
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
      L2_2 = GetPedBoneCoords
      L3_2 = L45_1
      L4_2 = 31086
      L5_2 = 0.0
      L6_2 = 0.0
      L7_2 = 0.0
      L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
      L3_2 = math
      L3_2 = L3_2.abs
      L4_2 = L2_2.z
      L5_2 = L1_2.z
      L4_2 = L4_2 - L5_2
      L3_2 = L3_2(L4_2)
      L4_2 = 0.2
      if L3_2 > L4_2 then
        L3_2 = L2_2.z
        if L3_2 then
          goto lbl_186
        end
      end
      L3_2 = L1_2.z
      ::lbl_186::
      L4_2 = L7_1
      L5_2 = L50_1
      L4_2(L5_2)
      L4_2 = L8_1
      L5_2 = L50_1
      L6_2 = L1_2.x
      L7_2 = L1_2.y
      L8_2 = L3_2
      L4_2(L5_2, L6_2, L7_2, L8_2)
      L4_2 = L9_1
      L5_2 = L50_1
      L6_2 = L37_1
      L7_2 = L38_1
      L8_2 = GetEntityHeading
      L9_2 = L45_1
      L8_2 = L8_2(L9_2)
      L9_2 = 2
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
    else
      L1_2 = L46_1
      if L1_2 and L0_2 then
        L1_2 = L6_1
        L2_2 = L50_1
        L3_2 = L45_1
        L4_2 = 0
        L5_2 = 80.0
        L6_2 = 0.0
        L7_2 = -180.0
        L8_2 = 0.0
        L9_2 = 0.2
        L10_2 = 0.5
        L11_2 = true
        L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
      else
        L1_2 = L46_1
        if not L1_2 and L0_2 then
          L1_2 = SetEntityLocallyInvisible
          L2_2 = GetTabletObject
          L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L2_2()
          L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
          L1_2 = SetEntityLocallyInvisible
          L2_2 = L45_1
          L1_2(L2_2)
          L1_2 = L6_1
          L2_2 = L50_1
          L3_2 = L45_1
          L4_2 = GetPedBoneIndex
          L5_2 = L45_1
          L6_2 = 11816
          L4_2 = L4_2(L5_2, L6_2)
          L5_2 = L37_1
          L6_2 = 0.0
          L7_2 = L41_1
          L8_2 = 0.0
          L9_2 = 0.0
          L10_2 = 0.55
          L11_2 = true
          L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
        end
      end
    end
  end
  if L0_2 then
    L1_2 = L42_1
    if not L1_2 then
      L1_2 = true
      L42_1 = L1_2
      L1_2 = SetUserRadioControlEnabled
      L2_2 = false
      L1_2(L2_2)
    end
  else
    L1_2 = L42_1
    if L1_2 then
      L1_2 = false
      L42_1 = L1_2
      L1_2 = SetUserRadioControlEnabled
      L2_2 = true
      L1_2(L2_2)
    end
    L1_2 = 0.0
    L41_1 = L1_2
  end
  L1_2 = L47_1
  if L1_2 then
    L1_2 = L4_1
    L2_2 = L45_1
    L3_2 = 69
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
  else
    L1_2 = L46_1
    if not L1_2 and not L0_2 then
      L1_2 = L3_1
      L2_2 = 0
      L3_2 = 30
      L4_2 = true
      L1_2(L2_2, L3_2, L4_2)
    end
  end
  L1_2 = L10_1
  L1_2 = L1_2()
  if L1_2 then
    return
  end
  L1_2 = L49_1
  L2_2 = L39_1
  L3_2 = L16_1
  L2_2 = L2_2 / L3_2
  L1_2 = L1_2 * L2_2
  L1_2 = L1_2 / 5
  L48_1 = L1_2
  L1_2 = L11_1
  L2_2 = 0
  L3_2 = 1
  L1_2 = L1_2(L2_2, L3_2)
  if L0_2 then
    L2_2 = clamp
    L3_2 = L41_1
    L4_2 = L48_1
    L4_2 = L1_2 * L4_2
    L3_2 = L3_2 - L4_2
    L4_2 = L27_1
    L5_2 = L26_1
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    L41_1 = L2_2
  elseif 0.0 ~= L1_2 then
    L2_2 = L13_1
    L3_2 = L45_1
    L4_2 = GetEntityHeading
    L5_2 = L45_1
    L4_2 = L4_2(L5_2)
    L5_2 = L48_1
    L5_2 = L1_2 * L5_2
    L4_2 = L4_2 - L5_2
    L2_2(L3_2, L4_2)
  end
  L2_2 = L46_1
  if L2_2 then
    L2_2 = L28_1
    if L2_2 then
      goto lbl_348
    end
  end
  if L0_2 then
    L2_2 = L22_1
    if L2_2 then
      goto lbl_348
    end
  end
  L2_2 = L16_1
  ::lbl_348::
  L3_2 = L46_1
  if L3_2 then
    L3_2 = L29_1
    if L3_2 then
      goto lbl_366
    end
  end
  if L0_2 then
    L3_2 = L21_1
    if L3_2 then
      L3_2 = L23_1
      if L3_2 then
        goto lbl_366
      end
    end
    L3_2 = L22_1
    if L3_2 then
      goto lbl_366
    end
  end
  L3_2 = L17_1
  ::lbl_366::
  L4_2 = L14_1
  L5_2 = 0
  L6_2 = 180
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 then
    L4_2 = L39_1
    L4_2 = L4_2 + 5
    L39_1 = L4_2
  else
    L4_2 = L14_1
    L5_2 = 0
    L6_2 = 181
    L4_2 = L4_2(L5_2, L6_2)
    if L4_2 then
      L4_2 = L39_1
      L4_2 = L4_2 - 5
      L39_1 = L4_2
    end
  end
  L4_2 = clamp
  L5_2 = L39_1
  L6_2 = L3_2
  L7_2 = L2_2
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L39_1 = L4_2
  L4_2 = L15_1
  L5_2 = L50_1
  L4_2 = L4_2(L5_2)
  L5_2 = math
  L5_2 = L5_2.abs
  L6_2 = L39_1
  L6_2 = L4_2 - L6_2
  L5_2 = L5_2(L6_2)
  L6_2 = 0.1
  if L5_2 > L6_2 then
    L5_2 = L5_1
    L6_2 = L50_1
    L7_2 = L39_1
    L7_2 = L7_2 - L4_2
    L7_2 = L7_2 / 25
    L7_2 = L4_2 + L7_2
    L5_2(L6_2, L7_2)
  end
  L5_2 = L46_1
  if L5_2 then
    return
  end
  L5_2 = L11_1
  L6_2 = 0
  L7_2 = 2
  L5_2 = L5_2(L6_2, L7_2)
  if 0.0 ~= L5_2 then
    L6_2 = L48_1
    L6_2 = L5_2 * L6_2
    if L0_2 then
      L7_2 = clamp
      L8_2 = L37_1
      L8_2 = L8_2 - L6_2
      L9_2 = L25_1
      L10_2 = L24_1
      L7_2 = L7_2(L8_2, L9_2, L10_2)
      L37_1 = L7_2
    else
      L7_2 = clamp
      L8_2 = L37_1
      L8_2 = L8_2 - L6_2
      L9_2 = L19_1
      L10_2 = L18_1
      L7_2 = L7_2(L8_2, L9_2, L10_2)
      L37_1 = L7_2
    end
  end
end
function L52_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = L11_1
  L1_2 = 0
  L2_2 = 1
  L0_2 = L0_2(L1_2, L2_2)
  if 0.0 ~= L0_2 then
    L1_2 = L13_1
    L2_2 = L45_1
    L3_2 = GetEntityHeading
    L4_2 = L45_1
    L3_2 = L3_2(L4_2)
    L4_2 = L48_1
    L4_2 = L0_2 * L4_2
    L3_2 = L3_2 - L4_2
    L1_2(L2_2, L3_2)
  end
end
function L53_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = L50_1
  if L1_2 then
    L1_2 = debugprint
    L2_2 = "EnableWalkableCam called while it's already enabled"
    L1_2(L2_2)
    return
  end
  L1_2 = true == A0_2
  L46_1 = L1_2
  L1_2 = false
  L47_1 = L1_2
  L1_2 = 60.0
  L39_1 = L1_2
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L45_1 = L1_2
  L1_2 = GetFollowPedCamViewMode
  L1_2 = L1_2()
  L40_1 = L1_2
  L1_2 = 0.0
  L37_1 = L1_2
  L1_2 = 0.0
  L41_1 = L1_2
  L1_2 = 0.0
  L38_1 = L1_2
  L1_2 = false
  L43_1 = L1_2
  L1_2 = CreateCam
  L2_2 = "DEFAULT_SCRIPTED_CAMERA"
  L3_2 = true
  L1_2 = L1_2(L2_2, L3_2)
  L50_1 = L1_2
  L1_2 = L12_1
  L2_2 = 754
  L1_2 = L1_2(L2_2)
  L1_2 = L1_2 + 10
  L49_1 = L1_2
  L1_2 = CreateThread
  function L2_2(A0_3)
    local L1_3, L2_3
    while true do
      L1_3 = L50_1
      if not L1_3 then
        break
      end
      L1_3 = Wait
      L2_3 = 0
      L1_3(L2_3)
      L1_3 = L47_1
      if not L1_3 then
        L1_3 = L43_1
        if not L1_3 then
          goto lbl_19
        end
        L1_3 = L10_1
        L1_3 = L1_3()
        if L1_3 then
          goto lbl_19
        end
      end
      L1_3 = L52_1
      L1_3()
      ::lbl_19::
    end
  end
  L1_2(L2_2)
  L1_2 = CreateThread
  function L2_2(A0_3)
    local L1_3, L2_3
    while true do
      L1_3 = L50_1
      if not L1_3 then
        break
      end
      L1_3 = Wait
      L2_3 = 0
      L1_3(L2_3)
      L1_3 = L51_1
      L1_3()
    end
    L1_3 = L42_1
    if L1_3 then
      L1_3 = false
      L42_1 = L1_3
      L1_3 = SetUserRadioControlEnabled
      L2_3 = true
      L1_3(L2_3)
    end
  end
  L1_2(L2_2)
  L1_2 = L5_1
  L2_2 = L50_1
  L3_2 = L39_1
  L1_2(L2_2, L3_2)
  L1_2 = RenderScriptCams
  L2_2 = true
  L3_2 = false
  L4_2 = 0
  L5_2 = true
  L6_2 = true
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  L1_2 = SetCamActive
  L2_2 = L50_1
  L3_2 = true
  L1_2(L2_2, L3_2)
end
EnableWalkableCam = L53_1
function L53_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = L50_1
  if L0_2 then
    L0_2 = RenderScriptCams
    L1_2 = false
    L2_2 = false
    L3_2 = 0
    L4_2 = true
    L5_2 = true
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
    L0_2 = DestroyCam
    L1_2 = L50_1
    L2_2 = false
    L0_2(L1_2, L2_2)
    L0_2 = L1_1
    L1_2 = L40_1
    L0_2(L1_2)
    L0_2 = nil
    L50_1 = L0_2
  end
end
DisableWalkableCam = L53_1
function L53_1()
  local L0_2, L1_2
  L0_2 = L50_1
  L0_2 = nil ~= L0_2
  return L0_2
end
IsWalkingCamEnabled = L53_1
function L53_1()
  local L0_2, L1_2
  L0_2 = L46_1
  return L0_2
end
IsSelfieCam = L53_1
function L53_1()
  local L0_2, L1_2
  L0_2 = L43_1
  return L0_2
end
IsCameraFrozen = L53_1
function L53_1(A0_2)
  local L1_2
  L1_2 = true == A0_2
  L46_1 = L1_2
  L1_2 = 0.0
  L38_1 = L1_2
end
ToggleSelfieCam = L53_1
L53_1 = AddEventHandler
L54_1 = "lb-tablet:keyPressed"
function L55_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L50_1
  if not L1_2 then
    return
  end
  if "TakePhoto" == A0_2 then
    L1_2 = SendReactMessage
    L2_2 = "camera:usedCommand"
    L3_2 = "takePhoto"
    L1_2(L2_2, L3_2)
  elseif "ToggleFlash" == A0_2 then
    L1_2 = SendReactMessage
    L2_2 = "camera:usedCommand"
    L3_2 = "toggleFlash"
    L1_2(L2_2, L3_2)
  elseif "LeftMode" == A0_2 then
    L1_2 = SendReactMessage
    L2_2 = "camera:usedCommand"
    L3_2 = "leftMode"
    L1_2(L2_2, L3_2)
  elseif "RightMode" == A0_2 then
    L1_2 = SendReactMessage
    L2_2 = "camera:usedCommand"
    L3_2 = "rightMode"
    L1_2(L2_2, L3_2)
  elseif "FlipCamera" == A0_2 then
    L1_2 = SendReactMessage
    L2_2 = "camera:usedCommand"
    L3_2 = "toggleFlip"
    L1_2(L2_2, L3_2)
  elseif "FreezeCamera" == A0_2 then
    L1_2 = L30_1
    if L1_2 then
      L1_2 = L46_1
      if not L1_2 then
        goto lbl_49
      end
    end
    do return end
    ::lbl_49::
    L1_2 = L43_1
    L1_2 = not L1_2
    L43_1 = L1_2
    L1_2 = DisplayCameraTip
    L1_2()
    L1_2 = L43_1
    if L1_2 then
      L1_2 = GetGameTimer
      L1_2 = L1_2()
      L2_2 = L32_1
      L1_2 = L1_2 + L2_2
      L44_1 = L1_2
      L1_2 = ToggleAnimations
      L2_2 = false
      L1_2(L2_2)
    end
  elseif "RollLeft" == A0_2 or "RollRight" == A0_2 then
    L1_2 = L35_1
    if not L1_2 then
      return
    end
    if "RollLeft" == A0_2 then
      L1_2 = -0.5
      if L1_2 then
        goto lbl_81
      end
    end
    L1_2 = 0.5
    ::lbl_81::
    L2_2 = Config
    L2_2 = L2_2.KeyBinds
    L2_2 = L2_2[A0_2]
    L2_2 = L2_2.bindData
    while true do
      L3_2 = L2_2.pressed
      if not L3_2 then
        break
      end
      L3_2 = Wait
      L4_2 = 0
      L3_2(L4_2)
      L3_2 = L38_1
      L3_2 = L3_2 + L1_2
      L38_1 = L3_2
    end
  end
end
L53_1(L54_1, L55_1)
