#!/bin/bash
mkdir ~/tmp
wget -O ~/tmp/release.zip https://github.com/EpochModTeam/Epoch/archive/refs/heads/release.zip
unzip ~/tmp/release.zip -d ~/tmp/
rm -r ~/tmp/epoch-release/server_install_pack/db
cp -r -f ~/tmp/epoch-release/server_install_pack/* ~
rm -r ~/tmp/Epoch-release/Server_Install_Pack/DB
cp -r -f ~/tmp/Epoch-release/Server_Install_Pack/* ~