fx_version 'cerulean'
game 'gta5'
version '1.0.0'
author 'luuxqo'
description 'Hud'

client_scripts {
	'client.lua',
}
ui_page {
	'html/index.html'
}
files {
	'html/index.html',
	'html/css/style.css',
	'html/js/fivem.js',
	'html/js/tx.mp3',
	'html/img/*.png'
}

dependency 'es_extended'
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
}

