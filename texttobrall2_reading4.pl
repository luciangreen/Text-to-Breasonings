main:-texttobr2(u,"file.txt",u,u,[auto,on]).
% ['../Text-to-Breasonings/text_to_breasonings.pl'].
% W is 50*4,texttobr2(u,u,u,u,false,false,false,false,false,false,W)
% where W is the number of words to read
% and there are approximately 4 words per algorithm.

%% Important: See instructions for using texttobr.pl at https://lucianpedia.wikia.com/wiki/Instructions_for_Using_texttobr(2).pl .

%% use_module(library(pio)). %% In la_strings
%% use_module(library(dcg/basics)). %% In la_strings

%% texttobr2 - converts file stream to dimensions of objects represented by the words
%% has object name as separate field for new users of texttobr to verify breasonings by hand
%% brdict1.txt contains word and object name, brdict2.txt contains object name and x, y and z

%% texttobr2(Runs,File,StringtoBreason,BreasoningLimit).
:- include('../Text-to-Breasonings/mergetexttobrdict.pl').
:-include('../listprologinterpreter/la_files.pl').
:-include('../listprologinterpreter/la_strings.pl').

:-dynamic sn/1.

%:- include('../listprologinterpreter/la_strings').
%:- include('../Philosophy/14 10 23.pl').

%% Brth is true or false
%texttobr2(N1,Filex1,Stringx1,M1) :-
	%texttobr2(N1,Filex1,Stringx1,M1,false,false,false,false,false,false,0,[auto,off]).

texttobr2(N1,Filex1,Stringx1,M1,[auto,on]) :-
	texttobr2(N1,Filex1,Stringx1,M1,false,false,false,false,false,false,0,[auto,on]).
/*texttobr2(N1,Filex1,Stringx1,M1,Brth,Room,PartOfRoom,Direction,
		ObjectToPrepare,ObjectToFinish) :-
	texttobr2(N1,Filex1,Stringx1,M1,Brth,Room,
	PartOfRoom,Direction,ObjectToPrepare,ObjectToFinish,0,[auto,off]).
	*/
texttobr2(N1,Filex1,Stringx1,M1,Brth,Room,PartOfRoom,Direction,
		ObjectToPrepare,ObjectToFinish,[auto,on]) :-
	texttobr2(N1,Filex1,Stringx1,M1,Brth,Room,
	PartOfRoom,Direction,ObjectToPrepare,ObjectToFinish,0,[auto,on]),!.

%texttobr2(N1,Filex1,Stringx1,M1,Brth,Room,PartOfRoom,Direction,
%		ObjectToPrepare,ObjectToFinish,W) :-
%	texttobr2(N1,Filex1,Stringx1,M1,Brth,Room,
	%PartOfRoom,Direction,ObjectToPrepare,ObjectToFinish,0,[auto,off]).
		
texttobr2(N1,Filex1,Stringx1,M1,Brth,Room,PartOfRoom,Direction,ObjectToPrepare,ObjectToFinish,Words_to_read,[auto,on]) :-
	retractall(auto(_)),
	assertz(auto(on)),

