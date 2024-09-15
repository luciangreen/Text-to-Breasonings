#!/bin/bash 
#cd ../Daily-Regimen
swipl --stack_limit=40G --goal=main --stand_alone=true -o attention_needed_bell -c attention_needed_bell.pl
./attention_needed_bell