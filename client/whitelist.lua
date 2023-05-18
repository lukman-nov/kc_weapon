Citizen.CreateThread(function()
  while Config.WhiteListWeapon do
    local weaponsConfig = Config.Weapons[GetSelectedPedWeapon(GetPlayerPed(-1))]
    local weaponsGroup = GetWeapontypeGroup(GetSelectedPedWeapon(GetPlayerPed(-1)))
    if not weaponsConfig and weaponsGroup ~= 'GROUP_MELEE' and GetSelectedPedWeapon(GetPlayerPed(-1)) ~= 966099553 then
      RemoveAllPedWeapons(GetPlayerPed(-1))
      print('This is not a whitelist weapon!')
      -- NetworkSessionKickPlayer(GetPlayerFromServerId(source))
      TriggerServerEvent('kc_weapon:playerKick')
    end
    Citizen.Wait(1000)
  end
end)