#!/usr/bin/swipl -f -q

:-include('../listprologinterpreter/listprolog.pl').
:- use_module(library(date)).
:-include('flush_caches.pl').
%:-include('bell.pl').

%:-include('../listprologinterpreter/la_files.pl').

%:- initialization(catch(main, Err, handle_error(Err))).

main :-
S is 60*60,
catch(catch(call_with_time_limit(S,main2),time_limit_exceeded,(writeln("Timed out."),handle_error(_Err))),Err,handle_error(_Err)),halt.
handle_error(_Err):-
  halt(1).
main :- halt(1).
main2 :-

/*
date_time_stamp(date(2023,1,1,1,0,0,_,_,_),TS0),
date_time_stamp(date(2023,1,2,1,0,0,_,_,_),TS01),
TSD is TS01-TS0,

get_time(TS1),
In_a_day is TS1+TSD,


Hours=[9,12,15],

get_time(TS),stamp_date_time(TS,date(Year,Month,Day,Hour1,Minute1,Seconda,_A,_TZ,_False),local),

findall(TSA0,(member(H,Hours),date_time_stamp(date(Year,Month,Day,H,0,0,_,_,_),TSA0)),TSAA),

*/
open_file_s("../Lucian-Academy/Books1/algs/lgalgs_a.txt",[_,_,_,FS1]),
not(FS1=""),
open_file_s("../Lucian-Academy/Books1/args/lgtext_a.txt",[_,_,_,FS2]),
not(FS2=""),

(exists_file('aa_log.txt')->(

get_time(TS1),
 stamp_date_time(TS1,date(Year,Month,Day,Hour1,Minute1,_Seconda,_A,_TZ,_False),local),
 foldr(string_concat,["aa_log-",Year,"-",Month,"-",Day,"-",Hour1,"-",Minute1,".txt"],Name),
 
 mv("aa_log.txt",Name),
 
 open_s("aa_log.txt",write,SB),
 write(SB,'[]'),close(SB)

 );true),

texttobr2(25,u,"square",u),
BL is %1000,%
4*16000,
%5*16000*8*5,
day_loop(BL,0,0%,In_a_day,TSAA
),
flush_caches,
A is (25-1)*(1 % teleport 1
   + 1 % anti-ageing medicine 1
   + 1 % teleport 2
   + 1 % anti-ageing medicine 2
   + 2 % meditation
   + 2),% a thought

texttobr2_1(A),
%bell("Freezing Ages Complete"),

 	nl,
    halt.
main :- halt(1).


day_loop(Br_lim,Br_ar,Br_al%NB,In_a_day,TSA
) :-

%get_time(TS1),
(Br_ar>Br_lim->Br_ar2=Br_ar;
(
foldr(string_concat,["swipl -f -q ./bag_args21.pl"],S3)%,
,catch(bash_command(S3,Br_ar10), _, (foldr(string_concat,["Warning."%%"Error: Can't clone ",User3,"/",Repository3," repository on GitHub."
	],_Text4),%writeln1(Text4),
	false%fail%abort
 	)),

split_string(Br_ar10,"\n\r","\n\r",Br_ar11),
append(_,[Br_ar12],Br_ar11),
number_string(Br_ar1,Br_ar12),

Br_ar2 is Br_ar+Br_ar1)),

(Br_al>Br_lim->Br_al2=Br_al;

%/*
(
foldr(string_concat,["swipl -f -q ./bag_algs1.pl"],S31)%,
,catch(bash_command(S31,Br_al10), _, (foldr(string_concat,["Warning."%%"Error: Can't clone ",User3,"/",Repository3," repository on GitHub."
	],_Text41),%writeln1(Text4),
	false%fail%abort
 	)),
%*/
split_string(Br_al10,"\n\r","\n\r",Br_al11),
append(_,[Br_al12],Br_al11),
number_string(Br_al1,Br_al12),


%get_time(TS1),
Br_al2 is Br_al+Br_al1)),

/*
findall(TS2,(member(TS2,TSA),TS1>TS2,

%foldr(atom_concat,['echo "" | mutt -s "Alarm ',NB1,' Breasonings" luciangreen@lucianacademy.com',''],A1),

%shell1(A1)

 foldr(string_concat,["afplay /System/Library/Sounds/Funk.aiff\nsay \" Alarm "%done"%"echo "
 ,%""%
 NB1,
 "\" Breasonings"],S1),
 shell1_s(S1)
 
),TS3),
subtract(TSA,TS3),

*/
%atom_concat('echo "" | mutt -s "BAG Day Test" luciangreen@lucianacademy.com','',A1),

%shell1(A1)

((Br_ar>Br_lim,Br_al>Br_lim)->true;
 	day_loop(Br_lim,Br_ar2,Br_al2%NB1,In_a_day,TS3
 	))
 	
 	,!.

 