#!/bin/bash

sfdx force:org:create -f config/project-scratch-def.json -a FlowsADK --setdefaultusername -d 1

#add pckg IDs to Idnum
sfdx force:package:install --package 04t1U0000066Af4 -w 20

sfdx force:package:install --package 04t1U000005ZS27 -w 20  

sfdx force:source:push -f

#sfdx assign permission sets
sfdx force:user:permset:assign -n Credit_Line_Increase_Demo
#assign flows perm set..

# Include the comprehensive plan to load all data items
sfdx force:data:tree:import --plan data/Plan1.json

sfdx force:apex:execute -f config/create-demo-data-setup.apex

#data tree import...


sfdx force:org:open

