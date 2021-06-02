
Citizen.CreateThread(function()

  RequestModel(GetHashKey("u_m_y_abner"))
  while not HasModelLoaded(GetHashKey("u_m_y_abner")) do
    Wait(1)
  end

  RequestAnimDict("mini@strip_club@idles@bouncer@base")
  while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
    Wait(1)
  end
  ped =  CreatePed(4, "u_m_y_abner", -265.61596679688, -962.90704345703, 30.223148345947, 200.0, false, true)
  SetEntityHeading(ped, 200.0)
  FreezeEntityPosition(ped, true)
  SetEntityInvincible(ped, true)
  SetBlockingOfNonTemporaryEvents(ped, true)
  TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)

end)