%% Writes and breasons out random algorithms with predicates

:- use_module(library(date)).

rcawp1(N) :-
	get_time(TS),stamp_date_time(TS,date(Year,Month,
		Day,Hour1,Minute1,_Seconda,_A,_TZ,_False),local),
	concat_list("rcawp", 	
		[Year,Month,Day,Hour1,Minute1,".txt"],File1),
	string_concat("./",File1,File2),
	leash(-all),visible(+all),
	protocol(File1),
	time(rcawp2(N)),
	noprotocol,
	%%texttobr2(u,File2,u,u),texttobr(u,File2,u,u).
	writeln([File2,"not t2b2'ed out.  Please do manually."]).
	
rcawp2(0) :- !.
rcawp2(Count1) :-
	writeln([algorithm,Count1]),
	random(N1),N2 is round(N1*1000),
	random(N3),N4 is round(N3*1000),
	N5 is N2+N4,
	%%caw00(off,function0,[],1,4,[[[[[v,a],N2],[[v,b],N4]],
	%%	[[[v,c],N5]],true]],[],Program),
	writeln(Program),
	writeln(""),
	%%trace,
	%%interpret(off,[[n,function0],[N2,N4,[v,c]]],Program,
	%%	_A), %% Replaced [[[v,c],N5]] with _A
	%%notrace,
	writeln(""),
	writeln(""),
	Count2 is Count1-1,
	rcawp2(Count2).

concat_list(A,[],A) :-!.
concat_list(A,List,B) :-
	List=[Item|Items],
	concat_list2(A,[Item],C),
	concat_list(C,Items,B).
concat_list2(A,List,C) :-
	((List=[[Item]]->true;List=[Item])->
	string_concat(A,Item,C);
	fail),!.
concat_list2(A,Item,C) :-
	concat_list(A,Item,C),!.
	
	