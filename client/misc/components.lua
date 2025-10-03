local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = {}
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = math
  L1_2 = L1_2.random
  L2_2 = 999999999
  L1_2 = L1_2(L2_2)
  while true do
    L2_2 = A0_2[L1_2]
    if not L2_2 then
      break
    end
    L2_2 = math
    L2_2 = L2_2.random
    L3_2 = 999999999
    L2_2 = L2_2(L3_2)
    L1_2 = L2_2
  end
  return L1_2
end
L2_1 = exports
L3_1 = "SetPopUp"
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = assert
  L2_2 = type
  L3_2 = A0_2.title
  L2_2 = L2_2(L3_2)
  L2_2 = "string" == L2_2
  L3_2 = "Expected string for title, got "
  L4_2 = type
  L5_2 = A0_2.title
  L4_2 = L4_2(L5_2)
  L3_2 = L3_2 .. L4_2
  L1_2(L2_2, L3_2)
  L1_2 = assert
  L2_2 = type
  L3_2 = A0_2.description
  L2_2 = L2_2(L3_2)
  L2_2 = "string" == L2_2
  L3_2 = "Expected string for description, got "
  L4_2 = type
  L5_2 = A0_2.description
  L4_2 = L4_2(L5_2)
  L3_2 = L3_2 .. L4_2
  L1_2(L2_2, L3_2)
  L1_2 = assert
  L2_2 = type
  L3_2 = A0_2.buttons
  L2_2 = L2_2(L3_2)
  L2_2 = "table" == L2_2
  L3_2 = "Expected table for buttons, got "
  L4_2 = type
  L5_2 = A0_2.buttons
  L4_2 = L4_2(L5_2)
  L3_2 = L3_2 .. L4_2
  L1_2(L2_2, L3_2)
  L1_2 = L1_1
  L2_2 = L0_1
  L1_2 = L1_2(L2_2)
  L2_2 = {}
  A0_2.id = L1_2
  L3_2 = A0_2.buttons
  if L3_2 then
    L3_2 = 1
    L4_2 = A0_2.buttons
    L4_2 = #L4_2
    L5_2 = 1
    for L6_2 = L3_2, L4_2, L5_2 do
      L7_2 = A0_2.buttons
      L7_2 = L7_2[L6_2]
      L8_2 = L7_2.cb
      if L8_2 then
        L8_2 = L1_1
        L9_2 = L2_2
        L8_2 = L8_2(L9_2)
        L9_2 = L7_2.cb
        L2_2[L8_2] = L9_2
        L7_2.cb = L8_2
      end
    end
  end
  L3_2 = A0_2.inputs
  if L3_2 then
    L3_2 = 1
    L4_2 = A0_2.inputs
    L4_2 = #L4_2
    L5_2 = 1
    for L6_2 = L3_2, L4_2, L5_2 do
      L7_2 = A0_2.inputs
      L7_2 = L7_2[L6_2]
      L8_2 = L7_2.onChange
      if L8_2 then
        L8_2 = L1_1
        L9_2 = L2_2
        L8_2 = L8_2(L9_2)
        L9_2 = L7_2.onChange
        L2_2[L8_2] = L9_2
        L7_2.onChange = L8_2
      end
    end
  end
  L3_2 = A0_2.textareas
  if L3_2 then
    L3_2 = 1
    L4_2 = A0_2.textareas
    L4_2 = #L4_2
    L5_2 = 1
    for L6_2 = L3_2, L4_2, L5_2 do
      L7_2 = A0_2.textareas
      L7_2 = L7_2[L6_2]
      L8_2 = L7_2.onChange
      if L8_2 then
        L8_2 = L1_1
        L9_2 = L2_2
        L8_2 = L8_2(L9_2)
        L9_2 = L7_2.onChange
        L2_2[L8_2] = L9_2
        L7_2.onChange = L8_2
      end
    end
  end
  L3_2 = L0_1
  L4_2 = {}
  L5_2 = A0_2.close
  L4_2.close = L5_2
  L4_2.actions = L2_2
  L3_2[L1_2] = L4_2
  L3_2 = SendReactMessage
  L4_2 = "showComponent"
  L5_2 = {}
  L5_2.type = "popup"
  L5_2.data = A0_2
  L3_2(L4_2, L5_2)
  L3_2 = true
  return L3_2
