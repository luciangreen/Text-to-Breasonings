% big_medit2.pl

:-include('../listprologinterpreter/listprolog.pl').
:-include('../Text-to-Breasonings/meditatorsanddoctors.pl').
:-include('../Text-to-Breasonings/meditationnoreplace2.pl').
:-include('../Text-to-Breasonings/prompt_question1.pl').
:-include('../Text-to-Breasonings/prompt_meditation1.pl').

main:-catch(main2,Err,handle_error(Err)),halt.
handle_error(_Err):-
  halt(1).
main :- halt(1).

main2 :-
((exists_file('../Text-to-Breasonings/b1'),
exists_file('../Text-to-Breasonings/b2'),
exists_file('../Text-to-Breasonings/c1'),
exists_file('../Text-to-Breasonings/c2'))->
true;
shell1_s("./d-prep.sh")),
shell1_s("./add_to_tt_log.sh"),

meditators(A),meditators2(B),length(A,AL),length(B,BL),CL is AL+BL,

meditation1(Utterances1,Utterances2,Immortality),

length(Utterances1,UL1),
length(Utterances2,UL2),

length(Immortality,J2),

% breasonings:

N1 is 	2*108*250 +				% meditation
		16000 + 4 +				% texttobr2_square
		160 + 					% 160 combophil br
		15*3*4*16000 + 			% d.sh
		3*10*4*16000 + 			% day2.sh 
								% with medit, tt, medic frozen age, 
								% hq thought
		250*CL +				% a15_meditators.sh prepares an apartment 
								% in each dimension for meditators by 
								% helping 15 of those around them
		
		3*10*(UL1+UL2)*250 +	% daily_medit.sh
		3*10*J2*250,

GM is 	250*CL,					% group_meditation.sh

C1 is	GM +					
		16000,					% time_hop.sh
C2 is	GM,

		bc12,
		destination(N1,C1,C2,"Going to present"),
		destination(N1,C1,C2,"Going to 5689"),
		point_to_br(N1),
		prompt_question,
		shell1_s("./anti_moral_end_meditators.sh"),
		!.

bc12 :-
working_directory1(WD,WD),
working_directory1(_,"../Text-to-Breasonings"),
shell1_s("./bc12.sh"),
shell1_s("./bc12.sh"),
working_directory1(_,WD),!.

point_to_br(T) :-
	N2 is (T div 16000)+1,

	texttobr2_1(N2),!.

destination(N1,C1,C2,Label) :-
		point_to_br(N1),
		prompt_question,
		prompt_meditation,
		write(Label),prompt_tt,
		point_to_br(C1),
		bc12,
		point_to_br(C2),
		prompt_meditation,!.
		
prompt_tt :- write(" "),
repeat,writeln("Please enter \"y\":"),
read_string(user_input,"\n\r","\n\r",_,S),
S="y",!.		
