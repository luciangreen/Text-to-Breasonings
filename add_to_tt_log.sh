#!/bin/bash 
#cd ../Daily-Regimen
swipl --stack_limit=40G --goal=main --stand_alone=true -o add_to_tt_log -c add_to_tt_log.pl
./add_to_tt_log