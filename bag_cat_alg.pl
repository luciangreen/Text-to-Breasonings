#!/usr/bin/swipl -f -q

:-include('cat_alg_files.pl').
:- initialization(catch(main, Err, handle_error(Err))).

handle_error(_Err):-
  halt(1).
main :-
	cat_alg_files(6000),
    nl,
    halt.
main :- halt(1).
