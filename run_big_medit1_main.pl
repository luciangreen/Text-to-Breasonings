% big_medit.pl

%:- use_module(library(date)).
:-include('run_sh.pl').

run_big_medit1_main :-

catch(main2("big_medit.sh"),Err,handle_error(Err)),halt.
