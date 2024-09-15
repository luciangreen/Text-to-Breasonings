% bag2phil.pl

% breasoning algorithm generator 2 to philosophy

% uses breasoning algorithm generator 2 to output the maximum number of philosophy paragraphs with 5 sentences.

% later: do this for combos of texts

%:-include('../listprologinterpreter/listprolog.pl').
:-include('br_alg_gen2.pl').
%:-dynamic spec/1.
/*
?- bag2phil(100,2,Br),writeln(Br).
Enter number of input files:
|: 2
Enter file 1 path:
|: ../Lucian-Academy/Books/IMMORTALITY/Immortality 1.txt
Enter file 2 path:
|: ../Lucian-Academy/Books/IMMORTALITY/Immortality 2.txt
*/

bag2phil(Length,Twists,Br32) :-
repeat,
writeln("Enter number of input files:"),
read_string(user_input,"\n\r","\n\r",_,S1),
number_string(N,S1),
numbers(N,1,[],N1),
findall([T2,"\n",T3,"\n",T4,"\n"],(member(N2,N1),write("Enter file "),write(N2),writeln(" path:"),read_string(user_input,"\n\r","\n\r",_,S2),

%open_s(S2,read,T1),read_term(T1,[T2,T3,_,T4]),close(S2)

phrase_from_file_s(string(A),S2),term_to_atom([T2,T3,_,T4],A)%writeln(A1).

),T5),

bag2phil2(Length,T5,Twists,Br32).

bag2phil2(Length,T5,Twists,Br32,Keywords) :-

%trace,
flatten(T5,T6),
%findall([T61,". "],member(T61,T6),T62),
%flatten(T62,T63),
foldr(string_concat,T6,T7),
%open_s("../Text-to-Breasonings/file.txt",write,S3),write(S3,T7),close(S3),
%trace,

repeat(Length,Twists,T7,Br32,Keywords),!.

repeat(_,0,T7,T7,_Keywords) :- !.

repeat(Length,N,T7,Br33,Keywords) :-

br_alg_gen21(T7,Br00),


sort(Br00,Br0),

%

%Length2 is Length*1.1,

random_permutation(Br0,Br000),


length(Br000,LL1),
(LL1>=Length->
(length(Br,Length),
append(Br,_,Br000));
Br=Br0
)
,
%*/


findall(T63,(member(T61,Br),string_concat(T61,". ",T63)),T62),
%flatten(T62,Br11),

length(T62,N3),
N4 is N3 div 5,

N6 is 5*N4,
length(L,N6),
append(L,L2,T62),

open_file_s("connectives.txt",Connectives),
%trace,
divide(1,L,5,[],Br2,Keywords,Connectives),

%delete(Br2,[],Br21),
N8 is N4+1,
append(Br2,[N8,". ",L2],Br3),

flatten(Br3,Br31),foldr(string_concat,Br31,Br32),

NN is N-1, 
 repeat(Length,NN,Br32,Br33,Keywords),
!.


divide(_,[],_,Br2,Br2,_Keywords,_Connectives) :- !.
divide(N7,Br,N4,Br1,Br2,Keywords,Connectives) :-
 ((relevant_sentence(Br,Br21,L1,Keywords),
 get_keywords(L1,KW2,Connectives),
 get_chain(N4,Br21,L2,KW2,[],L,Connectives))->
 %length(L,N4),append(L,L2,Br),
 (append(Br1,[N7,". ",L,"\n"],Br3),
 N8 is N7+1,
 divide(N8,L2,N4,Br3,Br2,Keywords,Connectives));
 Br1=Br2).

relevant_sentence(Br,Br2,A,Keywords) :-
 member(KW,Keywords),
 member(A,Br),sub_string(A,_,_,_,KW),
 delete(Br,A,Br2).

get_keywords(L,KW,Connectives) :-
 %Sep_and_pad="#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!0123456789",
 downcase_atom(L,L1),
 split_string_on_non_alpha(L1,KW1),
 subtract(KW1,Connectives,KW).
 
get_chain(0,Br,Br,_KW2,Ch,Ch,_Connectives) :- !.
get_chain(N4,Br1,Br2,KW2,Ch1,Ch2,Connectives) :-
 ((relevant_sentence(Br1,Br3,L1,KW2),
 append(Ch1,[L1],Ch3),
 get_keywords(L1,Keywords2,Connectives),
 N5 is N4 - 1,
 get_chain(N5,Br3,Br2,Keywords2,Ch3,Ch2,Connectives))->true;
 (Br1=Br2,Ch1=Ch2)).