(Stringx1=""->true;
(	retractall(complete_display(_)),
	assertz(complete_display(false)),

	retractall(words_to_read(_)),
	assertz(words_to_read(Words_to_read)),
	
	((number(N1),N=N1)->true;
	(N1=u,N=1)),

	((Filex1=u,Filex="../Text-to-Breasonings/file.txt")->true;
	Filex=Filex1),

	((number(M1),M=M1)->true;
	M=all), %% If m1 is undefined or all then m=all

	prep(List1,BrDict03,BrDict03t,Filex,Stringx1,M,Brth,BrthDict03,Room,RoomDict03,PartOfRoom,PartOfRoomDict03,Direction,DirectionDict03,ObjectToPrepare,ObjectToPrepareDict03,ObjectToFinish,ObjectToFinishDict03),
	
findall(List3,(member(C,List1),downcase_atom(C,List2),atom_string(List2,List3)),D),
	br2(D,BrDict03,BrDict2,BrDict03t,BrDict03t2,N,Brth,BrthDict03,BrthDict04,Room,RoomDict03,RoomDict04,PartOfRoom,PartOfRoomDict03,PartOfRoomDict04,Direction,DirectionDict03,DirectionDict04,ObjectToPrepare,ObjectToPrepareDict03,ObjectToPrepareDict04,ObjectToFinish,ObjectToFinishDict03,ObjectToFinishDict04),
/*	sort(BrDict2,BrDict3),
	(BrDict03=BrDict3->true;
	
	(open_s("../Text-to-Breasonings/brdict1.txt",write,Stream),
%%	string_codes(BrDict3),
	write(Stream,BrDict3),
	close(Stream))),

	sort(BrDict03t2,BrDict03t3),
	(BrDict03t=BrDict03t3->true;
	(open_s("../Text-to-Breasonings/brdict2.txt",write,Stream2),
%%	string_codes(BrDict3),
	write(Stream2,BrDict03t3),
 	close(Stream2))),
 	
 	((Brth=true,
 	sort(BrthDict04,BrthDict044),
	(BrthDict03=BrthDict044->true;
	(open_s("../Text-to-Breasonings/brthdict.txt",write,Stream3),
%%	string_codes(BrDict3),
	write(Stream3,BrthDict044),
 	close(Stream3))))->true;true),
 	
 	((Room=true,
 	sort(RoomDict04,RoomDict044),
	(RoomDict04=RoomDict044->true;
	(open_s("../Text-to-Breasonings/roomdict.txt",write,Stream4),
%%	string_codes(BrDict3),
	write(Stream4,RoomDict044),
 	close(Stream4))))->true;true),

 	((PartOfRoom=true,
 	sort(PartOfRoomDict04,PartOfRoomDict044),
	(PartOfRoomDict04=PartOfRoomDict044->true;
	(open_s("../Text-to-Breasonings/partofroomdict.txt",write,Stream5),
%%	string_codes(BrDict3),
	write(Stream5,PartOfRoomDict044),
 	close(Stream5))))->true;true),

 	((Direction=true,
 	sort(DirectionDict04,DirectionDict044),
	(DirectionDict04=DirectionDict044->true;
	(open_s("../Text-to-Breasonings/directiondict.txt",write,Stream6),
%%	string_codes(BrDict3),
	write(Stream6,DirectionDict044),
 	close(Stream6))))->true;true),

 	((ObjectToPrepare=true,
 	sort(ObjectToPrepareDict04,ObjectToPrepareDict044),
	(ObjectToPrepareDict04=ObjectToPrepareDict044->true;
	(open_s("../Text-to-Breasonings/objecttopreparedict.txt",write,Stream7),
%%	string_codes(BrDict3),
	write(Stream7,ObjectToPrepareDict044),
 	close(Stream7))))->true;true),

 	((ObjectToFinish=true,
 	sort(ObjectToFinishDict04,ObjectToFinishDict044),
	(ObjectToFinishDict04=ObjectToFinishDict044->true;
	(open_s("../Text-to-Breasonings/objecttofinishdict.txt",write,Stream8),
%%	string_codes(BrDict3),
	write(Stream8,ObjectToFinishDict044),
 	close(Stream8))))->true;true),
 	*/
 	length(List1,List1_length_a),
 	Dividend_a is ceiling(List1_length_a/250),
 	Dividend_b is Dividend_a*3, % for graciously giving
 	texttobr2_a(Dividend_b,meditation),
 	texttobr2_a(Dividend_b,medicine),
 	texttobr2_a(Dividend_b,pedagogy)
 	)),
 	
 	!.


replace0(Input,Find,Replace,SepandPad,M,Output0) :-
	replace00(Input,Find,Replace,SepandPad,[],Output1),
	truncate(Output1,M,Output0),!.
replace00([],_Find,_Replace,_SepandPad,Input,Input) :- !.
replace00(Input1,Find,Replace,SepandPad,Input2,Input3) :-
	Input1=[Input4|Input5],
	string_codes(Input4,String1),
	replace1(String1,Find,Replace,[],Input7),
	string_codes(Output,Input7),
	split_string(Output,SepandPad,SepandPad,Input8),
	append(Input2,Input8,Input9),
	replace00(Input5,Find,Replace,SepandPad,Input9,Input3), !.
replace1([],_Find,_Replace,Input,Input) :- !.
replace1(Input1,Find,Replace,Input2,Input3) :-
	Input1=[Input4|Input5],
	member(Input4,Find),
	append(Input2,[Replace],Input6),
	replace1(Input5,Find,Replace,Input6,Input3), !.
