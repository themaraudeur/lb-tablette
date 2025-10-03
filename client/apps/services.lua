local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = {}
L1_1 = 1
L2_1 = Config
L2_1 = L2_1.Services
L2_1 = L2_1.Companies
L2_1 = #L2_1
L3_1 = 1
for L4_1 = L1_1, L2_1, L3_1 do
  L5_1 = Config
  L5_1 = L5_1.Services
  L5_1 = L5_1.Companies
  L5_1 = L5_1[L4_1]
  L6_1 = L5_1.job
  L0_1[L6_1] = L5_1
end
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  if not A0_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = Config
  L1_2 = L1_2.Services
  L1_2 = L1_2.SeeEmployees
  if "none" == L1_2 then
    L1_2 = debugprint
    L2_2 = "No one is allowed to see employees"
    L1_2(L2_2)
    L1_2 = false
    return L1_2
  else
    L1_2 = Config
    L1_2 = L1_2.Services
    L1_2 = L1_2.SeeEmployees
    if "employees" == L1_2 then
      L1_2 = GetJob
      L1_2 = L1_2()
      if L1_2 ~= A0_2 then
        L1_2 = debugprint
        L2_2 = "Player has the wrong job"
        L1_2(L2_2)
        L1_2 = false
        return L1_2
      end
    end
  end
  L1_2 = AwaitCallback
  L2_2 = "services:getEmployeeList"
  L3_2 = A0_2
  return L1_2(L2_2, L3_2)
end
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = AwaitCallback
  L2_2 = "services:getRecentMessages"
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = 1
  L3_2 = #L1_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = L1_2[L5_2]
    L8_2 = L6_2.company
    L7_2 = L0_1
    L7_2 = L7_2[L8_2]
    if L7_2 then
      L8_2 = {}
      L9_2 = L7_2.icon
      L8_2.icon = L9_2
      L9_2 = L7_2.name
      L8_2.name = L9_2
      L9_2 = L7_2.job
      L8_2.job = L9_2
      L6_2.company = L8_2
    end
  end
  return L1_2
end
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = AwaitCallback
  L3_2 = "services:getMessages"
  L4_2 = A0_2
  L5_2 = A1_2
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = Config
  L3_2 = L3_2.LBPhone
  if L3_2 then
    L3_2 = GetPhoneNumber
    L3_2 = L3_2()
  end
  L4_2 = 1
  L5_2 = #L2_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = L2_2[L7_2]
    L9_2 = L8_2.sender
    L9_2 = L9_2 == L3_2
    L8_2.isSender = L9_2
  end
  return L2_2
end
L4_1 = ReactCallback
L5_1 = "Services"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = A0_2.action
  if "getCompanies" == L1_2 then
    L2_2 = AwaitCallback
    L3_2 = "services:getCompanies"
    return L2_2(L3_2)
  elseif "getEmployees" == L1_2 then
    L2_2 = L1_1
    L3_2 = A0_2.company
    return L2_2(L3_2)
  end
  if "getRecentMessages" == L1_2 then
    L2_2 = L2_1
    L3_2 = A0_2.page
    return L2_2(L3_2)
  elseif "getMessages" == L1_2 then
    L2_2 = L3_1
    L3_2 = A0_2.id
    L4_2 = A0_2.lastId
    return L2_2(L3_2, L4_2)
  end
  if "getCompany" == L1_2 then
    L2_2 = GetCompanyData
    return L2_2()
  else
    if "depositMoney" == L1_2 then
      L2_2 = Config
      L2_2 = L2_2.Services
      L2_2 = L2_2.Management
      L2_2 = L2_2.Deposit
      if L2_2 then
        L2_2 = DepositMoney
        L3_2 = A0_2.amount
        return L2_2(L3_2)
    end
    else
      if "withdrawMoney" == L1_2 then
        L2_2 = Config
        L2_2 = L2_2.Services
        L2_2 = L2_2.Management
        L2_2 = L2_2.Withdraw
        if L2_2 then
          L2_2 = WithdrawMoney
          L3_2 = A0_2.amount
          return L2_2(L3_2)
      end
      else
        if "hireEmployee" == L1_2 then
          L2_2 = Config
          L2_2 = L2_2.Services
          L2_2 = L2_2.Management
          L2_2 = L2_2.Hire
          if L2_2 then
            L2_2 = HireEmployee
            L3_2 = A0_2.source
            return L2_2(L3_2)
        end
        else
          if "fireEmployee" == L1_2 then
            L2_2 = Config
            L2_2 = L2_2.Services
            L2_2 = L2_2.Management
            L2_2 = L2_2.Fire
            if L2_2 then
              L2_2 = FireEmployee
              L3_2 = A0_2.employee
              return L2_2(L3_2)
          end
          else
            if "setGrade" == L1_2 then
              L2_2 = Config
              L2_2 = L2_2.Services
              L2_2 = L2_2.Management
              L2_2 = L2_2.Promote
              if L2_2 then
                L2_2 = SetGrade
                L3_2 = A0_2.employee
                L4_2 = A0_2.grade
                return L2_2(L3_2, L4_2)
            end
            else
              if "toggleDuty" == L1_2 then
                L2_2 = ToggleDuty
                if L2_2 then
                  L2_2 = Config
                  L2_2 = L2_2.Services
                  L2_2 = L2_2.Management
                  L2_2 = L2_2.Duty
                  if L2_2 then
                    L2_2 = ToggleDuty
                    L2_2()
                    L2_2 = true
                    return L2_2
                end
              end
              elseif "toggleCalls" == L1_2 then
                L2_2 = ToggleCompanyCalls
                if L2_2 then
                  L2_2 = ToggleCompanyCalls
                  return L2_2()
                end
              end
            end
          end
        end
      end
    end
  end
  L2_2 = debugprint
  L3_2 = "Services: invalid action"
  L4_2 = L1_2
  L2_2(L3_2, L4_2)
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "phone:services:newMessage"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = A0_2.sender
  L2_2 = GetPhoneNumber
  L2_2 = L2_2()
  L1_2 = L1_2 == L2_2
  A0_2.isSender = L1_2
  L1_2 = SendReactMessage
  L2_2 = "services:newMessage"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "phone:services:channelDeleted"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "services:channelDeleted"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L4_1(L5_1, L6_1)
