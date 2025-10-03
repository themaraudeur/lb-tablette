local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = Config
L0_1 = L0_1.LBPhone
if L0_1 then
  L0_1 = Config
  L0_1 = L0_1.Police
  L0_1 = L0_1.Wiretapping
  if L0_1 then
    goto lbl_12
  end
end
do return end
::lbl_12::
L0_1 = math
L0_1 = L0_1.floor
L1_1 = Config
L1_1 = L1_1.Police
L1_1 = L1_1.Wiretapping
L1_1 = L1_1.MinimumCallDuration
if not L1_1 then
  L1_1 = 0
end
L1_1 = L1_1 * 1000
L0_1 = L0_1(L1_1)
L1_1 = {}
L2_1 = {}
L3_1 = {}
L4_1 = {}
L5_1 = MySQL
L5_1 = L5_1.ready
function L6_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  while true do
    L0_2 = DatabaseCheckerFinished
    if L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 500
    L0_2(L1_2)
  end
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = "SELECT phone_number FROM lbtablet_police_wiretaps"
  L0_2 = L0_2(L1_2)
  L1_2 = 1
  L2_2 = #L0_2
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = L0_2[L4_2]
    L6_2 = L5_2.phone_number
    L5_2 = L1_1
    L5_2[L6_2] = true
  end
end
L5_1(L6_1)
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = exports
  L1_2 = L1_2["lb-phone"]
  L2_2 = L1_2
  L1_2 = L1_2.GetSourceFromNumber
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L2_2 = debugprint
    L3_2 = "Source not found for phone number:"
    L4_2 = A0_2
    L2_2(L3_2, L4_2)
    return
  end
  L2_2 = exports
  L2_2 = L2_2["lb-phone"]
  L3_2 = L2_2
  L2_2 = L2_2.IsInCall
  L4_2 = L1_2
  L2_2, L3_2 = L2_2(L3_2, L4_2)
  if not L2_2 or not L3_2 then
    L4_2 = debugprint
    L5_2 = "Phone number is not in a call:"
    L6_2 = A0_2
    L4_2(L5_2, L6_2)
    return
  end
  L4_2 = exports
  L4_2 = L4_2["lb-phone"]
  L5_2 = L4_2
  L4_2 = L4_2.GetCall
  L6_2 = L3_2
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L5_2 = debugprint
    L6_2 = "Call not found for phone number:"
    L7_2 = A0_2
    L8_2 = "source:"
    L9_2 = L1_2
    L5_2(L6_2, L7_2, L8_2, L9_2)
    return
  end
  L5_2 = math
  L5_2 = L5_2.floor
  L6_2 = os
  L6_2 = L6_2.time
  L6_2 = L6_2()
  L7_2 = L4_2.started
  L6_2 = L6_2 - L7_2
  L6_2 = L6_2 * 1000
  L5_2 = L5_2(L6_2)
  L6_2 = math
  L6_2 = L6_2.max
  L7_2 = L0_1
  L7_2 = L7_2 - L5_2
  L8_2 = 0
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = Wait
  L8_2 = L6_2
  L7_2(L8_2)
  L7_2 = exports
  L7_2 = L7_2["lb-phone"]
  L8_2 = L7_2
  L7_2 = L7_2.GetCall
  L9_2 = L3_2
  L7_2 = L7_2(L8_2, L9_2)
  L4_2 = L7_2
  if not L4_2 then
    L7_2 = debugprint
    L8_2 = "Call not found after waiting for duration:"
    L9_2 = L3_2
    L7_2(L8_2, L9_2)
    return
  end
  L7_2 = L4_2.caller
  L8_2 = L7_2.number
  L7_2 = L1_1
  L7_2 = L7_2[L8_2]
  if L7_2 then
    L7_2 = L4_2.caller
    L8_2 = L7_2.number
    L7_2 = L2_1
    L7_2[L8_2] = L3_2
    L7_2 = TriggerClientEvent
    L8_2 = "tablet:police:setInCall"
    L9_2 = -1
    L10_2 = {}
    L11_2 = L4_2.caller
    L11_2 = L11_2.number
    L10_2.number = L11_2
    L10_2.inCall = true
    L11_2 = L4_2.callee
    L11_2 = L11_2.number
    if not L11_2 then
      L11_2 = L4_2.company
    end
    L10_2.inCallWith = L11_2
    L11_2 = os
    L11_2 = L11_2.time
    L11_2 = L11_2()
    L12_2 = L4_2.started
    L11_2 = L11_2 - L12_2
    L10_2.duration = L11_2
    L7_2(L8_2, L9_2, L10_2)
  end
  L7_2 = L3_1
  L8_2 = {}
  L7_2[L3_2] = L8_2