replace1(Input1,Find,Replace,Input2,Input3) :-
	Input1=[Input4|Input5],
	not(member(Input4,Find)),
	append(Input2,[Input4],Input6),
	replace1(Input5,Find,Replace,Input6,Input3), !.

split_string_onnonletter(String00,List1) :-
	string_codes(String00,String1),
	split_string_onnonletter(String1,[],List0),
	string_codes(List0,List2),
	split_string(List2," "," ",List1),!.
split_string_onnonletter([],Input,Input) :- !.
split_string_onnonletter(Input1,Input2,Input3) :-
	Input1=[Input4|Input5],
	not(char_type(Input4,alpha)),
	append(Input2,[32],Input6),
	split_string_onnonletter(Input5,Input6,Input3), !.
split_string_onnonletter(Input1,Input2,Input3) :-
	Input1=[Input4|Input5],
	char_type(Input4,alpha),
	append(Input2,[Input4],Input6),
	split_string_onnonletter(Input5,Input6,Input3), !.

%% Truncates the list if m is not undefined and m is greater than or equal to the length of string0
truncate(List1,M,String0) :-
	((number(M),length(String0,M),
	append(String0,_,List1))->true;
	String0=List1),!.
	
	
	
prep(List,BrDict03,BrDict03t,Filex,Stringx1,M,Brth,BrthDict03,Room,RoomDict03,PartOfRoom,PartOfRoomDict03,Direction,DirectionDict03,ObjectToPrepare,ObjectToPrepareDict03,ObjectToFinish,ObjectToFinishDict03) :-
	phrase_from_file_s(string(BrDict0), "../Text-to-Breasonings/brdict1.txt"),
	
	%%Chars="’",
	SepandPad="&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!'0123456789",
	%%split_string(BrDict0,SepandPad,SepandPad,BrDict01),
%%writeln([brDict0,BrDict0]),
%%writeln([brdict1]),
	splitfurther(BrDict0,BrDict01),
%%writeln([brDict01,BrDict01]),
	%%char_code(Escape,27),
	%%delete(BrDict01,[Escape,_,_,_,_],BrDict021),
%%writeln([brDict021,BrDict021]),
	%%char_code(Apostrophe,8217),
	%%delete(BrDict021,[Apostrophe,_,_,_,_],BrDict02),
%%writeln([brDict02,BrDict02]),
	sort(BrDict01,BrDict03),
%%writeln([brDict03,BrDict03]),
	length(BrDict03,Length0),write("Number of words in dictionary: "), writeln(Length0),
	
	%%writeln(''),
	%%writeln([brdict2]),
	phrase_from_file_s(string(BrDict0t), "../Text-to-Breasonings/brdict2.txt"),
	%%Chars="’",
	%%split_string(BrDict0,SepandPad,SepandPad,BrDict01),
%%writeln([brDict0,BrDict0]),
	splitfurthert(BrDict0t,BrDict01t),
%%writeln([brDict01,BrDict01]),
	%%delete(BrDict01t,[Escape,_,_,_,_],BrDict021t),
%%writeln([brDict021,BrDict021]),
	%%delete(BrDict021t,[Apostrophe,_,_,_,_],BrDict02t),
%%writeln([brDict02,BrDict02]),
	sort(BrDict01t,BrDict03t),
	
% br_freq		%B=BrDict03t,A=BrDict03,findall([DL,C,"\n"],(member([C,_,_,_],B),findall(_,member([_,C],A),D),length(D,DL)),E),sort(E,F),reverse(F,G),writeln([br_freq,G]),

%%writeln([brDict03,BrDict03]),
	length(BrDict03t,Length0t),write("Number of unique breasonings in dictionary: "), writeln(Length0t),
	
	((Stringx1=u,
	phrase_from_file_s(string(String001), Filex))->true;
	String001=Stringx1),
	
	process_t2b(String001,String00),
	
	%trace,
	%string_codes(SNL0,String00),
	split_string(String00,"\n\r.","\n\r.",SNL1),
	delete(SNL1,"",SNL),
	length(SNL,SN),
	retractall(sn(_)),
	assertz(sn(SN)),
	
	split_string(String00,SepandPad,SepandPad,List1),
	%%split_string_onnonletter(String00,List1),

	truncate(List1,M,List),

	/**replace0(String0,[8221, 8220], 34, SepandPad, M, String1),
	replace0(String1,[8216, 8217], 39, SepandPad, M, String2),
	replace0(String2,[8259, 8211, 8212], 45, SepandPad, M, String3),
	replace0(String3,[160], 32, SepandPad, M, List),
	**/

