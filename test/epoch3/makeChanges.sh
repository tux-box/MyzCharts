#!/bin/bash
#this script alters the base files to make them linux capatable.
installDIR=/home/arma3
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
