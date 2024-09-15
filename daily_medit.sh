#!/bin/bash 
cd ../Text-to-Breasonings
swipl --stack-limit=40G --goal=main --stand_alone=true -o daily_medit -c daily_medit.pl 
./daily_medit