%%atom_codes(Atom999,String),writeln([atom999,Atom999]),

%%writeln([list,List]),
	%%delete(List,Escape,List11),
%%writeln([list11,List11]),
	%%delete(List11,Apostrophe,List1),
%%writeln([list1,List1]),
	length(List,Length1),write("Number of words to breason out in file: "), writeln(Length1),
	sort(List,List2),
%%writeln([list2,List2]),
	length(List2,Length2),write("Number of unique words in file: "), writeln(Length2),
	
	
	
	((Brth=true,
		phrase_from_file_s(string(BrthDict0), "../Text-to-Breasonings/brthdict.txt"),		splitfurther(BrthDict0,BrthDict01),
	sort(BrthDict01,BrthDict03),
	length(BrthDict03,BrthLength0),write("Number of unique breathsonings in dictionary: "), writeln(BrthLength0))->true;true),
	
	
	((Room=true,
		phrase_from_file_s(string(RoomDict0), "../Text-to-Breasonings/roomdict.txt"),		splitfurther(RoomDict0,RoomDict01),
	sort(RoomDict01,RoomDict03),
	length(RoomDict03,RoomLength0),write("Number of unique rooms in dictionary: "), writeln(RoomLength0))->true;true),

	((PartOfRoom=true,
		phrase_from_file_s(string(PartOfRoomDict0), "../Text-to-Breasonings/partofroomdict.txt"),		splitfurther(PartOfRoomDict0,PartOfRoomDict01),
	sort(PartOfRoomDict01,PartOfRoomDict03),
	length(PartOfRoomDict03,PartOfRoomLength0),write("Number of unique parts of rooms in dictionary: "), writeln(PartOfRoomLength0))->true;true),

	((Direction=true,
		phrase_from_file_s(string(DirectionDict0), "../Text-to-Breasonings/directiondict.txt"),		splitfurther(DirectionDict0,DirectionDict01),
	sort(DirectionDict01,DirectionDict03),
	length(DirectionDict03,DirectionLength0),write("Number of unique directions in dictionary: "), writeln(DirectionLength0))->true;true),

	((ObjectToPrepare=true,
		phrase_from_file_s(string(ObjectToPrepareDict0), "../Text-to-Breasonings/objecttopreparedict.txt"),		splitfurther(ObjectToPrepareDict0,ObjectToPrepareDict01),
	sort(ObjectToPrepareDict01,ObjectToPrepareDict03),
	length(ObjectToPrepareDict03,ObjectToPrepareLength0),write("Number of unique objects to prepare in dictionary: "), writeln(ObjectToPrepareLength0))->true;true),

	((ObjectToFinish=true,
		phrase_from_file_s(string(ObjectToFinishDict0), "../Text-to-Breasonings/objecttofinishdict.txt"),		splitfurther(ObjectToFinishDict0,ObjectToFinishDict01),
	sort(ObjectToFinishDict01,ObjectToFinishDict03),
	length(ObjectToFinishDict03,ObjectToFinishLength0),write("Number of unique objects to finish in dictionary: "), writeln(ObjectToFinishLength0))->true;true),

