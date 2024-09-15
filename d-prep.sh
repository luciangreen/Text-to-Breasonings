#!/bin/bash 
#cd ../Daily-Regimen
swipl --stack_limit=40G --goal=d-prep_main --stand_alone=true -o d-prep_main -c d-prep_main.pl
./d-prep_main