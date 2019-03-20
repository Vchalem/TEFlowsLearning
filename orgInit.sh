#!/bin/bash

sfdx force:org:create -f config/project-scratch-def.json -a FlowsADK --setdefaultusername -d 1

#add pckg IDs to Idnum
sfdx force:package:install --package 04t1U0000066Af4 -w 20

sfdx force:package:install --package 04t1U000005ZS27 -w 20  


#sfdx force:mdapi:deploy --deploydir mdapi-source/app-config

#sfdx force:mdapi:deploy --deploydir mdapi-source/data-config

#sfdx force:mdapi:deploy --deploydir mdapi-source/org-config

sfdx force:source:push 

#sfdx assign permission sets
sfdx force:user:permset:assign -n Credit_Line_Increase_Demo
#assign flows perm set..

sfdx force:apex:execute -f config/create-demo-data-setup.apex

#data tree import...


sfdx force:org:open

