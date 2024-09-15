:-include('../listprologinterpreter/listprolog.pl').
main:-catch(going_to_5689,Err,handle_error(Err)),halt.
main :- halt(1).
handle_error(_Err):-
  halt(1).
going_to_5689 :-
open_file_s("tt_log.txt",File_term),
(append(_,[[n=_N1,_Pres_D,_Pres_M,_Pres_Y,Fut_D,Fut_M,Fut_Y]],File_term)->true;fail),
foldr(string_concat,["Going to ",Fut_D," ",Fut_M," ",Fut_Y,", press \"y\":"],S),
print_message(information,S),
!.