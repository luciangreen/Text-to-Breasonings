#!/usr/bin/swipl -f -q

:-include('cat_arg_files.pl').
:- initialization(catch(main, Err, handle_error(Err))).

handle_error(_Err):-
  halt(1).
main :-
	cat_arg_files(6000),
    nl,
    halt.
main :- halt(1).
