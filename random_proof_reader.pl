% random_proof_reader.pl

% randomly highlight parts to proofread

:-include('../listprologinterpreter/listprolog.pl').
main :- open_string_file_s("../Text-to-Breasonings/file.txt",A),
find_sent(A,A1),

findall([Mark,B],(member(B,A1),((B="\n"->true;B=".")->Mark="";random_member(Mark,[""," *: "]))),List),
flatten(List,List1),
foldr(string_concat,List1,S),
save_file_s("../Text-to-Breasonings/file-rpr-out.txt",S),
!.

find_sent(A,F) :-
split_string(A,"\n\r","\n\r",B),findall([B14,"\n"],(member(B11,B),split_string(B11,".",".",B12),findall([B13,"."],member(B13,B12),B1),flatten(B1,B15),(string_concat(_,".",B11)->B14=B15;append(B14,[_],B15))),B2),flatten(B2,B3),((string_concat(_,"\n",A)->true;string_concat(_,"\r",A))->B21=B3;append(B21,[_],B3)),findall(C,(member(C,B21),string_chars(C,D),not(forall(member(E,D),char_type(E,white)))),F),!.

