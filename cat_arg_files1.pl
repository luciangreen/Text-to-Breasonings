:-include('cat_arg_files.pl').
main:-catch(cat_arg_files(6000),Err,handle_error(Err)),halt.

handle_error(_Err):-
  halt(1).
main :- halt(1).