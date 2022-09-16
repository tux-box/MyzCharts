#!/bin/bash

#get server files
mkdir ~/tmp
wget -O ~/tmp/release.zip https://github.com/EpochModTeam/Epoch/archive/refs/heads/release.zip
unzip ~/tmp/release.zip -d ~/tmp/
rm -r ~/tmp/epoch-release/server_install_pack/db
cp -r -f ~/tmp/epoch-release/server_install_pack/* ~
rm -r ~/tmp/Epoch-release/Server_Install_Pack/DB
cp -r -f ~/tmp/Epoch-release/Server_Install_Pack/* ~

#first get the base files
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

#Alter some base files to make them linux capatable.

#command
# sed -i 's/oldstring/newstring/g' filename
cp -R ${installDIR}/epoch3/changes/. ${installDIR}/
mkdir ${installDIR}/logs
mkdir ${installDIR}/logs/old
mkdir -p ~/.local/share/Arma\ 3\ -\ Other\ Profiles/sc
ln -s ${installDIR}/sc/sc.arma3profile ~/.local/share/Arma\ 3\ -\ Other\ Profiles/sc/sc.Arma3Profile
chmod +x ${installDIR}/epoch_linux_startscript.sh
#copy keys
cp -r ${installDIR}/@epoch/keys/. ${installDIR}/keys
cp ${installDIR}/@epochhive/addons/Epoch_server_RyanZ_Spawner.pbo ${installDIR}/@epochhive/addons/epoch_server_ryanz_spawner.pbo



echo done