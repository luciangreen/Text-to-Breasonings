% big_medit.pl

%:- use_module(library(date)).
:-include('../listprologinterpreter/listprolog.pl').

handle_error(_Err):-
  halt(1).
main :- halt(1).

main2(Script):-
open_string_file_s(Script,File_string),
split_string(File_string,"\n\r","\n\r",List),
findall(X,(member(X,List),not(string_concat("#",_,X)),not(X="")),Y),
%try each command again 3 times if fails
%report on progress
findall(_,(member(Z,Y),bash_command1(Z)),_),
writeln_info(blue,"Blue text: Finished."),!.

bash_command1(Z) :- bash_command2(3,Z).
bash_command2(1,Z) :- writeln_info(blue,"Blue text: Failed: "),writeln_on_lines(Z),abort.
bash_command2(N,Z) :-
 writeln_info(blue,"Blue text: Trying: "),writeln_on_lines(Z),
 catch(bash_command(Z,_),_,(N1 is N-1,bash_command2(N1,Z))),!.
 
writeln_on_lines(C) :-
C2 = ["Blue text:",C],
term_to_atom(C2,C1),atomic_list_concat(A,"\\n",C1),atomic_list_concat(A,"\n",B),writeln_info(blue,B),!.
