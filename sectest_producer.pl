% place in gh/t2b (not in private2/t2b)

%% mind read test

%% Make files different for different tests

%% *** Important: initialise program before running for the first time:
%% N is 1*2*3*5,texttobr2(N). %% 100 As for 1 (turned on)*2 (to and from computer)*3 (rb, itself (already done), graciously give or blame, radio button for graciously give or blame)*5 (5 objects)
%% N is 1*2*3*5,texttobr2(N). %% 100 As for 1 (turned off)*2 (to and from computer)*3 (rb, itself (already done), graciously give or blame, radio button for graciously give or blame)*5 (5 objects)
%% also breason out and dot on objects before line above and breason out and dot on when recognising and saying object (with all objects having different breasonings)


%%use_module(library(pio)).

:- use_module(library(date)).
:-include('../Text-to-Breasonings/text_to_breasonings.pl').
:-include('../mindreader/mindreadtestshared').
:-include('../listprologinterpreter/la_strings_string.pl'). %**** change path on server
:-include('../listprologinterpreter/la_maths.pl'). %**** change path on server
:-include('../Text-to-Breasonings/text_to_breasonings.pl').
:-include('../Algorithm-Writer-with-Lists/grammar_logic_to_alg.pl').

/*
- for each customer, each time
- medit and medic each given 250
- 3 points each given 250
- my opinion - + if they have finished, are happy
*/

sectest_p:-
	%random(X),N is round(100*X),

		%phrase_from_file_s(string([N,_]), "a_tally.txt"),
		%string_codes(String02b,String00a),
		%atom_to_term(String00a,[N,_],[]),

numbers(2,1,[],Ns),
%writeln(N),
findall(_,(member(N1,Ns),

	find_time1(H,M,S),
	politeness(0,Medit),
	politeness(0,Medic),
	politeness(0,Three_points),
	politeness(0,My_opinion), % if there's nothing else wrong, is there anything else wrong?
	% no_death(0,Threats2), % medits for life
	writeln([N1,H,M,S,Medit,medit]),
	writeln([N1,H,M,S,Medic,medic]),
	writeln([N1,H,M,S,Three_points,three_points]),
	writeln([N1,H,M,S,My_opinion,my_opinion]),

	
	Br=16000, W=80,
	grammar_logic_to_alg1("I am happy.",Br,GL_out1),
	term_to_atom(GL_out1,GL_out2),
	string_atom(GL_out,GL_out2),
	texttobr2(u,u,GL_out,Br,false,false,false,false,false,false,W),
	texttobr(u,u,GL_out,Br)

	
	
	),_).%,Threats2,no_death]).
	
find_time1(H,M,S) :-
	find_time(H,M,S),!.

politeness(Threats1,Threats2):-
	%% "Given that we are interested in friendliness in primary school, secondary school and university, is there anything else?"
	trialy2_6("Yes",R1),
	trialy2_6("No",R2),
		R=[R1,R2/**,R3,R4,R5,R6,R7,R8,R9,R10**,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,R21,R22,R23,R24,R25,R26,R27**/
		],
	sort(R,RA),
	reverse(RA,RB),
	RB=[[_,Answer]|_Rest],
	
	(Answer="No"->Threats2=Threats1;(Threats3 is Threats1+1,politeness(Threats3,Threats2))),!.
