:-include('../listprologinterpreter/la_strings.pl').
:-include('../listprologinterpreter/la_strings_string.pl').

% ?- truncate_words_conserving_formatting(["string","a123b ()c d e f"],3,["string",S]).
% S = "a123b ()c".

/**
?- truncate_words_conserving_formatting(["file","file3.txt"],1,["file","file4.txt"]).
**/

truncate_words_conserving_formatting([Type1,File1],Words1,[Type2,File2]) :-
	% split on non-alpha chars, count n words and keep formatting

	SepandPad="&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!'0123456789",

	(Type1="file"->
	(phrase_from_file_s(string(String2), File1));
	File1=String2),
	
	split_string_onnonletter_by_itself2(String2,SepandPad,String3),
	
	%trace,
	
	first_n_words(String3,Words1,[],String4),
	maplist(append,[[String4]],[Item3]),

	concat_list(Item3,String5),
	
	(Type2="file"->
	(open_s(File2,write,Stream2),
	write(Stream2,String5),
	close(Stream2),!);
	(String5=File2)).
	
	

split_string_onnonletter_by_itself2(String00,Chars,List1) :-
	string_codes(String00,String1),
	split_string_onnonletter_by_itself2(String1,[],Chars,List0),
	%string_codes(String1a,List0),
	%writeln(String1a),
	%trace,
	string_codes(List0,List2),
	split_string(List2,"ª","ª",List1),!.
split_string_onnonletter_by_itself2([],Input,_Chars,Input) :- !.
split_string_onnonletter_by_itself2(Input1,Input2,Chars,Input3) :-
	Input1=[Input4|Input5],
	%not(char_type(Input4,alpha)),
	string_codes(Chars,Codes),
	member(Code,Codes),
	Input4=Code,
	append(Input2,`ª`,Input81),
	append(Input81,`‡`,Input8),
	append(Input8,[Code],Input7),
	append(Input7,`ª`,Input6),
	split_string_onnonletter_by_itself2(Input5,Input6,Chars,Input3), !.
split_string_onnonletter_by_itself2(Input1,Input2,Chars,Input3) :-
	Input1=[Input4|Input5],
	append(Input2,[Input4],Input6),
	split_string_onnonletter_by_itself2(Input5,Input6,Chars,Input3), !.

first_n_words([],_,String,String) :- !.
first_n_words(_String1,0,String,String) :- !.
first_n_words(String1,Words1,String2a,String2b) :-
	String1=[String3|String4],
	string_length(String3,2),
	string_concat(A,B,String3),string_length(B,1),
	A="‡",
	append(String2a,[B],String5),
	first_n_words(String4,Words1,String5,String2b),!.
first_n_words(String1,Words1,String2a,String2b) :-
	String1=[String3|String4],
	(not((string_length(String3,2),
	string_concat(A,B,String3),string_length(B,1),
	A="‡"))),
	append(String2a,[String3],String5),
	Words2 is Words1-1,
	first_n_words(String4,Words2,String5,String2b),!.
