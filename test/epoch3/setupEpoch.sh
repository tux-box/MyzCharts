#!/bin/bash

#get server files
source ./getServerFiles.sh

#first get the base files
source ./steamCommand.sh

#make changes to server files
source ./makeChanges.sh

echo done