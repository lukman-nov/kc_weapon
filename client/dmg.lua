Citizen.CreateThread(function()
  N_0x4757f00bc6323cfe(GetHashKey('WEAPON_UNARMED'), Config.Weapons[`WEAPON_UNARMED`].damage)
  while true do
    Citizen.Wait(0)
    local playerPed = GetPlayerPed(-1)
    local _, hash = GetCurrentPedWeapon(playerPed, false)
    local weaponsConfig = Config.Weapons[hash]

    if weaponsConfig ~= nil then 
      SetPedSuffersCriticalHits(playerPed, weaponsConfig.critical)
      if weaponsConfig.name ~= 'WEAPON_UNARMED' then
        N_0x4757f00bc6323cfe(GetHashKey(weaponsConfig.name), weaponsConfig.damage)
      else
        Citizen.Wait(1000)
      end
    else
      if Config.Whitelist then
        RemoveWeaponFromPed(playerPed, hash)
      else
        N_0x4757f00bc6323cfe(hash, Config.DefaultDamage)
        Citizen.Wait(0)
      end
    end
  end
end)
