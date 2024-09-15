:-include('../listprologinterpreter/listprolog.pl').
:-include('../listprologinterpreter/la_files.pl').
:-include('../Philosophy/philosophy/word_count.pl').
:-include('la_vps.pl').
%:-include('cat_files2.pl').
:- use_module(library(date)).
:-dynamic tally/1.
cat_alg_files(Tr1) :-
Tr is floor(1.32*Tr1),
retractall(tally(_)),
assertz(tally(0)),
 %/*
date_time_stamp(date(2023,1,1,0,0,0,_,_,_),TS0),
date_time_stamp(date(2023,1,8,0,0,0,_,_,_),TS01),
TSD is TS01-TS0,

get_time(TS1),
Week_ago is TS1-TSD,

 directory_files('../../GitHub/',F),
	delete_invisibles_etc(F,G1),
	delete(G1,"LuciansHandBitMap-Font",G3),
	delete(G3,"private2",G),

findall([F5_old,F5_new],
(member(F2,G),

tally(Ta),
(Ta>Tr->fail;true),

foldr(atom_concat,['../../GitHub/',F2,'/'],F1),

 directory_files(F1,F21),
	delete_invisibles_etc(F21,G2),

member(F3,G2),
foldr(atom_concat,['../../GitHub/',F2,'/',F3],F4),

size_file(F4,Size),Size=<51200,

((not(exists_directory(F4)),exists_file(F4))->(

(string_concat(_,".pl",F4)->true;(string_concat(_,".txt",F4)->true;
string_concat(_,".md",F4))),

time_file(F4,T),

open_string_file_s(F4,F5),

word_count(["string",F5],Words),

Ta1 is Ta+Words,
retractall(tally(_)),
assertz(tally(Ta1)),


% if T is less than a week old
(T > Week_ago ->
(%trace,
F5_new=F5,
F5_old="");
(F5_new="",
F5_old=F5))
);fail)),F6),
delete(F6,["",""],F61),
%trace,

findall([F62_new,"\n"],member([_,F62_new],F61),F63_new),
findall([F62_old,"\n"],member([F62_old,_],F61),F63_old),
append(F63_new,F63_old,F64),
flatten(F64,F7),
foldr(string_concat,F7,F80),

split_string(F80,"\n\r","\n\r",F81),
delete(F81,"",F82),
findall([F83,"\n"],member(F83,F82),F84),
flatten(F84,F85),
foldr(string_concat,F85,F8),

%truncate_words_conserving_formatting(["string",F8],Tr,F81),

F9=["","","",F8],
term_to_atom(F9,F10),

open_s("../Lucian-Academy/Books1/algs/lgalgs_a.txt",write,S),
write(S,F10),close(S),
%*/
%cat_files('../../GitHub/',"Lucian-Academy","../Lucian-Academy/Books1/algs/lgalgs_a.txt"),

/* *** algs is in the same log file as args, so doesn't need to start a new one

(exists_file('aa_log.txt')->(
 stamp_date_time(TS1,date(Year,Month,Day,Hour1,Minute1,_Seconda,_A,_TZ,_False),local),
 foldr(string_concat,["aa_log-",Year,"-",Month,"-",Day,"-",Hour1,"-",Minute1,".txt"],Name),
 
 mv("aa_log.txt",Name));true),
*/

!.

