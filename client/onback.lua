local Core = nil
local curWeapon = nil
local PlayerLoaded = false
local ped = cache.ped
local Weapons = Config.Weapons
local weaponCache, PlayerData = {}, {}

Citizen.CreateThread(function()
  if Config.Core == 'ESX' then
    while Core == nil do
      Core = exports[Config.CoreFolder]:getSharedObject()
      Citizen.Wait(10)
    end

    while Core.GetPlayerData().job == nil do
      Citizen.Wait(10)
    end

    PlayerData = Core.GetPlayerData()
    PlayerData.job = Core.GetPlayerData().job  
  elseif Config.Core == 'QB' then
    while Core == nil do
      Core = exports[Config.CoreFolder]:GetCoreObject()
      Citizen.Wait(10)
    end
    
    while Core.Functions.GetPlayerData().job == nil do
      Citizen.Wait(10)
    end

    PlayerData = Core.Functions.GetPlayerData()
    PlayerData.job = Core.Functions.GetPlayerData().job
  end
end)

RegisterNetEvent(Config.PlayerLoaded, function()
  PlayerLoaded = true
end)

RegisterNetEvent(Config.PlayerUnload, function()
  PlayerLoaded = false
  PlayerData = {}
end)

if Config.Core == 'ESX' then
  RegisterNetEvent('esx:setJob')
  AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
  end)
end

local function removeWeapon(hash)
  for k, v in pairs(weaponCache) do
    if k == hash then
      if DoesEntityExist(v.entity) then
        DetachEntity(v.entity)
        DeleteEntity(v.entity)
        weaponCache[k] = nil
      end
    end
  end
end

local function checkEntityExist()
  for k, v in pairs(weaponCache) do
    if not DoesEntityExist(v.entity) then
      weaponCache[k] = nil
    end
  end
end

local function putOnBack(hash, bool)
  
  while PlayerData.job == nil do
    Wait(10)
  end

  local job = PlayerData.job.name
  for k, v in pairs(Weapons) do
    
    local position = v.usual
    if Config.Officer[job] then
      position = v.officer
    end

    curWeapon = nil
    checkEntityExist()

    if hash == k then
      local object = Weapons[hash].model
      
      if object == nil then return end

      if weaponCache[hash] == nil then
        lib.requestModel(object, 500)
        local coords = GetEntityCoords(ped)
        local boneIndex = GetPedBoneIndex(ped, position.bone)
        local prop = CreateObject(object, position.x, position.y, position.z,  true,  true, true)
        AttachEntityToEntity(prop, ped, boneIndex, position.x, position.y, position.z, position.xRot, position.yRot, position.zRot, true, true, false, true, 2, true)
        weaponCache[hash] = {
          name = v.name,
          entity = prop,
          wep = object,
          hash = hash
        }
      end
    end
  end
end

AddEventHandler('ox_inventory:currentWeapon', function(data)
  if data then
    if Weapons[data.hash] then
      curWeapon = data.hash
      removeWeapon(data.hash)
    end
  else
    if curWeapon then
      putOnBack(curWeapon)
    end
  end
end)

AddEventHandler('ox_inventory:updateInventory', function(changes)
  PlayerLoaded = true
  for k, v in pairs(changes) do
    if type(v) == 'table' then
      local hash = joaat(v.name)
      if curWeapon ~= hash then
        putOnBack(hash)
      else
        removeWeapon(hash)
      end
    end
    if type(v) == 'boolean' then
      for k, v in pairs(weaponCache) do
        local count = exports.ox_inventory:Search(2, Weapons[k].name)
        if not count or count <= 0 then
          removeWeapon(v.hash)
        end
      end
    end
  end
end)

AddEventHandler('playerSpawned', function()
  while not PlayerLoaded do
    Wait(50)
  end

  local PlayerItems = exports.ox_inventory:GetPlayerItems()
  for _, item in pairs(PlayerItems) do
    local hash = joaat(item.name)
    if Weapons[hash] then
      putOnBack(hash)
    end
  end
end)

lib.onCache('vehicle', function(value)
  if not value then
    if GetResourceState('ox_inventory') ~= 'started' or not PlayerLoaded then return end
    for k, v in pairs(Weapons) do
      local count = exports.ox_inventory:Search(2, v.name)
      if count and count >= 1 then
        putOnBack(k)
      end
    end
  end
end)

lib.onCache('ped', function(value)
  ped = value
end)

RegisterCommand(Config.Command, function()
  local PlayerItems = exports.ox_inventory:GetPlayerItems()
  for _, item in pairs(PlayerItems) do
    local hash = joaat(item.name)
    removeWeapon(hash)
  end
end)