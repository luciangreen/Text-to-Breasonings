% br_alg_gen.pl

% #1-6

% Hello, I am Lucian Green.  I enjoy programming, writing Philosophy and going for walks.  I also compose songs and do acting.  Programming is on the topic compilers, inductive algorithm finders and philosophy.  I love animals, and secretly wrote songs with about my (human-like) pets.  I also enjoy programming about each of my books, on topics such as meditation.

% Raw=[["green","compose"],["programming","do"],["songs","is"],["songs","writing"]]

% makes graph of essay x

% 10. I added that I could write breasonings by substituting "The algorithm finds the output for an input using similar yet different enough phrases" for the algorithm. For example, the writer can find the complete set of non-synonymous words that take turns with a word. The linguistic algorithm writer attempted to cover the humanities framework with ideas by tying critical terms from the real world to the algorithms in one version. Also, she could impressionably convert algorithms to functionalism and back.  In a way, it was treating old as new. There were existing ideas and recent research in contemporary times.

% makes sure that idea does not precur

% a b, a c and d c->d b (with each pair of non-connective words), does chains of 3 x 2 pairs

% pol existence ("pol") as a seen as version (added on)

% br_gen(A,B),writeln1(A),writeln1(B).

:-include('../Text-to-Breasonings/text_to_breasonings.pl').
:-include('../listprologinterpreter/la_files.pl').

br_gen(Raw,Chains) :-
 %phrase_from_file_s(string(File), "../Text-to-Breasonings/file.txt"),
 phrase_from_file_s(string(File), "../Text-to-Breasonings/file.txt"),
 string_codes(File_string0,File),
 
br_gen2(File_string0,Raw,Chains).


br_gen2(File_string0,Raw,Chains) :-

 downcase_atom(File_string0,File_string1),
 SepandPad="#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\!'\"0123456789",
 split_string(File_string1,SepandPad,SepandPad,File_string2),
 
 % truncate file to N words
 Truncate_length=100,
 length(File_string2,L3), length(File_string2b,Truncate_length), (L3=<Truncate_length->File_string2=File_string2a; (append(File_string2b,_,File_string2),File_string2b=File_string2a)),
 
 % delete connectives such as and, the
open_file_s("connectives.txt",Connectives),

subtract(File_string2a,Connectives,Words1),

% finds adjacent combos of words
length(Words1,L1),
L2 is L1-1,
numbers(L2,1,[],N),
findall([A,B],(member(N1,N),N2 is N1+1,
get_item_n(Words1,N1,A),
get_item_n(Words1,N2,B)),Words2),

% finds suggestions for new combos of words, eg a b, a c and d c->d b
sort(Words2,Words3),
%trace,
findall([F1,K1],(member([A,B],Words3),
findall(E1,(member([A,C],Words3),
findall([D,B],member([D,C],Words3),E),
%foldr(append,E,[],E1)
E=E1),F),
foldr(append,F,[],F1),
findall(J1,(member([G,B],Words3),
findall([A,H],member([G,H],Words3),J),
%foldr(append,J,[],J1)
J=J1),K),
foldr(append,K,[],K1)),L),
%trace,

% makes this a list of A,B
foldr(append,L,[],LL1),
foldr(append,LL1,[],Words4),
%LL1=L,
%maplist(append,[LL2],[Words4]),

% remove duplicates
sort(Words4,Words4b),
%trace,

% removes pairs with two of the same word
findall([A,B],(member([A,B],Words4b),not(A=B)),Words4a),

% removes word pairs already at start
subtract(Words4a,Words3,Raw),

% find chains
findall([A,B,C],(member([A,B],Raw),member([B,C],Raw),
not(A=C)),Chains).
 
% 9. I wrote the representative moving (acting) algorithm. I asked, "What about programs?"  They are in PhDs.  Everything, including materialisation, had to be automated like magic. For example, the algorithm for "in" was assigning a value to a variable and computational verbs were "plainised" (sic). For instance, "Combination Algorithm Writer finds the algorithm that matches the specification with the interpreter" is "the box finds the reason (square) that equals the value with the sum" and simplifies it to the key phrase "1+1=2".

% uses original text to form sentences about br
% uses br dict to write alg

% a b, a c and d c->d b
% alg: bacd in one of forms 1(2..n), repeats, with prolog head
% if an item is non word "right" or "plus" then it is an arg, otherwise a predicate name, although non-* can be a predicate name if no other option

br_alg_gen(Raw,Chains,Algorithms) :-
 %phrase_from_file_s(string(File), "../Text-to-Breasonings/file.txt"),
 phrase_from_file_s(string(File), "../Text-to-Breasonings/file.txt"),
 string_codes(File_string0,File),
 downcase_atom(File_string0,File_string1),
 SepandPad="#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\!'\"0123456789",
 split_string(File_string1,SepandPad,SepandPad,File_string2),
 
 % truncate file to N words
 Truncate_length=100,
 length(File_string2,L3), length(File_string2b,Truncate_length), (L3=<Truncate_length->File_string2=File_string2a; (append(File_string2b,_,File_string2),File_string2b=File_string2a)),
 
 % delete connectives such as and, the
open_file_s("connectives.txt",Connectives),

subtract(File_string2a,Connectives,Words1),

% finds adjacent combos of words
length(Words1,L1),
L2 is L1-1,
numbers(L2,1,[],N),
findall([A,B],(member(N1,N),N2 is N1+1,
get_item_n(Words1,N1,A),
get_item_n(Words1,N2,B)),Words2),

