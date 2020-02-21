#!SWI-Prolog -f -q

:- include('meditation.pl').

:- initialization prolog_edit:main.

main :-
  time((texttobr2(u,u,u,u),texttobr(u,u,u,u))),time((prolog_edit:mergetexttobrdict)),
  halt(0)	.
main :-
  halt(1).
  