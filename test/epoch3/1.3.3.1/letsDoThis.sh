#!/bin/bash

#setup enviroment for server.
installDIR=/home/arma3

mkdir ${installDIR}
mkdir ${installDIR}/tmp
#get server files
wget -O ${installDIR}/tmp/release.zip https://github.com/EpochModTeam/Epoch/archive/refs/heads/release.zip
#extract the server files
unzip -o ${installDIR}/tmp/release.zip -d ${installDIR}/tmp/
#correct case syncitiveity, because linux is case syncitive and the epoch dvelopment appears not to be.. you get the point!
./makeFilesLowerCase.sh ${installDIR}/tmp/
#remove the database stuff, its not needed. well use an external db.  
rm -r ${installDIR}/tmp/epoch-release/server_install_pack/db
#copy the files.
cp -r -f ${installDIR}/tmp/epoch-release/server_install_pack/* ${installDIR}

#Steam stuff, need to get some stuff from steam.
#make sure steam is installed.
sudo add-apt-repository multiverse -y
sudo apt install software-properties-common -y
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install lib32gcc-s1 steamcmd tmux screen -y

#get client side mods, this is WIP:
steamUSER=anonymous
#steamUSER=

#arma dedicated server = 233780
#arma desktop(purchace required?) for mod = 107410
#epoc mod ID = 421839251

armaServer=233780
armaDesktop=107410
epochMOD=421839251

#Install the arma3 dedicated server.
/usr/games/steamcmd +force_install_dir ${installDIR} +login ${steamUSER} +app_update ${armaServer} +quit

#Install the epochmod client files https://steamcommunity.com/sharedfiles/filedetails/?id=421839251
/usr/games/steamcmd +force_install_dir ${installDIR} +login ${steamUSER} +app_update ${armaServer} +workshop_download_item ${armaDesktop} ${epochMOD} +quit
ln -s ${installDIR}/steamapps/workshop/content/${armaDesktop}/${epochMOD} ${installDIR}/@epoch

#other mods, cups terrains core https://steamcommunity.com/sharedfiles/filedetails/?id=583496184
/usr/games/steamcmd +force_install_dir ${installDIR} +login ${steamUSER} +app_update ${armaServer} +workshop_download_item ${armaDesktop} 583496184 +quit
ln -s ${installDIR}/steamapps/workshop/content/${armaDesktop}/583496184 ${installDIR}/@cup\ terrains\ -\ core

#other mods, cups maps https://steamcommunity.com/sharedfiles/filedetails/?id=583544987
/usr/games/steamcmd +force_install_dir ${installDIR} +login ${steamUSER} +app_update ${armaServer} +workshop_download_item ${armaDesktop} 583544987 +quit 
ln -s ${installDIR}/steamapps/workshop/content/${armaDesktop}/583544987 ${installDIR}/@cup\ terrains\ -\ maps

#other mods, cups maps 2.0 https://steamcommunity.com/sharedfiles/filedetails/?id=1981964169
/usr/games/steamcmd +force_install_dir ${installDIR} +login ${steamUSER} +app_update ${armaServer} +workshop_download_item ${armaDesktop} 1981964169 +quit
ln -s ${installDIR}/steamapps/workshop/content/${armaDesktop}/1981964169 ${installDIR}/@cup\ terrains\ -\ maps\ 2.0

#other mods, cups cba_a3 https://steamcommunity.com/sharedfiles/filedetails/?id=450814997
/usr/games/steamcmd +force_install_dir ${installDIR} +login ${steamUSER} +app_update ${armaServer} +workshop_download_item ${armaDesktop} 450814997 +quit
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
