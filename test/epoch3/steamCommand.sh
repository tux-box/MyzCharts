#!/bin/bash
steamUSER=anonymous
#steamUSER=
installDIR=/home/arma3
#arma dedicated server = 233780
#arma desktop(purchace required?) for mod = 107410
#epoc mod ID = 421839251

armaServer=233780
armaDesktop=107410
epochMOD=421839251

#command
steamcmd +login ${steamUSER} +force_install_dir ${installDIR} +app_update ${armaServer} +workshop_download_item ${armaDesktop} ${epochMOD} +quit
ln -s ${installDIR}/steamapps/workshop/content/${armaDesktop}/${epochMOD} ${installDIR}/@epoch

steamcmd +login ${steamUSER} +force_install_dir ${installDIR} +app_update ${armaServer} +workshop_download_item ${armaDesktop} 583496184 +quit
ln -s ${installDIR}/steamapps/workshop/content/${armaDesktop}/583496184 ${installDIR}/@cup\ terrains\ -\ core
 
steamcmd +login ${steamUSER} +force_install_dir ${installDIR} +app_update ${armaServer} +workshop_download_item ${armaDesktop} 583544987 +quit 
ln -s ${installDIR}/steamapps/workshop/content/${armaDesktop}/583544987 ${installDIR}/@cup\ terrains\ -\ maps

steamcmd +login ${steamUSER} +force_install_dir ${installDIR} +app_update ${armaServer} +workshop_download_item ${armaDesktop} 1981964169 +quit
ln -s ${installDIR}/steamapps/workshop/content/${armaDesktop}/1981964169 ${installDIR}/@cup\ terrains\ -\ maps\ 2.0

steamcmd +login ${steamUSER} +force_install_dir ${installDIR} +app_update ${armaServer} +workshop_download_item ${armaDesktop} 450814997 +quit
ln -s ${installDIR}/steamapps/workshop/content/${armaDesktop}/450814997 ${installDIR}/@cba_a3
