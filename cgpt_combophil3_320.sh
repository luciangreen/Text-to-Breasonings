#!/bin/bash 
#cd ../Text-to-Breasonings
swipl --stack-limit=54G --goal=main --stand_alone=true -o cgpt_combophil3_sh -c cgpt_combophil3_sh.pl
./cgpt_combophil3_sh 320
