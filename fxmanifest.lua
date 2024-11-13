fx_version 'cerulean'
game 'gta5'

author 'Modified for QB'
description 'Supply Chain System for QB'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'configs/*.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

dependencies {
    'qb-core',
    'oxmysql',
    'ox-lib'
}


