#!/bin/bash
#
# GNU/Linux - ©WHITE HACKS
# GPL - General Public License
# Open Source - Software Libre
#
# ┌════════┐  ┌════════════┐
# █ ltserv █=>█ 18/04/2021 █
# └════════┘  └════════════┘
#
# ===============================================
#                   VARIABLES
# ===============================================
PWD=$(pwd)
SYSTEM=$(uname -o)
# ===============================================
#               COLORES RESALTADOS
# ===============================================
negro="\e[1;30m"
azul="\e[1;34m"
verde="\e[1;32m"
cian="\e[1;36m"
rojo="\e[1;31m"
purpura="\e[1;35m"
amarillo="\e[1;33m"
blanco="\e[1;37m"
# ===============================================
#                 COLORES BAJOS
# ===============================================
black="\e[0;30m"
blue="\e[0;34m"
green="\e[0;32m"
cyan="\e[0;36m"
red="\e[0;31m"
purple="\e[0;35m"
yellow="\e[0;33m"
white="\e[0;37m"
# ===============================================
#           BANNER DE TEXTO LOCALTUNNEL
# ===============================================
LTServ(){
	sleep 0.5
	clear
echo -e "${verde}
██╗      ██████╗  ██████╗ █████╗ ██╗     
██║     ██╔═══██╗██╔════╝██╔══██╗██║     
██║     ██║   ██║██║     ███████║██║     
██║     ██║   ██║██║     ██╔══██║██║     
███████╗╚██████╔╝╚██████╗██║  ██║███████╗
╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝${negro}
████████╗██╗   ██╗███╗   ██╗███╗   ██╗███████╗██╗
╚══██╔══╝██║   ██║████╗  ██║████╗  ██║██╔════╝██║
   ██║   ██║   ██║██╔██╗ ██║██╔██╗ ██║█████╗  ██║
   ██║   ██║   ██║██║╚██╗██║██║╚██╗██║██╔══╝  ██║
   ██║   ╚██████╔╝██║ ╚████║██║ ╚████║███████╗███████╗
   ╚═╝    ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═══╝╚══════╝╚══════╝"${blanco}
}
# ===============================================
#         INSTALANDO SERVIDOR LOCALTUNNEL
# ===============================================
Installation(){
	if [ "${SYSTEM}" == "Android" ]; then
		lt="/data/data/com.termux/files/usr/bin/lt"
		localtunnel="/data/data/com.termux/files/usr/opt/localtunnel-server"
		openurl="/data/data/com.termux/files/usr/lib/node_modules/localtunnel/node_modules/openurl"
		if [ ! -x ${PREFIX}/bin/git ]; then
			yes|pkg install git
		fi
		if [ ! -x ${PREFIX}/bin/curl ]; then
			yes|pkg install curl
		fi
		if [ ! -x ${PREFIX}/bin/npm ]; then
			yes|pkg install nodejs
		fi
	else
		lt="/bin/lt"
		localtunnel="/opt/localtunnel-server"
		openurl="/lib/node_modules/localtunnel/node_modules/openurl"
		if [ ! -x /bin/git ]; then
			apt-get install git -y
		fi
		if [ ! -x /bin/curl ]; then
			apt-get install curl -y
		fi
		if [ ! -x /bin/nmp ]; then
			apt-get install nodejs -y
		fi
	fi
	if [ ! -x ${lt} ]; then
		git clone https://github.com/defunctzombie/localtunnel-server ${localtunnel}
		cd ${localtunnel}
		npm install
		npm install -g localtunnel
		cd ${openurl}
		curl -LO https://raw.githubusercontent.com/Darkmux/ltserv/main/openurl.js
		LTServ
echo -e "${negro}
┌════════════════════════════════┐
█ ${verde}SERVIDOR LOCALTUNNEL INSTALADO ${negro}█
└════════════════════════════════┘
┃    ┌══════════┐
└═>>>█ ${verde}SINTAXIS ${negro}█
┃    └══════════┘
┃    ┃    ┌═══════════════════════════════════════┐
┃    └═>>>█ ${blanco}lt --port ${verde}<${blanco}port${verde}> ${blanco}--subdomain ${verde}<${blanco}domain${verde}> ${negro}█
┃         └═══════════════════════════════════════┘
┃    ┌══════════┐
└═>>>█ ${verde}EJEMPLO: ${negro}█
     └══════════┘
     ┃    ┌═══════════════════════════════════════┐
     └═>>>█ ${blanco}lt --port 4546 --subdomain whitehacks ${negro}█
          └═══════════════════════════════════════┘
"${blanco}
	else
		LTServ
echo -e "${negro}
┌═══════════════════════════════════┐
█ ${rojo}SERVIDOR LOCALTUNNEL YA INSTALADO ${negro}█
└═══════════════════════════════════┘
"${blanco}
	fi
}
# ===============================================
#              DECLARANDO FUNCIONES
# ===============================================
LTServ
Installation