end
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L1_1
  L1_2 = L1_2[A0_2]
  if L1_2 then
    L1_2 = debugprint
    L2_2 = "Phone number is already wiretapped:"
    L3_2 = A0_2
    L1_2(L2_2, L3_2)
    return
  end
  L1_2 = L1_1
  L1_2[A0_2] = true
  L1_2 = MySQL
  L1_2 = L1_2.scalar
  L2_2 = "SELECT `name` FROM phone_phones WHERE phone_number = ?"
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = TriggerClientEvent
    L2_3 = "tablet:police:createWiretap"
    L3_3 = -1
    L4_3 = {}
    L5_3 = A0_2
    L4_3.phoneNumber = L5_3
    L4_3.phoneName = A0_3
    L1_3(L2_3, L3_3, L4_3)
    L1_3 = Citizen
    L1_3 = L1_3.CreateThreadNow
    function L2_3()
      local L0_4, L1_4
      L0_4 = L5_1
      L1_4 = A0_2
      L0_4(L1_4)
    end
    L1_3(L2_3)
  end
  L1_2(L2_2, L3_2, L4_2)
end
AddWiretap = L6_1
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = L1_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    return
  end
  L1_2 = L1_1
  L1_2[A0_2] = nil
  L1_2 = TriggerClientEvent
  L2_2 = "tablet:police:removeWiretap"
  L3_2 = -1
  L4_2 = A0_2
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = L2_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    return
  end
  L2_2 = L3_1
  L2_2 = L2_2[L1_2]
  if not L2_2 then
    return
  end
  L3_2 = 1
  L4_2 = #L2_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = StopListeningToWiretappedCall
    L8_2 = L2_2[L6_2]
    L7_2(L8_2)
  end
  L3_2 = L3_1
  L3_2[L1_2] = nil
  L3_2 = L2_1
  L3_2[A0_2] = nil
end
RemoveWiretap = L6_1
function L6_1(A0_2)
  local L1_2
  L1_2 = L1_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L1_2 = false
  end
  return L1_2
end
IsPhoneNumberWiretapped = L6_1
function L6_1(A0_2)
  local L1_2
  L1_2 = L2_1
  L1_2 = L1_2[A0_2]
  return L1_2
