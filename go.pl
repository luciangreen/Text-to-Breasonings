:-include('../Text-to-Breasonings/text_to_breasonings.pl').

go :-
working_directory	
A=[person1,person2],

time(findall(_,(member(P,A),

time((
foldr(string_concat,["swipl --stack-limit=80G -f -q ./bag_args21.pl"],S3)%,
,catch(bash_command(S3,_), _, (foldr(string_concat,["Warning."%%"Error: Can't clone ",User3,"/",Repository3," repository on GitHub."
	],_Text4),%writeln1(Text4),
	fail%abort
 	)),

foldr(string_concat,["swipl --stack-limit=80G -f -q ./bag_algs1.pl"],S31)%,
,catch(bash_command(S31,_), _, (foldr(string_concat,["Warning."%%"Error: Can't clone ",User3,"/",Repository3," repository on GitHub."
	],_Text4),%writeln1(Text4),
	fail%abort
 	)),
 	
 	texttobr2_1(1), % meditation
 	texttobr2_1(1), % teleport 1
 	texttobr2_1(1), % medicine 1
 	texttobr2_1(1), % teleport 2
 	texttobr2_1(1), % medicine 2
 	texttobr2_1(1), % a thought

 	writeln([P,done])
 	))
 	),_)),!.