% ["Creating and Helping Pedagogues","CREATE AND HELP PEDAGOGUES by Lucian Green Pedagogy Helper - Write on Breasoning - Computer Science 4 of 4.txt",0,algorithms,"    61.    I knew about or."]

% join two sentences using br alg gen

% br_alg_gen2(Br),writeln1(Br).

% input:
% 10. I added that I could write breasonings by substituting "The algorithm finds the output for an input using similar yet different enough phrases" for the algorithm. For example, the writer can find the complete set of non-synonymous words that take turns with a word. The linguistic algorithm writer attempted to cover the humanities framework with ideas by tying critical terms from the real world to the algorithms in one version. Also, she could impressionably convert algorithms to functionalism and back.  In a way, it was treating old as new. There were existing ideas and recent research in contemporary times.

% output:
% [" For example  for an input using similar yet different enough phrases"" for the algorithm"," Also, she writer can find the complete set of non-synonymous words that take turns with a word"]

%:- include('../listprologinterpreter/listprolog').
:- include('br_alg_gen.pl').
:-include('../listprologinterpreter/la_maths.pl').

br_alg_gen2(Br) :-

phrase_from_file_s(string(Codes), "../Text-to-Breasonings/file.txt"),

	string_codes(String,Codes),

br_alg_gen21(String,Br),!.

br_alg_gen21(String,Br) :-

	SepandPad="&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!0123456789", % doesn't have "'" xx
	%string_codes(String1,Codes),
	%string_to_list2(SepandPad,[],SepandPad1),
	string_codes(SepandPad,SepandPad1),


	split_string(String,"\n\r.","\n\r.",Strings),

findall(File_list1,(member(String1,Strings),	string_codes(String1,Codes1),
	split_on_substring117(Codes1,SepandPad1,[],File_list1)),File_list),


% gets aa bb from Aa Bb
findall(C,(member(AA,File_list),
findall([A,B1],(member(A,AA),downcase_atom(A,B),atom_string(B,B1)),C)),CC),

%findall(A,member([_,A],C),D),

% gets join word pairs
%trace,
%flatten(CC,CC1),
%foldr(string_concat,CC1,CC2),
br_gen2(String,Raw,_Chains),

% finds joined sentences with Aa Bb

findall(L3,%[G,E,F,H],
(member([E,F],Raw),
%member([C1,C2],CC),get_n_item([C1,C2],E,N1),
member(C3,CC),get_n_item(C3,[_,E],N1),
%numbers(N1,1,[],N11),
length(L1,N1),%append(G,[E|_],C2)
append(L1,_,C3),%append(L2,_,C1),
findall(C4,member([C4,_],L1),C5),
member(D3,CC),%append(_,[F|H],D2)),Br).
get_n_item(D3,[_,F],N2),
%numbers(N1,1,[],N11),
length(L2,N2),%append(G,[E|_],C2)
append(_,L2,D3),
findall(D4,member([D4,_],L2),D5),
foldr(append,[C5,[" "],D5],[],L31),
%trace,
%((%not(not(spec(_))),
%spec(on))->(findall(L312,(member(L311,L31),downcase_atom(L311,L312)),L313),keywords(Keywords),not(intersection(L313,Keywords,[]))%,trace
%);true),
%writeln1(C5),trace,

foldr(string_concat,L31,"",L3)),Br).