end
GetWiretappedPhoneNumberCall = L6_1
function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = L2_1
  L2_2 = L2_2[A1_2]
  if not L2_2 then
    L3_2 = debugprint
    L4_2 = "No ongoing call found for phone number:"
    L5_2 = A1_2
    L3_2(L4_2, L5_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = L3_1
  L3_2 = L3_2[L2_2]
  if not L3_2 then
    L4_2 = debugprint
    L5_2 = "No listeners found for call ID:"
    L6_2 = L2_2
    L4_2(L5_2, L6_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = L4_1
  L4_2 = L4_2[A0_2]
  if L4_2 ~= L2_2 then
    L4_2 = table
    L4_2 = L4_2.contains
    L5_2 = L3_2
    L6_2 = A0_2
    L4_2 = L4_2(L5_2, L6_2)
    if not L4_2 then
      goto lbl_38
    end
  end
  L4_2 = debugprint
  L5_2 = "Source is already listening to the call:"
  L6_2 = A0_2
  L4_2(L5_2, L6_2)
  L4_2 = false
  do return L4_2 end
  ::lbl_38::
  L4_2 = StopListeningToWiretappedCall
  L5_2 = A0_2
  L4_2(L5_2)
  L4_2 = exports
  L4_2 = L4_2["lb-phone"]
  L5_2 = L4_2
  L4_2 = L4_2.GetCall
  L6_2 = L2_2
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L5_2 = debugprint
    L6_2 = "Call not found for call ID:"
    L7_2 = L2_2
    L5_2(L6_2, L7_2)
    L5_2 = false
    return L5_2
  end
  L5_2 = #L3_2
  L5_2 = L5_2 + 1
  L3_2[L5_2] = A0_2
  L5_2 = L4_1
  L5_2[A0_2] = L2_2
  L5_2 = TriggerClientEvent
  L6_2 = "phone:phone:addVoiceTarget"
  L7_2 = A0_2
  L8_2 = L4_2.caller
  L8_2 = L8_2.source
  L9_2 = true
  L10_2 = true
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  L5_2 = TriggerClientEvent
  L6_2 = "phone:phone:addVoiceTarget"
  L7_2 = L4_2.caller
  L7_2 = L7_2.source
  L8_2 = A0_2
  L9_2 = false
  L10_2 = true
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  L5_2 = TriggerClientEvent
  L6_2 = "phone:phone:addVoiceTarget"
  L7_2 = A0_2
  L8_2 = L4_2.callee
  L8_2 = L8_2.source
  L9_2 = true
  L10_2 = true
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  L5_2 = TriggerClientEvent
  L6_2 = "phone:phone:addVoiceTarget"
  L7_2 = L4_2.callee
  L7_2 = L7_2.source
  L8_2 = A0_2
  L9_2 = false
  L10_2 = true
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  L5_2 = true
  return L5_2
end
ListenToWiretappedCall = L6_1
function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = L4_1
  L2_2 = L2_2[A0_2]
  if not L2_2 then
    L3_2 = debugprint
    L4_2 = "No call found for source:"
    L5_2 = A0_2
    L3_2(L4_2, L5_2)
    return
  end
  L3_2 = L4_1
  L3_2[A0_2] = nil
  L3_2 = L3_1
  L3_2 = L3_2[L2_2]
  if not L3_2 then
    L4_2 = debugprint
    L5_2 = "No listeners found for call ID:"
    L6_2 = L2_2
    L4_2(L5_2, L6_2)
    return
  end
  L4_2 = 1
  L5_2 = #L3_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = L3_2[L7_2]
    if L8_2 == A0_2 then
      L8_2 = table
      L8_2 = L8_2.remove
      L9_2 = L3_2
      L10_2 = L7_2
      L8_2(L9_2, L10_2)
      break
    end
  end
  if not A1_2 then
    L4_2 = exports
    L4_2 = L4_2["lb-phone"]
    L5_2 = L4_2
    L4_2 = L4_2.GetCall
    L6_2 = L2_2
    L4_2 = L4_2(L5_2, L6_2)
    A1_2 = L4_2
    if not A1_2 then
      L4_2 = debugprint
      L5_2 = "Call not found:"
      L6_2 = L2_2
      L4_2(L5_2, L6_2)
      return
    end
  end
  L4_2 = TriggerClientEvent
  L5_2 = "phone:phone:removeVoiceTarget"
  L6_2 = A0_2
  L7_2 = A1_2.caller
  L7_2 = L7_2.source
  L8_2 = true
  L9_2 = true
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L4_2 = TriggerClientEvent
  L5_2 = "phone:phone:removeVoiceTarget"
  L6_2 = A1_2.caller
  L6_2 = L6_2.source
  L7_2 = A0_2
  L8_2 = false
  L9_2 = true
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L4_2 = TriggerClientEvent
  L5_2 = "phone:phone:removeVoiceTarget"
  L6_2 = A0_2
  L7_2 = A1_2.callee
  L7_2 = L7_2.source
  L8_2 = true
  L9_2 = true
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L4_2 = TriggerClientEvent
  L5_2 = "phone:phone:removeVoiceTarget"
  L6_2 = A1_2.callee
  L6_2 = L6_2.source
  L7_2 = A0_2
  L8_2 = false
  L9_2 = true
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
end
StopListeningToWiretappedCall = L6_1
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = {}
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "SELECT tablet_id FROM lbtablet_police_wiretaps_subscribers WHERE phone_number = ?"
  L4_2 = {}
  L5_2 = A0_2
  L4_2[1] = L5_2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = 1
  L4_2 = #L2_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = L2_2[L6_2]
    L7_2 = L7_2.tablet_id
    L1_2[L6_2] = L7_2
  end
  L3_2 = #L1_2
  if 0 == L3_2 then
    return
  end
  L3_2 = NotifyTablets
  L4_2 = L1_2
  L5_2 = {}
  L5_2.app = "Police"
  L6_2 = L
  L7_2 = "BACKEND.POLICE.WIRETAP_NOTIFICATION.TITLE"
  L6_2 = L6_2(L7_2)
  L5_2.title = L6_2
  L6_2 = L
  L7_2 = "BACKEND.POLICE.WIRETAP_NOTIFICATION.CONTENT"
  L8_2 = {}
  L9_2 = exports
  L9_2 = L9_2["lb-phone"]
  L10_2 = L9_2
  L9_2 = L9_2.FormatNumber
  L11_2 = A0_2
  L9_2 = L9_2(L10_2, L11_2)
  L8_2.number = L9_2
  L6_2 = L6_2(L7_2, L8_2)
  L5_2.content = L6_2
  L3_2(L4_2, L5_2)
end
L7_1 = AddEventHandler
L8_1 = "lb-phone:callAnswered"
function L9_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = A0_2.caller
  L2_2 = L1_2.number
  L1_2 = L1_1
  L1_2 = L1_2[L2_2]
  if not L1_2 then
    L1_2 = A0_2.callee
    L1_2 = L1_2.number
    if L1_2 then
      L1_2 = A0_2.callee
      L2_2 = L1_2.number
      L1_2 = L1_1
      L1_2 = L1_2[L2_2]
      if not L1_2 then
        L1_2 = debugprint
        L2_2 = "Call is not wiretapped:"
        L3_2 = A0_2.caller
        L3_2 = L3_2.number
        L4_2 = A0_2.callee
        L4_2 = L4_2.number
        L1_2(L2_2, L3_2, L4_2)
        return
      end
    end
  end
  L1_2 = Wait
  L2_2 = L0_1
  L1_2(L2_2)
  L1_2 = A0_2.callId
  L2_2 = exports
  L2_2 = L2_2["lb-phone"]
  L3_2 = L2_2
  L2_2 = L2_2.GetCall
  L4_2 = L1_2
  L2_2 = L2_2(L3_2, L4_2)
  A0_2 = L2_2
  if not A0_2 then
    L2_2 = debugprint
    L3_2 = "Call not found after waiting for duration:"
    L4_2 = L1_2
    L2_2(L3_2, L4_2)
    return
  end
  L2_2 = A0_2.caller
  L3_2 = L2_2.number
  L2_2 = L1_1
  L2_2 = L2_2[L3_2]
  if L2_2 then
    L2_2 = L6_1
    L3_2 = A0_2.caller
    L3_2 = L3_2.number
    L2_2(L3_2)
    L2_2 = A0_2.caller
    L3_2 = L2_2.number
    L2_2 = L2_1
    L2_2[L3_2] = L1_2
    L2_2 = TriggerClientEvent
    L3_2 = "tablet:police:setInCall"
    L4_2 = -1
    L5_2 = {}
    L6_2 = A0_2.caller
    L6_2 = L6_2.number
    L5_2.number = L6_2
    L5_2.inCall = true
    L6_2 = A0_2.callee
    L6_2 = L6_2.number
    if not L6_2 then
      L6_2 = A0_2.company
    end
    L5_2.inCallWith = L6_2
    L6_2 = os
    L6_2 = L6_2.time
    L6_2 = L6_2()
    L7_2 = A0_2.started
    L6_2 = L6_2 - L7_2
    L5_2.duration = L6_2
    L2_2(L3_2, L4_2, L5_2)
  end
  L2_2 = A0_2.callee
  L2_2 = L2_2.number
  if L2_2 then
    L2_2 = A0_2.callee
    L3_2 = L2_2.number
    L2_2 = L1_1
    L2_2 = L2_2[L3_2]
    if L2_2 then
      L2_2 = L6_1
      L3_2 = A0_2.callee
      L3_2 = L3_2.number
      L2_2(L3_2)
      L2_2 = A0_2.callee
      L3_2 = L2_2.number
      L2_2 = L2_1
      L2_2[L3_2] = L1_2
      L2_2 = TriggerClientEvent
      L3_2 = "tablet:police:setInCall"
      L4_2 = -1
      L5_2 = {}
      L6_2 = A0_2.callee
      L6_2 = L6_2.number
      L5_2.number = L6_2
      L5_2.inCall = true
      L6_2 = A0_2.caller
      L6_2 = L6_2.number
      L5_2.inCallWith = L6_2
      L6_2 = os
      L6_2 = L6_2.time
      L6_2 = L6_2()
      L7_2 = A0_2.started
      L6_2 = L6_2 - L7_2
      L5_2.duration = L6_2
      L2_2(L3_2, L4_2, L5_2)
    end
  end
  L2_2 = L3_1
  L3_2 = {}
  L2_2[L1_2] = L3_2
end
L7_1(L8_1, L9_1)
L7_1 = AddEventHandler
L8_1 = "lb-phone:callEnded"
function L9_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = A0_2.callId
  L2_2 = L3_1
  L2_2 = L2_2[L1_2]
  if not L2_2 then
    return
  end
  L2_2 = A0_2.caller
  L3_2 = L2_2.number
  L2_2 = L2_1
  L2_2 = L2_2[L3_2]
  if L2_2 then
    L2_2 = A0_2.caller
    L3_2 = L2_2.number
    L2_2 = L2_1
    L2_2[L3_2] = nil
    L2_2 = TriggerClientEvent
    L3_2 = "tablet:police:setInCall"
    L4_2 = -1
    L5_2 = {}
    L6_2 = A0_2.caller
    L6_2 = L6_2.number
    L5_2.number = L6_2
    L5_2.inCall = false
    L2_2(L3_2, L4_2, L5_2)
  end
  L2_2 = A0_2.callee
  L2_2 = L2_2.number
  if L2_2 then
    L2_2 = A0_2.callee
    L3_2 = L2_2.number
    L2_2 = L2_1
    L2_2 = L2_2[L3_2]
    if L2_2 then
      L2_2 = A0_2.callee
      L3_2 = L2_2.number
      L2_2 = L2_1
      L2_2[L3_2] = nil
      L2_2 = TriggerClientEvent
      L3_2 = "tablet:police:setInCall"
      L4_2 = -1
      L5_2 = {}
      L6_2 = A0_2.callee
      L6_2 = L6_2.number
      L5_2.number = L6_2
      L5_2.inCall = false
      L2_2(L3_2, L4_2, L5_2)
    end
  end
  L2_2 = 1
  L3_2 = L3_1
  L3_2 = L3_2[L1_2]
  L3_2 = #L3_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = StopListeningToWiretappedCall
    L7_2 = L3_1
    L7_2 = L7_2[L1_2]
    L7_2 = L7_2[L5_2]
    L8_2 = A0_2
    L6_2(L7_2, L8_2)
  end
  L2_2 = L3_1
  L2_2[L1_2] = nil
end
L7_1(L8_1, L9_1)
L7_1 = OnPlayerDisconnect
function L8_1(A0_2)
  local L1_2, L2_2
  L1_2 = StopListeningToWiretappedCall
  L2_2 = A0_2
  L1_2(L2_2)
end
L7_1(L8_1)
L7_1 = Config
L7_1 = L7_1.DisableWiretapWarning
if not L7_1 then
  L7_1 = SetTimeout
  L8_1 = 3000
  function L9_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
    L0_2 = GetPhoneConfig
    L0_2 = L0_2()
    L0_2 = L0_2.Voice
    L0_2 = L0_2.System
    if "pma" == L0_2 or "mumble" == L0_2 then
      return
    end
    while true do
      L1_2 = infoprint
      L2_2 = "warning"
      L3_2 = "Your phone's voice system is set to '"
      L4_2 = L0_2 or L4_2
      if not L0_2 then
        L4_2 = "nil"
      end
      L5_2 = "', which does not support wiretapping by default."
      L3_2 = L3_2 .. L4_2 .. L5_2
      L1_2(L2_2, L3_2)
      L1_2 = infoprint
      L2_2 = "warning"
      L3_2 = "You can implement wiretapping support for your voice system by implementing the 'phone:phone:addVoiceTarget' and 'phone:phone:removeVoiceTarget' events in lb-phone/client/custom/functions/voice.lua."
      L1_2(L2_2, L3_2)
      L1_2 = infoprint
      L2_2 = "warning"
      L3_2 = "To disable this warning, set Config.DisableWiretapWarning to true, or disable Config.Police.Wiretapping."
      L1_2(L2_2, L3_2)
      L1_2 = Wait
      L2_2 = 5000
      L1_2(L2_2)
    end
  end
  L7_1(L8_1, L9_1)
end
