:-include('prompt_meditation1.pl').
main:-catch(prompt_meditation,Err,handle_error(Err)),halt.

handle_error(_Err):-
  halt(1).
main :- halt(1).