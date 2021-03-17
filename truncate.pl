%:-include('la_strings2.pl').
:-include('la_strings.pl').
:-include('la_strings_string.pl').

% word_count(["file","file.txt"],Words).
% Words = 69.

% word_count(["string","a b c"],Words).
% Words = 3.


% given file with number of As required and gl file length, gives div and mod values for t2b

truncate1(File1,Words1,File2) :-
		
		
SepandPad="&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!'0123456789",

	(true->
	(phrase_from_file_s(string(String2), File1));
	_String1=String2),
	split_string(String2,SepandPad,SepandPad,String3),
	%writeln(String3),
	length(String3,Words2),
	
	(Words1>Words2->Words3=Words2;Words3=Words1),
	length(String4,Words3),
	append(String4,_,String3),

	findall([Item," "],member(Item,String4),Item2),
	maplist(append,[Item2],[Item3]),
	concat_list(Item3,String5),
	
	%term_to_atom(Item2,String4a),
	%string_atom(String5,String4a),

	(open_s(File2,write,Stream3),
	write(Stream3,String5),
	close(Stream3)),!.