(complete_display(true)->
	((Stringx1=u, %% Use file, not string as input.
	
	%%maplist(downcase_atom, List2, List3),
	maplist(string_lower, List2, List3),
	
%%writeln([list3,List3]),
	towords3(BrDict03,[],BrDict04,[],_ObjectNames,[],AllUsedNames),
	towords2(BrDict03t,[],BrDict04t),

%%writeln([brDict04,BrDict04]),
	subtract(List3,BrDict04,D1),
%%writeln([list3,brDict04,d1,List3,BrDict04,D1]),
%%writeln(["subtract(BrDict04,List3,D1).",List3,BrDict04,D1]),	
	length(D1,Length01),Difference is abs(Length01),write("Number of words remaining to define: "), writeln(Difference),

	subtract(AllUsedNames,BrDict04t,D2),
	%%delete(D21,'',D2),
	length(D2,Length01t),Differencet is abs(Length01t),write("Number of undefined breasonings: "), writeln(Differencet),
	%% writeln([undefinedbreasonings,D2]), %% Print undefined breasonings

	%%delete(D31,'',D3),
	subtract(BrDict04t,AllUsedNames,D3),
	length(D3,Length01t2),Differencet2 is abs(Length01t2),write("Number of orphaned breasonings: "), writeln(Differencet2),
	
		%%,writeln([orphanedbreasonings,D3]) %% Print orphaned breasonings
	
	((Brth=true,
	
		%%towords3(BrDict03,[],BrDict04,[],_ObjectNames,[],AllUsedNames),
	towords2a(BrthDict03,[],BrtDict04t),

	%%subtract(List3,BrtDict04t,Dt1),
	%%length(Dt1,Lengtht01),Differencet1 is abs(Lengtht01),write("Number of words remaining to define breathsonings for: "), writeln(Differencet1),
	%%writeln(["Number of words remaining to define breathsonings for",Dt1]), %% Print number of words remaining to define breathsonings for

	subtract(AllUsedNames,BrtDict04t,Dt2),
	length(Dt2,Lengtht01t),Differencet22 is abs(Lengtht01t),write("Number of undefined breathsonings: "), writeln(Differencet22),
	%%writeln([undefinedbreathsonings,Dt2]), %% Print undefined breathsonings

	subtract(BrtDict04t,AllUsedNames,Dt3),
	length(Dt3,Lengtht01t2),Differencet3 is abs(Lengtht01t2),write("Number of orphaned breathsonings: "), writeln(Differencet3)
	
		%%writeln([orphanedbreathsonings,Dt3]) %% Print orphaned breathsonings
	
		)->true;true),
		
	((Room=true,
	towords2a(RoomDict03,[],RoomDict04t),
	subtract(AllUsedNames,RoomDict04t,RoomDt2),
	length(RoomDt2,RoomLengtht01t),RoomDifferencet22 is abs(RoomLengtht01t),write("Number of undefined rooms: "), writeln(RoomDifferencet22),
	%%writeln([undefinedrooms,RoomDt2]), %% Print undefined rooms
	subtract(RoomDict04t,AllUsedNames,RoomDt3),
	length(RoomDt3,RoomLengtht01t2),RoomDifferencet3 is abs(RoomLengtht01t2),write("Number of orphaned rooms: "), writeln(RoomDifferencet3)
		%%writeln([orphanedrooms,RoomDt3]) %% Print orphaned rooms
		)->true;true),

	((PartOfRoom=true,
	towords2a(PartOfRoomDict03,[],PartOfRoomDict04t),
	subtract(AllUsedNames,PartOfRoomDict04t,PartOfRoomDt2),
	length(PartOfRoomDt2,PartOfRoomLengtht01t),PartOfRoomDifferencet22 is abs(PartOfRoomLengtht01t),write("Number of undefined parts of rooms: "), writeln(PartOfRoomDifferencet22),
	%%writeln([undefinedPartsOfRooms,PartOfRoomDt2]), %% Print undefined PartsOfRooms
	subtract(PartOfRoomDict04t,AllUsedNames,PartOfRoomDt3),
	length(PartOfRoomDt3,PartOfRoomLengtht01t2),PartOfRoomDifferencet3 is abs(PartOfRoomLengtht01t2),write("Number of orphaned parts of rooms: "), writeln(PartOfRoomDifferencet3)
		%%writeln([orphanedPartsOfRooms,PartOfRoomDt3]) %% Print orphaned PartsOfRooms
		)->true;true),

	((Direction=true,
	towords2a(DirectionDict03,[],DirectionDict04t),
	subtract(AllUsedNames,DirectionDict04t,DirectionDt2),
	length(DirectionDt2,DirectionLengtht01t),DirectionDifferencet22 is abs(DirectionLengtht01t),write("Number of undefined directions: "), writeln(DirectionDifferencet22),
	%%writeln([undefinedDirections,DirectionDt2]), %% Print undefined Directions
	subtract(DirectionDict04t,AllUsedNames,DirectionDt3),
	length(DirectionDt3,DirectionLengtht01t2),DirectionDifferencet3 is abs(DirectionLengtht01t2),write("Number of orphaned directions: "), writeln(DirectionDifferencet3)
		%%writeln([orphanedDirections,DirectionDt3]) %% Print orphaned Directions
		)->true;true),

	((ObjectToPrepare=true,
	towords2a(ObjectToPrepareDict03,[],ObjectToPrepareDict04t),
	subtract(AllUsedNames,ObjectToPrepareDict04t,ObjectToPrepareDt2),
	length(ObjectToPrepareDt2,ObjectToPrepareLengtht01t),ObjectToPrepareDifferencet22 is abs(ObjectToPrepareLengtht01t),write("Number of undefined objects to prepare: "), writeln(ObjectToPrepareDifferencet22),
	%%writeln([undefinedObjectsToPrepare,ObjectToPrepareDt2]), %% Print undefined ObjectsToPrepare
	subtract(ObjectToPrepareDict04t,AllUsedNames,ObjectToPrepareDt3),
	length(ObjectToPrepareDt3,ObjectToPrepareLengtht01t2),ObjectToPrepareDifferencet3 is abs(ObjectToPrepareLengtht01t2),write("Number of orphaned objects to prepare: "), writeln(ObjectToPrepareDifferencet3)
		%%writeln([orphanedObjectsToPrepare,ObjectToPrepareDt3]) %% Print orphaned ObjectsToPrepare
		)->true;true),

	((ObjectToFinish=true,
	towords2a(ObjectToFinishDict03,[],ObjectToFinishDict04t),
	subtract(AllUsedNames,ObjectToFinishDict04t,ObjectToFinishDt2),
	length(ObjectToFinishDt2,ObjectToFinishLengtht01t),ObjectToFinishDifferencet22 is abs(ObjectToFinishLengtht01t),write("Number of undefined objects to finish: "), writeln(ObjectToFinishDifferencet22),
	%%writeln([undefinedObjectsToFinish,ObjectToFinishDt2]), %% Print undefined ObjectsToFinish
	subtract(ObjectToFinishDict04t,AllUsedNames,ObjectToFinishDt3),
	length(ObjectToFinishDt3,ObjectToFinishLengtht01t2),ObjectToFinishDifferencet3 is abs(ObjectToFinishLengtht01t2),write("Number of orphaned objects to finish: "), writeln(ObjectToFinishDifferencet3)
		%%writeln([orphanedObjectsToFinish,ObjectToFinishDt3]) %% Print orphaned ObjectsToFinish
		)->true;true)

	

)->true;(string(Filex),writeln("Number of words, unique words, unique breathsonings, words remaining to define, undefined breasonings, orphaned breasonings, undefined breathsonings and orphaned breathsonings skipped for speed when breasoning out a string.")));true)

