local L0_1, L1_1, L2_1
L0_1 = RegisterNUICallback
L1_1 = "logError"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
  L2_2 = infoprint
  L3_2 = "error"
  L4_2 = "Your tablet crashed."
  L2_2(L3_2, L4_2)
  L2_2 = print
  L3_2 = "Error:"
  L4_2 = A0_2.error
  L2_2(L3_2, L4_2)
  L2_2 = print
  L3_2 = "Stack:"
  L4_2 = A0_2.stack
  L2_2(L3_2, L4_2)
  L2_2 = print
  L3_2 = "Component Stack:"
  L4_2 = A0_2.componentStack
  L2_2(L3_2, L4_2)
  L2_2 = GetResourceMetadata
  L3_2 = GetCurrentResourceName
  L3_2 = L3_2()
  L4_2 = "ui_page"
  L5_2 = 0
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if "ui/dist/index.html" == L2_2 then
    L3_2 = A0_2.error
    if not L3_2 then
      L3_2 = "No error message"
    end
    L4_2 = A0_2.stack
    if not L4_2 then
      L4_2 = "No stack"
    end
    L5_2 = A0_2.componentStack
    if not L5_2 then
      L5_2 = "No component stack"
    end
    L6_2 = TriggerServerEvent
    L7_2 = "tablet:logError"
    L8_2 = L3_2
    L9_2 = L4_2
    L10_2 = L5_2
    L6_2(L7_2, L8_2, L9_2, L10_2)
  end
  L3_2 = TabletOpen
  L4_2 = ToggleOpen
  L5_2 = false
  L4_2(L5_2)
  L4_2 = Wait
  L5_2 = 2500
  L4_2(L5_2)
  if L3_2 then
    L4_2 = ToggleOpen
    L5_2 = true
    L4_2(L5_2)
  end
  L4_2 = TriggerEvent
  L5_2 = "tablet:notifications:new"
  L6_2 = {}
  L6_2.app = "Settings"
  L6_2.title = "System Crash"
  L6_2.content = "Your tablet crashed. Press F8 for more info."
  L4_2(L5_2, L6_2)
end
L0_1(L1_1, L2_1)
