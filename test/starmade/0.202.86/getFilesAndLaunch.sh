#!/bin/bash
#This file grabs the instller from the web and runs it once.

#set Working Directory
cd /starmade/

#DownLoad Jave Starmade server package from webssite
wget https://files.star-made.org/StarMade-Starter.jar -P /starmade/

#launch the installer
java -jar /starmade/StarMade-Starter.jar -nogui

#launch the server
cd /starmade/StarMade
java -Xms1024m -Xmx2048m -jar /starmade/StarMade/StarMade.jar -server -nogui