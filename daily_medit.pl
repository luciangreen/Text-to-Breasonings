:-include('text_to_breasonings.pl').
:-include('meditatorsanddoctors.pl').
:-include('meditationnoreplace2.pl').
main:-catch(meditation,Err,handle_error(Err)),halt.

handle_error(_Err):-
  halt(1).
main :- halt(1).