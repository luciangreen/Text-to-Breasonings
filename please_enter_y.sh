#!/bin/bash 
#cd ../Daily-Regimen
swipl --stack_limit=40G --goal=main --stand_alone=true -o get_y -c get_y.pl
./get_y