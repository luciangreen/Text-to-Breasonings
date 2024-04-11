:-include('../listprologinterpreter/listprolog.pl').
main :- open_string_file_s("../Text-to-Breasonings/file0.txt",A),
open_string_file_s("../Text-to-Breasonings/file01.txt",A0),
find_sent(A,A1),find_sent(A0,A01),

subtract(A1,A01,B1),length(B1,B1L),
subtract(A01,A1,B2),length(B2,B2L),
%findall([X,"\n"],member(X,B1),B1X),
%findall([X,"\n"],member(X,B2),B2X),
flatten([B1L,"sentences deleted from file0.txt",
B2L,"sentences added to file01.txt",
"*****","Deleted from file0.txt:",B1,
"*****","Added to file01.txt:",B2],List),
findall(_,(member(L,List),term_to_atom(L,L1),writeln(L1)),_),
%writeln(Atom),
!.

find_sent(A,F) :-
split_string(A,".\n\r",".\n\r",B),delete(B,"",A1),findall(C,(member(C,A1),string_chars(C,D),not(forall(member(E,D),char_type(E,white)))),F),!.
