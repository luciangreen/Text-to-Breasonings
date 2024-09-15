% big_medit.pl

%:- use_module(library(date)).
:-include('run_sh.pl').

d-prep_main :-

catch(main2("d-prep2.sh"),Err,handle_error(Err)),halt.
