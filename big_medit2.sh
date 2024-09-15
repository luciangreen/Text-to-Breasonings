#!/bin/bash 
#cd ../Daily-Regimen
swipl --stack_limit=40G --goal=main --stand_alone=true -o big_medit2 -c big_medit2.pl
./big_medit2