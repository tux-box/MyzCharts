#!/bin/bash
sudo add-apt-repository multiverse -y
sudo dpkg --add-architecture i386 -y
sudo apt update -y
sudo apt install unzip redis lib32gcc1 steamcmd -y
