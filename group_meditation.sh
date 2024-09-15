#!/bin/bash 
cd ../Text-to-Breasonings
swipl --stack_limit=40G --goal=main --stand_alone=true -o group_meditation -c group_meditation.pl 
./group_meditation 