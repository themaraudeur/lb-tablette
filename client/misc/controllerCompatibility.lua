local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = 0.5
L1_1 = 0.5
L2_1 = 0.005
L3_1 = false
function L4_1()
  local L0_2, L1_2
  L0_2 = IsUsingKeyboard
  L1_2 = 0
  L0_2 = L0_2(L1_2)
  L0_2 = false == L0_2
  return L0_2
end
function L5_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = GetDisabledControlNormal
  L2_2 = 0
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = 0.1
  L3_2 = -L2_2
  if L1_2 < L3_2 or L1_2 > L2_2 then
    return L1_2
  end
  L3_2 = 0.0
  return L3_2
end
L6_1 = RegisterNUICallback
L7_1 = "toggleInput"
function L8_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L4_1
  L1_2 = L1_2()
  if not L1_2 then
    return
  end
  L1_2 = true == A0_2
  L3_1 = L1_2
  if not A0_2 then
    L1_2 = Wait
    L2_2 = 250
    L1_2(L2_2)
    L1_2 = L3_1
    if L1_2 then
      return
    end
  end
  L1_2 = SendReactMessage
  L2_2 = "controller:toggleKeyboard"
  L3_2 = L3_1
  L1_2(L2_2, L3_2)
end
L6_1(L7_1, L8_1)
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = L5_1
  L1_2 = 1
  L0_2 = L0_2(L1_2)
  L1_2 = L5_1
  L2_2 = 2
  L1_2 = L1_2(L2_2)
  L2_2 = L5_1
  L3_2 = 31
  L2_2 = L2_2(L3_2)
  L3_2 = L0_1
  L4_2 = L2_1
  L4_2 = L0_2 * L4_2
  L3_2 = L3_2 + L4_2
  L0_1 = L3_2
  L3_2 = L1_1
  L4_2 = L2_1
  L4_2 = L1_2 * L4_2
  L3_2 = L3_2 + L4_2
  L1_1 = L3_2
  L3_2 = math
  L3_2 = L3_2.min
  L4_2 = 0.99999
  L5_2 = math
  L5_2 = L5_2.max
  L6_2 = 0
  L7_2 = L0_1
  L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  L0_1 = L3_2
  L3_2 = math
  L3_2 = L3_2.min
  L4_2 = 1.0
  L5_2 = math
  L5_2 = L5_2.max
  L6_2 = 0
  L7_2 = L1_1
  L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  L1_1 = L3_2
  L3_2 = IsDisabledControlJustPressed
  L4_2 = 0
  L5_2 = 18
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L3_2 = SendReactMessage
    L4_2 = "controller:press"
    L5_2 = {}
    L6_2 = L0_1
    L5_2.x = L6_2
    L6_2 = L1_1
    L5_2.y = L6_2
    L3_2(L4_2, L5_2)
  else
    L3_2 = IsDisabledControlJustReleased
    L4_2 = 0
    L5_2 = 18
    L3_2 = L3_2(L4_2, L5_2)
    if L3_2 then
      L3_2 = SendReactMessage
      L4_2 = "controller:release"
      L5_2 = {}
      L6_2 = L0_1
      L5_2.x = L6_2
      L6_2 = L1_1
      L5_2.y = L6_2
      L3_2(L4_2, L5_2)
    else
      L3_2 = IsDisabledControlJustReleased
      L4_2 = 0
      L5_2 = 199
      L3_2 = L3_2(L4_2, L5_2)
      if not L3_2 then
        L3_2 = IsDisabledControlJustReleased
        L4_2 = 0
        L5_2 = 177
        L3_2 = L3_2(L4_2, L5_2)
        if not L3_2 then
          goto lbl_91
        end
      end
      L3_2 = ToggleOpen
      L4_2 = false
      L3_2(L4_2)
    end
  end
  ::lbl_91::
  if 0.0 ~= L0_2 or 0.0 ~= L1_2 then
    L3_2 = SetCursorLocation
    L4_2 = L0_1
    L5_2 = L1_1
    L3_2(L4_2, L5_2)
  end
  if 0.0 ~= L2_2 then
    L3_2 = SendReactMessage
    L4_2 = "controller:scroll"
    L5_2 = {}
    L6_2 = math
    L6_2 = L6_2.floor
    L7_2 = L2_2 * 25
    L6_2 = L6_2(L7_2)
    L5_2.amount = L6_2
    L6_2 = L0_1
    L5_2.x = L6_2
    L6_2 = L1_1
    L5_2.y = L6_2
    L3_2(L4_2, L5_2)
  end
  L3_2 = DisableAllControlActions
  L4_2 = 0
  L3_2(L4_2)
  L3_2 = DisableAllControlActions
  L4_2 = 1
  L3_2(L4_2)
  L3_2 = DisableAllControlActions
  L4_2 = 2
  L3_2(L4_2)
  L3_2 = InvalidateIdleCam
  L3_2()
end
function L7_1()
  local L0_2, L1_2, L2_2
  while true do
    L0_2 = TabletOpen
    if not L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 0
    L0_2(L1_2)
    L0_2 = L4_1
    L0_2 = L0_2()
    if L0_2 then
      L0_2 = IsNuiFocused
      L0_2 = L0_2()
      if L0_2 then
        L0_2 = L6_1
        L0_2()
    end
    else
      L0_2 = Wait
      L1_2 = 500
      L0_2(L1_2)
    end
  end
  L0_2 = 0.5
  L0_1 = L0_2
  L0_2 = 0.5
  L1_1 = L0_2
  L0_2 = L4_1
  L0_2 = L0_2()
  if L0_2 then
    L0_2 = SetCursorLocation
    L1_2 = L0_1
    L2_2 = L1_1
    L0_2(L1_2, L2_2)
  end
end
ControllerThread = L7_1
