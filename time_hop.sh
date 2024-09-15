#!/bin/bash 
cd ../Text-to-Breasonings
swipl --goal=main --stand_alone=true -o time_hop -c time_hop.pl
./time_hop
