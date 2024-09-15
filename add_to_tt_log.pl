:- use_module(library(date)).
:-include('../listprologinterpreter/listprolog.pl').

main :-

catch((open_file_s("tt_log.txt",File_term),
(append(_,[[n=N1,Pres_D,Pres_M,Pres_Y,Fut_D,Fut_M,Fut_Y]],File_term)->true;(N1=0,Fut_D=1,Fut_M=10,Fut_Y=5689)),
N2 is N1+1,

get_time(TS),stamp_date_time(TS,date(Year,Month,Day,_,_,_,_,_,_),local),

([Pres_D,Pres_M,Pres_Y]=[Day,Month,Year]->D=0;D=1),
Fut_D0 is ((Fut_D+D) mod 17),
(Fut_D0=0->Fut_D1=1;Fut_D0=Fut_D1),

append(File_term,[[n=N2,Day,Month,Year,Fut_D1,Fut_M,Fut_Y]],File_term1),   term_to_atom(File_term1,String1),
	save_file_s("tt_log.txt",String1)),Err,handle_error(Err)),halt.

handle_error(_Err):-
  halt(1).
main :- halt(1).