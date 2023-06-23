local hasWeapon = false
local curWeapon = nil
local scopedWeapons = {
	100416529,  -- WEAPON_SNIPERRIFLE
	205991906,  -- WEAPON_HEAVYSNIPER
	3342088282, -- WEAPON_MARKSMANRIFLE
	177293209,   -- WEAPON_HEAVYSNIPER MKII
	1785463520  -- WEAPON_MARKSMANRIFLE_MK2
}

function HashInTable( hash )
	for k, v in pairs( scopedWeapons ) do 
		if ( hash == v ) then 
			return true 
		end 
	end 
	return false 
end 

function ManageReticle(status, ped)
	local _, hash = GetCurrentPedWeapon(ped, true)
	if not status then
		if not HashInTable(hash) then 
			HideHudComponentThisFrame(14)
		end 
	end
end

AddEventHandler('ox_inventory:currentWeapon', function(data)
  if data then
		hasWeapon = true
		curWeapon = data.hash
	else
		hasWeapon = false
  end
end)

Citizen.CreateThread(function()
	while true do
		local Sleep = 500
		local playerPed = GetPlayerPed(-1)
		local _, hash = GetCurrentPedWeapon(playerPed, false)

		if hasWeapon then
			Sleep = 0 
			local weaponConfig = Config.Weapons[curWeapon or hash]
			
			ManageReticle(Config.DisplayCrosshair, playerPed)
			DisplayAmmoThisFrame(Config.DisplayAmmo)

			if weaponConfig then
				if IsPedArmed(playerPed, 6) then
					DisableControlAction(1, 140, true)
					DisableControlAction(1, 141, true)
					DisableControlAction(1, 142, true)
				end
	
				if IsPedShooting(playerPed) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', weaponConfig.recoil)
				end
			else
				if IsPedShooting(playerPed) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', Config.DefaultRecoil)
				end
			end
		end
		Citizen.Wait(Sleep)
	end
end)