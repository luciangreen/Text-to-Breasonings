:- use_module(library(date)).
:-include('run_sh.pl').

run_imm_script1_main :-

catch(main2("imm_script.sh"),Err,handle_error(Err)),halt.
