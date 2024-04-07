:-include('text_to_breasonings.pl').
main:-catch((texttobr2_1(1),texttobr2(4,u,"square",u)),Err,handle_error(Err)),halt.

handle_error(_Err):-
  halt(1).
main :- halt(1).