:-include('../listprologinterpreter/listprolog.pl').
main:-catch((shell1_s("swipl --goal=main --stand_alone=true -o cat_alg_files -c cat_alg_files.pl"),
shell1_s("./cat_alg_files")),Err,handle_error(Err)),halt.

handle_error(_Err):-
  halt(1).
main :- halt(1).