end
L2_1(L3_1, L4_1)
L2_1 = exports
L3_1 = "SetContextMenu"
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = assert
  L2_2 = type
  L3_2 = A0_2.buttons
  L2_2 = L2_2(L3_2)
  L2_2 = "table" == L2_2
  L3_2 = "Expected table for buttons, got "
  L4_2 = type
  L5_2 = A0_2.buttons
  L4_2 = L4_2(L5_2)
  L3_2 = L3_2 .. L4_2
  L1_2(L2_2, L3_2)
  L1_2 = L1_1
  L2_2 = L0_1
  L1_2 = L1_2(L2_2)
  L2_2 = {}
  A0_2.id = L1_2
  L3_2 = 1
  L4_2 = A0_2.buttons
  L4_2 = #L4_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = A0_2.buttons
    L7_2 = L7_2[L6_2]
    L8_2 = L7_2.cb
    if L8_2 then
      L8_2 = L1_1
      L9_2 = L2_2
      L8_2 = L8_2(L9_2)
      L9_2 = L7_2.cb
      L2_2[L8_2] = L9_2
      L7_2.cb = L8_2
    end
  end
  L3_2 = L0_1
  L4_2 = {}
  L5_2 = A0_2.close
  L4_2.close = L5_2
  L4_2.actions = L2_2
  L3_2[L1_2] = L4_2
  L3_2 = SendReactMessage
  L4_2 = "showComponent"
  L5_2 = {}
  L5_2.type = "contextmenu"
  L5_2.data = A0_2
  L3_2(L4_2, L5_2)
end
L2_1(L3_1, L4_1)
L2_1 = exports
L3_1 = "Gallery"
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L1_1
  L2_2 = L0_1
  L1_2 = L1_2(L2_2)
  A0_2.id = L1_2
  L2_2 = {}
  L3_2 = A0_2.onSelect
  if L3_2 then
    L3_2 = L1_1
    L4_2 = L0_1
    L3_2 = L3_2(L4_2)
    L4_2 = A0_2.onSelect
    L2_2[L3_2] = L4_2
    A0_2.onSelect = L3_2
  end
  L3_2 = L0_1
  L4_2 = {}
  L5_2 = A0_2.close
  L4_2.close = L5_2
  L4_2.actions = L2_2
  L3_2[L1_2] = L4_2
  L3_2 = SendReactMessage
  L4_2 = "showComponent"
  L5_2 = {}
  L5_2.type = "gallery"
  L5_2.data = A0_2
  L3_2(L4_2, L5_2)
end
L2_1(L3_1, L4_1)
L2_1 = exports
L3_1 = "ColorPicker"
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = A0_2.defaultColor
  if L1_2 then
    L1_2 = A0_2.defaultColor
    L2_2 = L1_2
    L1_2 = L1_2.match
    L3_2 = "^#%x%x%x%x%x%x$"
    L1_2 = L1_2(L2_2, L3_2)
    if not L1_2 then
      L1_2 = error
      L2_2 = "Invalid defaultColor, expected hex"
      L1_2(L2_2)
    end
  end
  L1_2 = L1_1
  L2_2 = L0_1
  L1_2 = L1_2(L2_2)
  A0_2.id = L1_2
  L2_2 = {}
  L3_2 = A0_2.onSelect
  if L3_2 then
    L3_2 = L1_1
    L4_2 = L0_1
    L3_2 = L3_2(L4_2)
    L4_2 = A0_2.onSelect
    L2_2[L3_2] = L4_2
    A0_2.onSelect = L3_2
  end
  L3_2 = A0_2.onClose
  if L3_2 then
    L3_2 = L1_1
    L4_2 = L0_1
    L3_2 = L3_2(L4_2)
    L4_2 = A0_2.onClose
    L2_2[L3_2] = L4_2
    A0_2.onClose = L3_2
  end
  L3_2 = L0_1
  L4_2 = {}
  L5_2 = A0_2.close
  L4_2.close = L5_2
  L4_2.actions = L2_2
  L3_2[L1_2] = L4_2
  L3_2 = SendReactMessage
  L4_2 = "showComponent"
  L5_2 = {}
  L5_2.type = "colorpicker"
  L5_2.data = A0_2
  L3_2(L4_2, L5_2)
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNUICallback
L3_1 = "componentResult"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
  L2_2 = A0_2.componentId
  L3_2 = L0_1
  L3_2 = L3_2[L2_2]
  if L3_2 then
    L3_2 = A0_2.id
    if L3_2 then
      L4_2 = L0_1
      L4_2 = L4_2[L2_2]
      L4_2 = L4_2.actions
      L4_2 = L4_2[L3_2]
      L5_2 = A0_2.data
      L4_2(L5_2)
    else
      L4_2 = L0_1
      L4_2 = L4_2[L2_2]
      if L4_2 then
        L4_2 = L0_1
        L4_2 = L4_2[L2_2]
        L4_2 = L4_2.close
        L5_2 = A0_2.data
        L4_2(L5_2)
      end
      L4_2 = L0_1
      L4_2[L2_2] = nil
    end
  end
end
L2_1(L3_1, L4_1)
