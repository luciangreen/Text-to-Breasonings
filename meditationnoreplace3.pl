#!/usr/bin/swipl -f -q

:- initialization main.

:- include('meditationnoreplace.pl').
:- include('meditatorsanddoctors.pl').

main :-
	meditation,halt.

main :- halt(1).