,!.

br2(_,A,A,B,B,0,_Brth,BrthDict03,BrthDict03,_Room,RoomDict03,RoomDict03,_PartOfRoom,PartOfRoomDict03,PartOfRoomDict03,_Direction,DirectionDict03,DirectionDict03,_ObjectToPrepare,ObjectToPrepareDict03,ObjectToPrepareDict03,_ObjectToFinish,ObjectToFinishDict03,ObjectToFinishDict03) :- !.
br2(List1,BrDict03,BrDict2,BrDict03t,BrDict03t2,N1,Brth,BrthDict03,BrthDict04,Room,RoomDict03,RoomDict04,PartOfRoom,PartOfRoomDict03,PartOfRoomDict04,Direction,DirectionDict03,DirectionDict04,ObjectToPrepare,ObjectToPrepareDict03,ObjectToPrepareDict04,ObjectToFinish,ObjectToFinishDict03,ObjectToFinishDict04) :-
	br(List1,BrDict03,BrDict21,BrDict03t,BrDict03t21,Brth,BrthDict03,BrthDict041,Room,RoomDict03,RoomDict041,PartOfRoom,PartOfRoomDict03,PartOfRoomDict041,Direction,DirectionDict03,DirectionDict041,ObjectToPrepare,ObjectToPrepareDict03,ObjectToPrepareDict041,ObjectToFinish,ObjectToFinishDict03,ObjectToFinishDict041),
	N2 is N1-1,
	br2(List1,BrDict21,BrDict2,BrDict03t21,BrDict03t2,N2,Brth,BrthDict041,BrthDict04,Room,RoomDict041,RoomDict04,PartOfRoom,PartOfRoomDict041,PartOfRoomDict04,Direction,DirectionDict041,DirectionDict04,ObjectToPrepare,ObjectToPrepareDict041,ObjectToPrepareDict04,ObjectToFinish,ObjectToFinishDict041,ObjectToFinishDict04),!.

