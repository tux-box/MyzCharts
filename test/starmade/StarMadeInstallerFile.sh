#!/bin/bash
#This file set's up and installs starmade.

#Seting up prerequesists
#Install Open Java 8
sudo apt install openjdk-8-jre-headless -y

#grab the installer
#Dl Jave Starmade server package from webssite
wget  https://files.star-made.org/StarMade-Starter.jar

#launch the installer
java -jar ./StarMade-Starter.jar -nogui

#run the application/server
#!/bin/bash
#cd StarMade
#java -Xms1024m -Xmx2048m -jar StarMade.jar -server -nogui