Citizen.CreateThread(function()
  N_0x4757f00bc6323cfe(Config.Weapons[`WEAPON_UNARMED`].model, Config.Weapons[`WEAPON_UNARMED`].damage)
  while true do
    local Sleep = 1000
    local playerPed = PlayerPedId()
    local weaponsConfig = Config.Weapons[GetSelectedPedWeapon(playerPed)]

    if weaponsConfig and weaponsConfig.model ~= Config.Weapons[`WEAPON_UNARMED`].model then
      Sleep = 0
      if weaponsConfig.disableCritical then
        SetPedSuffersCriticalHits(playerPed, false)
      end
      N_0x4757f00bc6323cfe(weaponsConfig.model, weaponsConfig.damage)
    end
    Citizen.Wait(Sleep)
  end
end)