#!/bin/bash 
cd ../Text-to-Breasonings
swipl --goal=main --stand_alone=true -o daily_medit -c daily_medit.pl 
./daily_medit
