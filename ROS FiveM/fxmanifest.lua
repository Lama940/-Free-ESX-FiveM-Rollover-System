shared_script '@es_extended/imports.lua'

fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author "Lama940"
description "FiveM-Rollover-System"
version "V1"

client_scripts{ 
  "source/c/*.lua",
  "config.lua"
}

server_scripts{ 
  "source/s/*.lua",
  "config.lua"
}

escrow_ignore {
	'config.lua'
}

server_scripts { '@mysql-async/lib/MySQL.lua' }