towords2([],A,A) :- !.
towords2(BrDict03,A,B) :-
	BrDict03=[[Word,_,_,_]|Rest],
	%%atom_string(Atom,Word),
	append(A,[Word],C),
	towords2(Rest,C,B).

towords2a([],A,A) :- !.
towords2a(BrDict03,A,B) :-
	BrDict03=[[Word,_]|Rest],
	%%atom_string(Atom,Word),
	append(A,[Word],C),
	towords2a(Rest,C,B).

towords3([],A,A,C,C,D,D) :- !.
towords3(BrDict03,A,B,D,E,G,H) :-
	BrDict03=[[Word1,Word2]|Rest],
	(Word2=""->append(G,[Word1],I)->true;
	append(G,[Word2],I)),
	append(A,[Word1],C),
	append(D,[Word2],F),
	towords3(Rest,C,B,F,E,I,H).

string(String) --> list(String).

list([]) --> [].
list([L|Ls]) --> [L], list(Ls).

splitfurther(BrDict01,N) :-
	   phrase(file0(N),BrDict01).
	
file0(N) --> "[", file(N), "]", !.
file0([]) --> [].

%%file([]) --> [].
file([L|Ls]) --> entry(L),",",
%%{writeln(L)}, %%***
file(Ls), !. %% file(Ls),{M=[Ls]})), !. %%, {writeln(["l",L])},",", file(Ls), {writeln(["ls",Ls])},!. %%, {append(L,Ls,M)}, !.	
file([L]) --> entry(L), 
%%{writeln(L)},
!. %%(entry(L),{M=L});{M=[],(writeln("Warning - Entry in incorrect format.")
%%,abort
%%)}, !.

entry([Word2,Word4]) -->
		"[", word(Word), {string_codes(Word2,Word),string(Word2)},
		",",
           word(Word3), {string_codes(Word4,Word3),string(Word4)},
           "]".

splitfurthert(BrDict01,N) :-
	   phrase(file0t(N),BrDict01).
	
file0t(N) --> "[", filet(N), "]", !.
file0t([]) --> [].

%%file([]) --> [].
filet([L|Ls]) --> entryt(L),",",
%%{writeln(L)}, %%***
filet(Ls), !. %% file(Ls),{M=[Ls]})), !. %%, {writeln(["l",L])},",", file(Ls), {writeln(["ls",Ls])},!. %%, {append(L,Ls,M)}, !.	
filet([L]) --> entryt(L), 
%%{writeln(L)},
!. %%(entry(L),{M=L});{M=[],(writeln("Warning - Entry in incorrect format.")
%%,abort
%%)}, !.

entryt([Word2,X3,Y3,Z3]) -->
		"[", word(Word), {string_codes(Word2,Word),string(Word2)},
		",",
	      digits(X),",",{atom_codes(X2,X),atom_number(X2,X3),number(X3)},
           digits(Y),",",{atom_codes(Y2,Y),atom_number(Y2,Y3),number(Y3)},
           digits(Z),{atom_codes(Z2,Z),atom_number(Z2,Z3),number(Z3)},
           "]".

word([X|Xs]) --> [X], {char_type(X,csymf)->true;(X=27->true;X=8217)}, word(Xs), !.
%%word([X]) --> [X], {char_type(X,csymf);(X=27;X=8217)}, !.
word([]) --> [].

digits([X|Xs]) --> [X], {(char_type(X,digit)->true;(string_codes(Word2,[X]),Word2="."))}, digits(Xs), !.
%%digits([X]) --> [X], {(char_type(X,digit);(string_codes(Word2,[X]),Word2="."))}, !.
digits([]) --> [].

t(BrDict,BrDict4,Word,W2) :-
 W1=[square,1,1,0],
 (member([Word,Word1],BrDict)->
 (member([Word1,X,Y,Z],BrDict4)->W2=[Word1,X,Y,Z];W2=W1);W2=W1).

br([],B,B,C,C,_,D,D,_Room,RoomDict03,RoomDict03,_PartOfRoom,PartOfRoomDict03,PartOfRoomDict03,_Direction,DirectionDict03,DirectionDict03,_ObjectToPrepare,ObjectToPrepareDict03,ObjectToPrepareDict03,_ObjectToFinish,ObjectToFinishDict03,ObjectToFinishDict03) :-
	!.
