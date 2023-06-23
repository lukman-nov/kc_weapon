Config = {}

-- [[ ESX ]] --
Config.Core         = 'ESX'
Config.CoreFolder   = 'es_extended'
Config.PlayerLoaded = 'esx:playerLoaded'
Config.PlayerUnload = 'esx:onPlayerLogout'

-- [[ QB ]] --

-- Config.Core         = 'QB'
-- Config.CoreFolder   = 'qb-core'
-- Config.PlayerLoaded = 'QBCore:Client:OnPlayerLoaded'
-- Config.PlayerUnload = 'QBCore:Client:OnPlayerUnload'

Config.CheckForUpdates  = true
Config.DisplayAmmo      = false -- display ammo on screen
Config.DisplayCrosshair = false -- display default crosshair on screen
Config.WhitelistWeapon  = true  -- if set true, then players cannot use weapons that are not in the Config.Weapons list.
Config.DefaultDamage    = 0.0   -- default damage for weapons that are not listed
Config.DefaultRecoil    = 5.0   -- default recoil for weapons that are not listed

Config.Officer = {
  ['police'] = true,
  ['offpolice'] = true,
}

-- IMPORTANT!
-- IF YOU ADD WEAPONS TO THE LIST MAKE SURE YOU USE `` QUOTES FOR THE WEAPON HASH INSTEAD OF '' QUOTES
-- YOU CAN GET WEAPON MODEL ON https://gtahash.ru/

