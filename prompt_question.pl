:-include('prompt_question1.pl').
main:-catch(prompt_question,Err,handle_error(Err)),halt.

handle_error(_Err):-
  halt(1).
main :- halt(1).
