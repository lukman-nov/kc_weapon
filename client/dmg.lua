Citizen.CreateThread(function()
  while true do
    local Sleep = 500
    local playerPed = GetPlayerPed(-1)
    local weaponsConfig = Config.Weapons[GetSelectedPedWeapon(playerPed)]

    if weaponsConfig then
      Sleep = 100
      if weaponsConfig.disableCritical then
        SetPedSuffersCriticalHits(playerPed, false)
      end
      N_0x4757f00bc6323cfe(weaponsConfig.model, weaponsConfig.damage)
    end
    Citizen.Wait(Sleep)
  end
end)