Config.Weapons = {
  -- [[ MALE ]] --
  [`WEAPON_UNARMED`] = { -- weapon hash
    name = 'WEAPON_UNARMED', -- weapon name
    damage = 0.25, -- weapon damage
    critical = false, -- critical or headshot
    recoil = 0.0, -- weapon Recoil
    officer = nil, -- location for weapon on body if player are officer (DON'T SET NIL)
    usual = nil, -- location for weapon on body if player not officer (DON'T SET NIL)
    model = nil -- weapon model (DON'T SET NIL)
  },

  [`WEAPON_PETROLCAN`] = {
    name = 'WEAPON_PETROLCAN',
    damage = 0.0,
    critical = false,
    recoil = 0.0,
    officer = { bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 24818, x = 65536.0, y = 65536.0, z = 65536.0, xRot = 0.0, yRot = 0.0, zRot = 0.0},
    model = 'w_am_jerrycan',
  },

  [`WEAPON_NIGHTSTICK`] = {
    name = 'WEAPON_NIGHTSTICK',
    damage = 0.25,
    critical = false,
    recoil = 0.001,
    officer = { bone = 51826, x = -0.01, y = 0.0, z = 0.1, xRot = -90.0, yRot = 180.0, zRot = 90.0},
    usual = { bone = 51826, x = -0.01, y = 0.0, z = 0.1, xRot = -90.0, yRot = 180.0, zRot = 90.0},
    model = 'w_me_nightstick',
  },

  [`WEAPON_FLASHLIGHT`] = {
    name = 'WEAPON_FLASHLIGHT',
    damage = 0.15, 
    critical = false,
    recoil = 0.001,
    officer = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    usual = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    model = 'w_me_flashlight',
  },

  [`WEAPON_KNIFE`] = {
    name = 'WEAPON_KNIFE',
    damage = 0.35, 
    critical = false,
    recoil = 0.001,
    officer = { bone = 57597, x = 0.1, y = -0.13, z = -0.12, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    usual = { bone = 57597, x = 0.1, y = -0.13, z = -0.12, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    model = 'prop_w_me_knife_01',
  },

  [`WEAPON_KNUCKLE`] = {
    name = 'WEAPON_KNUCKLE',
    damage = 0.25, 
    critical = false,
    recoil = 0.001,
    officer = { bone = 57597, x = 0.1, y = -0.13, z = -0.05, xRot = 180.0, yRot = -180.0, zRot = 90.0},
    usual = { bone = 57597, x = 0.1, y = -0.13, z = -0.05, xRot = 180.0, yRot = -180.0, zRot = 90.0},
    model = 'w_me_knuckle',
  },

  [`WEAPON_BAT`] = {
    name = 'WEAPON_BAT',
    damage = 0.3, 
    critical = false,
    recoil = 0.001,
    officer = { bone = 24818, x = 0.25, y = -0.135, z = -0.2, xRot = -180.0, yRot = 225.0, zRot = 0.0},
    usual = { bone = 24818, x = 0.25, y = -0.135, z = -0.2, xRot = -180.0, yRot = 225.0, zRot = 0.0},
    model = 'w_me_bat',
  },

  [`WEAPON_HATCHET`] = {
    name = 'WEAPON_HATCHET',
    damage = 0.25, 
    critical = false,
    recoil = 0.001,
    officer = { bone = 57597, x = 0.1, y = -0.13, z = -0.2, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    usual = { bone = 57597, x = 0.1, y = -0.13, z = -0.2, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    model = 'w_me_hatchet',
  },

  [`WEAPON_MACHETE`] = {
    name = 'WEAPON_MACHETE',
    damage = 0.5, 
    critical = false,
    recoil = 0.001,
    officer = { bone = 57597, x = 0.1, y = -0.13, z = -0.2, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    usual = { bone = 57597, x = 0.1, y = -0.13, z = -0.2, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    model = 'prop_ld_w_me_machette',
  },
  
  [`WEAPON_SWITCHBLADE`] = {
    name = 'WEAPON_SWITCHBLADE',
    damage = 0.35, 
    critical = false,
    recoil = 0.001,
    officer = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    usual = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    model = 'w_me_switchblade',
  },

  [`WEAPON_WRENCH`] = {
    name = 'WEAPON_WRENCH',
    damage = 0.35, 
    critical = false,
    recoil = 0.001,
    officer = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    usual = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    model = 'w_me_wrench',
  },

  [`WEAPON_BATTLEAXE`] = {
    name = 'WEAPON_BATTLEAXE',
    damage = 0.35, 
    critical = false,
    recoil = 0.001,
    officer = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    usual = { bone = 57597, x = 0.1, y = -0.13, z = -0.1, xRot = 180.0, yRot = -180.0, zRot = 0.0},
    model = 'w_me_battleaxe',
  },

  -- [[ PISTOL ]] --
  [`WEAPON_STUNGUN`] = {
    name = 'WEAPON_STUNGUN',
    damage = 0.0, 
    critical = false,
    recoil = 0.1,
    officer = { bone = 58271, x = -0.01, y = 0.05, z = -0.1, xRot = -70.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 58271, x = -0.01, y = 0.05, z = -0.1, xRot = -70.0, yRot = 0.0, zRot = 0.0},
    model = 'w_pi_stungun',
  },

  [`WEAPON_HEAVYPISTOL`] = {
    name = 'WEAPON_HEAVYPISTOL',
    damage = 0.65, 
    critical = false,
    recoil = 0.1,
    officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 57597, x = -0.01, y = -0.175, z = 0.0, xRot = -180.0, yRot = 135.0, zRot = 0.0},
    model = 'w_pi_heavypistol',
  },

  [`WEAPON_REVOLVER`] = {
    name = 'WEAPON_REVOLVER',
    damage = 0.30, 
    critical = false,
    recoil = 0.85,
    officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 57597, x = -0.01, y = -0.175, z = 0.0, xRot = -180.0, yRot = 135.0, zRot = 0.0},
    model = 'w_pi_revolver',
  },

  [`WEAPON_NAVYREVOLVER`] = {
    name = 'WEAPON_NAVYREVOLVER',
    damage = 0.30, 
    critical = false,
    recoil = 0.80,
    officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 57597, x = -0.01, y = -0.175, z = 0.0, xRot = -180.0, yRot = 135.0, zRot = 0.0},
    model = 'w_pi_wep2_gun',
  },

  [`WEAPON_APPISTOL`] = {
    name = 'WEAPON_APPISTOL',
    damage = 0.45, 
    critical = false,
    recoil = 0.15,
    officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 57597, x = -0.01, y = -0.175, z = 0.0, xRot = -180.0, yRot = 135.0, zRot = 0.0},
    model = 'w_pi_appistol',
  },

  [`WEAPON_CERAMICPISTOL`] = {
    name = 'WEAPON_CERAMICPISTOL',
    damage = 0.85, 
    critical = false,
    recoil = 0.15,
    officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 57597, x = -0.01, y = -0.175, z = 0.0, xRot = -180.0, yRot = 135.0, zRot = 0.0},
    model = 'w_pi_ceramic_pistol',
  },

  [`WEAPON_COMBATPISTOL`] = {
    name = 'WEAPON_COMBATPISTOL',
    damage = 0.80, 
    critical = false,
    recoil = 0.15,
    officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 57597, x = -0.01, y = -0.175, z = 0.0, xRot = -180.0, yRot = 135.0, zRot = 0.0},
    model = 'w_pi_combatpistol',
  },

  [`WEAPON_REVOLVER_MK2`] = {
    name = 'WEAPON_REVOLVER_MK2',
    damage = 0.25, 
    critical = false,
    recoil = 0.85,
    officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 57597, x = -0.01, y = -0.175, z = 0.0, xRot = -180.0, yRot = 135.0, zRot = 0.0},
    model = 'w_pi_revolvermk2',
  },

  [`WEAPON_PISTOL50`] = {
    name = 'WEAPON_PISTOL50',
    damage = 0.65, 
    critical = false,
    recoil = 0.18,
    officer = { bone = 51826, x = -0.01, y = 0.1, z = 0.07, xRot = -115.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 57597, x = -0.01, y = -0.175, z = 0.0, xRot = -180.0, yRot = 135.0, zRot = 0.0},
    model = 'w_pi_pistol50',
  },

  [`WEAPON_MACHINEPISTOL`] = {
    name = 'WEAPON_MACHINEPISTOL',
    damage = 0.39, 
    critical = false,
    recoil = 0.1,
    officer = { bone = 24818, x = 0.05, y = -0.135, z = 0.0, xRot = -180.0, yRot = 200.0, zRot = 0.0},
    usual = { bone = 24818, x = 0.05, y = -0.135, z = 0.0, xRot = -180.0, yRot = 200.0, zRot = 0.0},
    model = 'w_sb_compactsmg'
  },

  -- [[ SMG ]] --
  [`WEAPON_MINISMG`] = {
    name = 'WEAPON_MINISMG',
    damage = 0.75, 
    critical = false,
    recoil = 0.18,
    officer = { bone = 24818, x = 0.0, y = -0.135, z = 0.0, xRot = -180.0, yRot = 180.0, zRot = 0.0},
    usual = { bone = 24818, x = 0.0, y = -0.135, z = 0.0, xRot = -180.0, yRot = 180.0, zRot = 0.0},
    model = 'w_sb_minismg'
  },

  [`WEAPON_SMG`] = {
    name = 'WEAPON_SMG',
    damage = 0.55, 
    critical = false,
    recoil = 0.135,
    officer = { bone = 24818, x = 0.05, y = -0.135, z = 0.0, xRot = -180.0, yRot = 180.0, zRot = 0.0},
    usual = { bone = 24818, x = 0.05, y = -0.135, z = 0.0, xRot = -180.0, yRot = 180.0, zRot = 0.0},
    model = 'w_sb_smg'
  },

  -- [[ RIFLE ]] --
  [`WEAPON_CARBINERIFLE`] = {
    name = 'WEAPON_CARBINERIFLE',
    damage = 0.45, 
    critical = false,
    recoil = 0.08,
    officer = { bone = 24818, x = 0.125, y = -0.175, z = -0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0},
    usual = { bone = 24818, x = 0.125, y = -0.175, z = -0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0},
    model = 'w_ar_carbinerifle'
  },

  [`WEAPON_ASSAULTRIFLE`] = {
    name = 'WEAPON_ASSAULTRIFLE',
    damage = 0.50, 
    critical = false,
    recoil = 0.23,
    officer = { bone = 24818, x = 0.125, y = -0.175, z = -0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0},
    usual = { bone = 24818, x = 0.125, y = -0.175, z = -0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0},
    model = 'w_ar_assaultrifle'
  },

  -- [[ SHOUTGUN ]] --
  [`WEAPON_BULLPUPSHOTGUN`] = {
    name = 'WEAPON_BULLPUPSHOTGUN',
    damage = 0.8,
    critical = false,
    recoil = 0.8,
    officer = { bone = 24818, x = 0.0, y = -0.15, z = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0},
    usual = { bone = 24818, x = 0.0, y = -0.15, z = 0.0, xRot = 0.0, yRot = 0.0, zRot = 0.0},
    model = 'w_sg_bullpupshotgun'
  },

  -- [[ SNIPER ]] --
  [`WEAPON_HEAVYSNIPER`] = {
    name = 'WEAPON_HEAVYSNIPER',
    damage = 2.0, 
    critical = false,
    recoil = 0.5,
    officer = { bone = 24818, x = 0.2, y = -0.175, z = 0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0},
    usual = { bone = 24818, x = 0.2, y = -0.175, z = 0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0},
    model = 'w_sr_heavysnipermk2'
  },

  [`WEAPON_HEAVYSNIPER_MK2`] = {
    name = 'WEAPON_HEAVYSNIPER_MK2',
    damage = 2.0, 
    critical = false,
    recoil = 0.5,
    officer = { bone = 24818, x = 0.2, y = -0.175, z = 0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0},
    usual = { bone = 24818, x = 0.2, y = -0.175, z = 0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0},
    model = 'w_sr_heavysnipermk2'
  },

  [`WEAPON_SNIPERRIFLE`] = {
    name = 'WEAPON_SNIPERRIFLE',
    damage = 2.0, 
    critical = false,
    recoil = 0.5,
    officer = { bone = 24818, x = 0.2, y = -0.175, z = 0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0},
    usual = { bone = 24818, x = 0.2, y = -0.175, z = 0.125, xRot = 90.0, yRot = 180.0, zRot = 0.0},
    model = 'w_sr_sniperrifle'
  },
}
