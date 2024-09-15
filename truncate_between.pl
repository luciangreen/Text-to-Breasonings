%:-include('la_strings2.pl').
:-include('../listprologinterpreter/la_strings.pl').
:-include('../listprologinterpreter/la_strings_string.pl').

% word_count(["file","file.txt"],Words).
% Words = 69.

% word_count(["string","a b c"],Words).
% Words = 3.


% given file with number of As required and gl file length, gives div and mod values for t2b

truncate_between1(File1,Words_before,Words_during,File2) :-
		
		Words_total is Words_before+Words_during,
		
%SepandPad="&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!'0123456789",

	(true->
	(phrase_from_file_s(string(String2), File1));
	_String1=String2),
	split_string_on_non_alpha(String2,String3),
	%writeln(String3),
	length(String3,Words2),
	
	(Words_total>Words2->Words3=Words2;Words3=Words_total),
	length(String4,Words3),
	append(String4,_,String3),
	
	length(String5a,Words_during),
	append(_,String5a,String4),	

	findall([Item," "],member(Item,String5a),Item2),
	maplist(append,[Item2],[Item3]),
	concat_list(Item3,String5),
	
	%term_to_atom(Item2,String4a),
	%string_atom(String5,String4a),

	(open_s(File2,write,Stream3),
	write(Stream3,String5),
	close(Stream3)),!.
