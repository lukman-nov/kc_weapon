if Config.CheckForUpdates then
  local function CheckMenuVersion()
    PerformHttpRequest('https://raw.githubusercontent.com/lukman-nov/kc_weapon/main/fxmanifest.lua?token=GHSAT0AAAAAACDAZKBHG6CGFTSVS6OUF46CZEWF5YQ', function(err, result, headers)
      local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')
      if not result then print('[^3kc_weapon^7] ^1Couldn\'t check version.^0') end

      local version = string.sub(result, string.find(result, "%d.%d.%d"))
      local version_N = tonumber((version:gsub("%D+", "")))
      local currentVersion_N = tonumber((currentVersion:gsub("%D+", "")))
      
      if version_N > currentVersion_N then
        print(('| [^3kc_weapon^7] New version is available ^1'..currentVersion.. '^0 -> ^2'..version..'^0 |'))
      end
    end)
  end
  CheckMenuVersion()
end