% finds suggestions for new combos of words, eg a b, a c and d c->d b
sort(Words2,Words3),
%trace,
findall([F1,K1],(member([A,B],Words3),
findall(E1,(member([A,C],Words3),
findall([[D,B],[B,A,C,D]],member([D,C],Words3),E),
%foldr(append,E,[],E1)
E=E1),F),
foldr(append,F,[],F1),
findall(J1,(member([G,B],Words3),
findall([[A,H],[A,B,G,H]],member([G,H],Words3),J),
%foldr(append,J,[],J1)
J=J1),K),
foldr(append,K,[],K1)),L),
%trace,

% makes this a list of A,B
foldr(append,L,[],LL1),
foldr(append,LL1,[],Words4),
%LL1=L,
%maplist(append,[LL2],[Words4]),

% remove duplicates
sort(Words4,Words4b),
%trace,

% removes pairs with two of the same word
findall([[A,B],R],(member([[A,B],R],Words4b),not(A=B)),Words4a),

% removes word pairs already at start
findall([AB,R],(member([AB,R],Words4a),not(member(AB,Words3))),Raw),%subtract(Words4a,Words3,Raw),

% find chains
findall([[A,B,C],[[[D,E,F,G],[H,J,K,M]]]],(member([[A,B],[D,E,F,G]],Raw),member([[B,C],[H,J,K,M]],Raw),
not(A=C)),Chains),

phrase_from_file_s(string(BrDict0), "../Text-to-Breasonings/brdict1.txt"),
	splitfurther(BrDict0,BrDict01),
	sort(BrDict01,BrDict03),
%trace,
findall([[A,B,C],[D,E,F,G,H,J,K,M],Alg],(member([[A,B,C],[[[D,E,F,G],[H,J,K,M]]]],Chains),words_to_alg([D,E,F,G,H,J,K,M],[],Alg,BrDict03)),Algorithms).

% v(w,o),v(o),w(o).
% w = either o or v
 
% words_to_alg([1,2,3],[],A,[[1,right],[2,right],[3,right]])
% A = [[[n, 1]], [[n, 2]], [[n, 3]]] 

% words_to_alg([1,2,3],[],A,[[1,object],[2,object],[3,object]]).
% A = [[[n, 1], [2]], [[n, 3]]] 

% words_to_alg([1,2,3],[],A,[[1,right],[2,object],[3,right]]).
% A = [[[n, 1]], [[n, 2]], [[n, 3]]] 

% get args if right, test if no items
words_to_alg([],Alg,Alg,_BrDict03) :- !.
words_to_alg(List,Alg1,Alg2,BrDict03) :-
 append(Rest3,[Item1|Rest2],List),
 %atom_string(Item1,Item2),
 member([Item1,Object],BrDict03),
 
 ((Object=right->true;Object=plus)-> 
 (Rest3=[]->(append(Alg1,[[[n,Item1]]],Alg3),
 Rest5=Rest2); % check for no o
 ((append(Alg1,[[[n,Item1],[Rest3]]],Alg3),
 Rest5=Rest2)));
 (append(Rest4,[Word],Rest2),Rest5=[],
 (Rest4=[]->append(Alg1,[[[n,Item1]],
 [[n,Word]]],Alg3);
 append(Alg1,[[[n,Item1],[Rest4]],
 [[n,Word]]],Alg3)))),
 words_to_alg(Rest5,Alg3,Alg2,BrDict03),!.
 
% takes too long
recursive_br_gen(Raw,Chains) :-
 %phrase_from_file_s(string(File), "../Text-to-Breasonings/file.txt"),
 phrase_from_file_s(string(File), "../Text-to-Breasonings/file.txt"),
 string_codes(File_string0,File),
 downcase_atom(File_string0,File_string1),
 SepandPad="#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\!'\"0123456789",
 split_string(File_string1,SepandPad,SepandPad,File_string2),
 
 % truncate file to N words
 Truncate_length=100,
 length(File_string2,L3), length(File_string2b,Truncate_length), (L3=<Truncate_length->File_string2=File_string2a; (append(File_string2b,_,File_string2),File_string2b=File_string2a)),
 
 % delete connectives such as and, the
open_file_s("connectives.txt",Connectives),

subtract(File_string2a,Connectives,Words1),

% recursively finds all new connections
find_pairs(Words1,Raw),

% find chains
findall([A,B,C],(member([A,B],Raw),member([B,C],Raw),
not(A=C)),Chains).
  
  
find_pairs(Words1,Raw2) :-

% finds adjacent combos of words
length(Words1,L1),
L2 is L1-1,
numbers(L2,1,[],N),
findall([A,B],(member(N1,N),N2 is N1+1,
get_item_n(Words1,N1,A),
get_item_n(Words1,N2,B)),Words2),

% finds suggestions for new combos of words, eg a b, a c and d c->d b
sort(Words2,Words3),
%trace,
findall([F1,K1],(member([A,B],Words3),
findall(E1,(member([A,C],Words3),
findall([D,B],member([D,C],Words3),E),
%foldr(append,E,[],E1)
E=E1),F),
foldr(append,F,[],F1),
findall(J1,(member([G,B],Words3),
findall([A,H],member([G,H],Words3),J),
%foldr(append,J,[],J1)
J=J1),K),
foldr(append,K,[],K1)),L),
%trace,

% makes this a list of A,B
foldr(append,L,[],LL1),
foldr(append,LL1,[],Words4),
%LL1=L,
%maplist(append,[LL2],[Words4]),

% remove duplicates
sort(Words4,Words4b),
%trace,

% removes pairs with two of the same word
findall([A,B],(member([A,B],Words4b),not(A=B)),Words4a),

% removes word pairs already at start
subtract(Words4a,Words3,Raw),
%trace,

((subtract(Raw,Words1,[])->true;Raw=[])->Raw2=Raw;(writeln1([*,Raw]),find_pairs(Raw,Raw3),
append(Raw3,Raw,Raw4),sort(Raw4,Raw2))).
  