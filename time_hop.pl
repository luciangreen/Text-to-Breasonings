:-include('text_to_breasonings.pl').
main:-catch((N is 1,texttobr2_1(N)),Err,handle_error(Err)),halt.

handle_error(_Err):-
  halt(1).
main :- halt(1).