br(Words,BrDict,BrDict2,BrDict4,BrDict5,Brth,BrthDict03,BrthDict04,Room,RoomDict03,RoomDict04,PartOfRoom,PartOfRoomDict03,PartOfRoomDict04,Direction,DirectionDict03,DirectionDict04,ObjectToPrepare,ObjectToPrepareDict03,ObjectToPrepareDict04,ObjectToFinish,ObjectToFinishDict03,ObjectToFinishDict04) :-

%trace,
 findall([Word1,X,Y,Z],(member(W1,Words),t(BrDict,BrDict4,W1,[Word1,X,Y,Z])),Words1),
 length(Words1,Words1L),
 sn(SN),
 
 divide(1000,Words1,[],Words2),
 length(Words2,Words2L),
 numbers(Words2L,1,[],Words2Ns),
 findall(Words6,(member(UN,Words2Ns),get_item_n(Words2,UN,U),
 findall(["[",W,",",X,",",Y,",",Z,"]",","],(member([W,X,Y,Z],U)),U1),
 flatten(U1,Words3),
 append(Words4,[_],Words3),
 flatten(["a",UN,"(",Words4,")"],Words5),
 %trace,
 foldr(string_concat,Words5,Words6)),Words7),
 %foldr(string_concat,Words7,Words8),
 
 findall([X1,",\n"],member(X1,Words7),X2),
 flatten(["a:-",X2],X3),
 append(X31,[_],X3),
 foldr(string_concat,X31,Words8),

 findall([X1,".\n"],member(X1,Words7),X21),
 flatten(X21,X22),
 foldr(string_concat,X22,Words81),
 foldr(string_concat,["%SN=",SN,"\n","main:-a.\n",Words8,".\n",Words81],Words9),
 save_file_s("a.pl",Words9),
 shell1_s("swipl --goal=main --stand_alone=true -o a -c a.pl"),
 
 %trace,
 
 R is ceiling((3*4*16000)/SN), % medit, tt, medic, hq thoughts
 
 %numbers(R,1,[],Rs),
 length(Rs,R),
 findall(["a",","],member(_R1,Rs),R2),
 flatten(["b:-",R2],R3),
 append(R31,[_],R3),
  flatten(["%R=",R,"\n","main:-b.\n",R31,".\n",Words8,".\n",Words81],Words92),
foldr(string_concat,Words92,RWords8),

 %foldr(string_concat,Words91,RWords8),
 save_file_s("b.pl",RWords8),
 shell1_s("swipl --goal=main --stand_alone=true -o b -c b.pl"),

 flatten([":-include('texttobr.pl').\n","main:-texttobr(",R,",\"../Lucian-Academy/algs/lgalgs_a.txt\",u,u).\n","texttobr(",R,",\"../Lucian-Academy/args/lgtext_a.txt\",u,u)."],Words93),
foldr(string_concat,Words93,RWords81),
 save_file_s("c.pl",RWords81),
 shell1_s("swipl --goal=main --stand_alone=true -o c -c c.pl"),

 !.

divide(_,[],Words2,Words2) :- !.
divide(N,Words1,Words21,Words22) :-
 length(L,N),
 (append(L,L1,Words1)->L2=L;
 (L2=Words1,L1=[])),
 append(Words21,[L2],Words23),
 divide(N,L1,Words23,Words22),!.

  	%%).
brth(_,sweetinvincibleandprayedfor).

%% finds unknown words, asks for their br in form "n of m: word", verify, (can go back x) append and sort, save
read_string1(S,user_input, "\n", "\r", _End, ObjectToFinishString) :-
 (auto(on)->S=ObjectToFinishString;
 read_string(user_input, "\n", "\r", _End, ObjectToFinishString)),!.

%/*
process_t2b(A,C) :-
 replace_t2b(Replacements),
 atom_string(A1,A),
 replace1_t2b(Replacements,A1,D1),
 atom_string(D1,C),!.
 
replace1_t2b([],A,A) :- !.
replace1_t2b(Replacements,A,D) :-
 Replacements=[[B,C]|G],
 atomic_list_concat(E,B,A),
 atomic_list_concat(E,C,F),
 replace1_t2b(G,F,D),!.

	replace_t2b([['\\',''],['–',' '],['—',' '],['“','\''],['”','\''],['‘','\''],['’','\'']]).
%*/