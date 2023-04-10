--------------------------------------------------
------------- JOIN OUR DISCORD SERVER ------------
--------- https://discord.gg/7gbCD9Fzct ----------
--------------------------------------------------
--------------- DEVELOPED BY FLAP ----------------
-------------------- WITH 💜 ---------------------
--------------------------------------------------

fx_version 'adamant'
game 'gta5'
author 'Flap'
description 'character creation by Flap'
version '1.0'
lua54 'yes'

ui_page 'client/html/index.html'

shared_scripts {
	'@es_extended/imports.lua',
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	"@mysql-async/lib/MySQL.lua",
	'config/*.lua',
	'server/*.lua'
}

files {
	'client/html/index.html',
	'client/html/app.js',
	'client/html/style.css',
	'client/html/icons/*.svg',
	'client/html/icons/*.png',
	'client/html/icons/*.webp',
	'client/html/models/*.webp'
}

dependency 'es_extended'
