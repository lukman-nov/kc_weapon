fx_version      'adamant'
game            'gta5'

name            'kc_weapon'
author          'Lukman_Nov#5797'
version         '2.3.1'
description     'Weapon Core'
lua54           'yes'

shared_script   '@ox_lib/init.lua'

server_scripts {
    'config.lua',
    'versioncheck.lua'
}

client_scripts {
    'config.lua',
    'client/main.lua',
    'client/dmg.lua',
    'client/recoil.lua',
    'client/onback.lua',
}

escrow_ignore {
    'config.lua',
    'client/main.lua'
}

dependencies {
    'ox_lib'
}