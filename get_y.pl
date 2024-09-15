:-include('../listprologinterpreter/listprolog.pl').
main:-catch(get_y,Err,handle_error(Err)),halt.
main :- halt(1).
handle_error(_Err):-
  halt(1).
get_y :-
repeat,writeln("Please enter \"y\":"),
read_string(user_input,"\n\r","\n\r",_,S),
S="y",!.