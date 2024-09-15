#!/bin/bash 
#cd ../Daily-Regimen
swipl --stack_limit=40G --goal=main --stand_alone=true -o big_medit -c big_medit.pl
./big_medit