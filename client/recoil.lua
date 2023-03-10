local scopedWeapons = {
	100416529,  -- WEAPON_SNIPERRIFLE
	205991906,  -- WEAPON_HEAVYSNIPER
	3342088282, -- WEAPON_MARKSMANRIFLE
	177293209,   -- WEAPON_HEAVYSNIPER MKII
	1785463520  -- WEAPON_MARKSMANRIFLE_MK2
}

local recoils = {
	[453432689] 		= 0.3, -- PISTOL
	[3219281620] 		= 0.3, -- PISTOL MK2
	[1593441988]		= 0.2, -- COMBAT PISTOL
	[584646201] 		= 0.1, -- AP PISTOL
	[2578377531] 		= 0.6, -- PISTOL .50
	[324215364] 		= 0.2, -- MICRO SMG
	[736523883] 		= 0.1, -- SMG
	[2024373456] 		= 0.1, -- SMG MK2
	[4024951519] 		= 0.1, -- ASSAULT SMG
	[3220176749] 		= 0.2, -- ASSAULT RIFLE
	[961495388] 		= 0.2, -- ASSAULT RIFLE MK2
	[2210333304] 		= 0.1, -- CARBINE RIFLE
	[4208062921] 		= 0.1, -- CARBINE RIFLE MK2
	[2937143193] 		= 0.1, -- ADVANCED RIFLE
	[2634544996] 		= 0.1, -- MG
	[2144741730] 		= 0.1, -- COMBAT MG
	[3686625920] 		= 0.1, -- COMBAT MG MK2
	[487013001] 		= 0.4, -- PUMP SHOTGUN
	[1432025498] 		= 0.4, -- PUMP SHOTGUN MK2
	[2017895192] 		= 0.7, -- SAWNOFF SHOTGUN
	[3800352039] 		= 0.4, -- ASSAULT SHOTGUN
	[2640438543] 		= 0.2, -- BULLPUP SHOTGUN
	[911657153] 		= 0.1, -- STUN GUN
	[100416529] 		= 0.5, -- SNIPER RIFLE
	[205991906] 		= 0.7, -- HEAVY SNIPER
	[177293209] 		= 0.7, -- HEAVY SNIPER MK2
	[856002082] 		= 1.2, -- REMOTE SNIPER
	[2726580491] 		= 1.0, -- GRENADE LAUNCHER
	[1305664598] 		= 1.0, -- GRENADE LAUNCHER SMOKE
	[2982836145] 		= 0.0, -- RPG
	[1752584910] 		= 0.0, -- STINGER
	[1119849093] 		= 0.01, -- MINIGUN
	[3218215474] 		= 0.2, -- SNS PISTOL
	[2009644972] 		= 0.25, -- SNS PISTOL MK2
	[1627465347] 		= 0.1, -- GUSENBERG
	[3231910285] 		= 0.2, -- SPECIAL CARBINE
	[-1768145561] 	= 0.25, -- SPECIAL CARBINE MK2
	[3523564046] 		= 0.5, -- HEAVY PISTOL
	[2132975508] 		= 0.2, -- BULLPUP RIFLE
	[-2066285827] 	= 0.25, -- BULLPUP RIFLE MK2
	[137902532] 		= 0.4, -- VINTAGE PISTOL
	[-1746263880] 	= 0.4, -- DOUBLE ACTION REVOLVER
	[2828843422] 		= 0.7, -- MUSKET
	[984333226] 		= 0.2, -- HEAVY SHOTGUN
	[3342088282] 		= 0.3, -- MARKSMAN RIFLE
	[1785463520] 		= 0.35, -- MARKSMAN RIFLE MK2
	[1672152130] 		= 0, -- HOMING LAUNCHER
	[1198879012] 		= 0.9, -- FLARE GUN
	[171789620] 		= 0.2, -- COMBAT PDW
	[3696079510] 		= 0.9, -- MARKSMAN PISTOL
  [1834241177] 		= 2.4, -- RAILGUN
	[3675956304] 		= 0.3, -- MACHINE PISTOL
	[3249783761] 		= 0.6, -- REVOLVER
	[-879347409] 		= 0.65, -- REVOLVER MK2
	[4019527611] 		= 0.7, -- DOUBLE BARREL SHOTGUN
	[1649403952] 		= 0.3, -- COMPACT RIFLE
	[317205821] 		= 0.2, -- AUTO SHOTGUN
	[125959754] 		= 0.5, -- COMPACT LAUNCHER
	[3173288789] 		= 0.1, -- MINI SMG		
}

function HashInTable( hash )
	for k, v in pairs( scopedWeapons ) do 
		if ( hash == v ) then 
			return true 
		end 
	end 
	return false 
end 

function ManageReticle(status)
	local playerPed = GetPlayerPed(-1)
	local _, hash = GetCurrentPedWeapon(playerPed, true)
	if not status then
		if not HashInTable(hash) then 
			HideHudComponentThisFrame(14)
		end 
	end
end 

Citizen.CreateThread(function()
	while true do
		local Sleep = 1000
		local playerPed = GetPlayerPed(-1)
		local weapon = GetSelectedPedWeapon(playerPed)
		if GetCurrentPedWeapon(playerPed) then
			Sleep = 1
			if IsPedShooting(PlayerPedId()) and not IsPedDoingDriveby(PlayerPedId()) then
				local _, wep = GetCurrentPedWeapon(PlayerPedId())
				_, cAmmo = GetAmmoInClip(PlayerPedId(), wep)
				if recoils[wep] and recoils[wep] ~= 0 then
					tv = 0
					repeat 
						Wait(0)
						p = GetGameplayCamRelativePitch()
						if GetFollowPedCamViewMode() ~= 4 then
							SetGameplayCamRelativePitch(p+0.4, 0.6)
						end
						tv = tv+0.4
					until tv >= recoils[wep]
				end
			end
		end
		Citizen.Wait(Sleep)
	end
end)

Citizen.CreateThread(function()
	while true do
		local Sleep = 1000
		local playerPed = GetPlayerPed(-1)
		local weapon = GetSelectedPedWeapon(playerPed)
		local currentWeapon = GetCurrentPedWeapon(playerPed)
		if currentWeapon then
			Sleep = 1

			DisplayAmmoThisFrame(Config.DisplayAmmo)
			ManageReticle(Config.DisplayCrosshair)

			if IsPedArmed(playerPed, 6) then
				DisableControlAction(1, 140, true)
				DisableControlAction(1, 141, true)
				DisableControlAction(1, 142, true)
			end
			
			for k, v in pairs(Config.Weapons) do
				if weapon == v.hash then
					if IsPedShooting(playerPed) then
						ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', v.recoil)
					end
				end
			end
		end
		Citizen.Wait(Sleep)
	end
end)
