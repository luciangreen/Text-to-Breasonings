%% enter source, alg, pl or lp (with types, open), for subj/ass, date br (may be manually entered)

%% x one alg to enter alg specs 

%% x one alg to suggest algs, like combophil with filename - upper limit of algs per chapter, records algs per chapters
% - 4 per file, (then 16 per file x)

%% combophil.pl

%% Finds combinations of lines of philosophy

%:-include('../listprologinterpreter/listprolog.pl').
:-include('chatgpt_qa.pl').
:-include('../Text-to-Breasonings/text_to_breasonings.pl').

:- use_module(library(date)).

string(String) --> list(String).

list([]) --> [].
list([L|Ls]) --> [L], list(Ls).

%% e.g. combophil(2). to write on a combination of philosophies

% cgpt_combophil(Books,Num).

cgpt_combophil(Books,Num,In_String%,Out_List
):-
	N1 = 4, %% maximum number of algorithms per file
	% find files with n or fewer algorithms
	%phrase_from_file_s(string(String00a), "combophil_alg_log.txt"),
	%string_codes(String02b,String00a),
	%trace,
	%atom_to_term(String02b,String02a,[]),
	
 %directory_files('../Lucian-Academy/Books/',F000),
	%delete_invisibles_etc(F000,Books),
	
	working_directory(A000,A000),
	working_directory(_,'../Lucian-Academy/Books/'),
	%folders(Folders),
	%Folders=["a000"],
	%trace,
	findall([Dept,G00],(member(Dept,Books),
	concat_list([Dept],Dept1),
	directory_files(Dept1,F),
	delete_invisibles_etc(F,G),
	member(G00,G)),G1),
	%trace,
	delete_all(String02a,G1,G2),
	findall([G51,G52,0],(member([G51,G52],G2)),G6),
	%trace,
	append(String02a,G6,G3),
%trace,
%numbers(Num,1,[],Nums),
%findall(G4,(member(_,Nums),
	combophil_alg_log1(Num,G3,[],G41,In_String),%),G41),
 
 	working_directory(_,A000),

get_time(TS),stamp_date_time(TS,date(Year,Month,Day,Hour1,Minute1,Seconda,_A,_TZ,_False),local),
	foldr(string_concat,["oldphil-", Year ,"-", Month ,"-", Day ,"-", Hour1 ,"-", Minute1 ,"-", Seconda,".txt"],FN),
   term_to_atom(G41,String1),
	save_file_s(FN,String1),
	
working_directory1(WD,WD),
working_directory1(_,"../Text-to-Breasonings"),
atomic_list_concat(List1,"\n",String1),
atomic_list_concat(List1," ",String2),
N0=1,M=u,(texttobr2(N0,u,String2,M,[auto,on])->true;true),

working_directory1(_,WD),
	%

	%(open_s("combophil_alg_log.txt",write,Stream1),
	%write(Stream1,String1),
	%close(Stream1)),
	!.
	
delete_all([],G,G) :- !.
delete_all(G0,G1,G2) :-
	G0=[[String1,String2,_]|Strings2],
	delete(G1,[String1,String2],G3),
	delete_all(Strings2,G3,G2).
 	/**
%trace,
%SepandPad="#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\!'0123456789",
	%trace,
	findall(String02b,(member(Filex1,G),
	string_concat(Dept1,Filex1,Filex),
		phrase_from_file_s(string(String00a), Filex),
		string_codes(String02b,String00a)),Texts1),
**/
	% choose a file, algorithm y or n, record if y
	
combophil_alg_log1(0,_G3,G41,G41,_In_String) :- !.
combophil_alg_log1(N1,G3,G40,G41,In_String) :-
 (combophil_alg_log(_,G3,G4,In_String)->
 (append(G40,[G4],G42),
 N2 is N1-1,
 combophil_alg_log1(N2,G3,G42,G41,In_String));
 G40=G41),!.

combophil_alg_log(_N1,G1,G2,In_String) :-
	((member([_Dept00,_Folder00,N20],G1)%, N20<N1
	)->
	(findall([Dept01,Folder01,N20],(member([Dept01,Folder01,N20],G1)%,N20<N1
	),R),
	%trace,
	get_text1(R,Phil410011),
	get_text1(R,Phil410012),
	get_text1(R,Phil410013),
	get_text1(R,Phil410014),
	get_text1(R,Phil410015),
	get_text1(R,Phil410016),
	get_text1(R,Phil410017),
	get_text1(R,Phil410018),
	get_text1(R,Phil410019),

	foldr(string_concat,[In_String,
	" because ",Phil410011,
	" because ",Phil410012,
	" because ",Phil410013,
	" because ",Phil410014,
	" because ",Phil410015,
	" because ",Phil410016,
	" because ",Phil410017,
	" because ",Phil410018,
	" because ",Phil410019],Q11),
	
	foldr(string_concat,["What is ",Q11,
	" in one sentence?"],Q1),
	writeln(Q1),
	q(Q1,A1),
	writeln(A1),

	foldr(string_concat,["What is a useful Prolog algorithm for ",Q11,"?"],Q2),
	writeln(Q2),
	q(Q2,A2),
	writeln(A2))),
G2=[A1,A2].
		
get_text1(R,Phil412) :-
 (get_text10(R,Phil412)->true;get_text1(R,Phil412)).
get_text10(R,Phil412) :-
	random_member([Dept,Folder,_N2],R),
	%N2=<N1,
	get_texts1(Dept,Folder,Text),
	SepandPad="\n\r",
	split_string(Text,SepandPad,SepandPad,Phil2),
	delete(Phil2,"",Phil3),
	append([_],Phil30,Phil3),
	append(Phil31,[_],Phil30),
	random_member(Phil4,Phil31),
	SepandPad1=".",
	split_string(Phil4,SepandPad1,SepandPad1,Phil21),
	append([_],Phil212,Phil21),
	random_member(Phil41,Phil212),

	SepandPad2="&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\t\\\"!'0123456789", % no space
 split_string(Phil41,SepandPad2,SepandPad2,Phil411),
	foldr(string_concat,Phil411,Phil412).
	
delete_invisibles_etc(F,G) :-
	findall(J,(member(H,F),atom_string(H,J),not(J="."),not(J=".."),not(string_concat(".",_,J))),G).


get_texts1(Dept0,Dept,Text) :-
	%findall(Texts2,(%member(Dept0,Dept),
	concat_list([Dept0,"/",Dept
	],Dept1),
	%directory_files(Dept1,F),
	%delete_invisibles_etc(F,G),
%trace,
%SepandPad="#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\!'0123456789",
	%trace,
	%findall(String02b,(member(Filex1,G),
	%string_concat(Dept1,Filex1,Filex),
		phrase_from_file_s(string(String00a), Dept1),
		string_codes(Text,String00a).
				
choose_texts(Texts1,Texts2,Text) :-
	random_member(Text,Texts1),
	delete(Texts1,Text,Texts2).