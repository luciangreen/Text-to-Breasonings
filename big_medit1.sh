#!/bin/bash 
#cd ../Daily-Regimen
swipl --stack_limit=40G --goal=run_big_medit1_main --stand_alone=true -o run_big_medit1_main -c run_big_medit1_main.pl
./run_big_medit1_main