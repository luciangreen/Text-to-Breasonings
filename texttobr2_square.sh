#!/bin/bash 
cd ../Text-to-Breasonings
swipl --goal=main --stand_alone=true -o texttobr2_square -c texttobr2_square.pl 
./texttobr2_square
