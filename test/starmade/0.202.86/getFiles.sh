#!/bin/bash
#This file grabs the instller from the web and runs it once.

#Dl Jave Starmade server package from webssite
wget  https://files.star-made.org/StarMade-Starter.jar -P /starmade/

#launch the installer
java -jar /starmade/StarMade-Starter.jar -nogui
