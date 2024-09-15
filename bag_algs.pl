:-include('big_connections_with_bag3_and_mr_short_books_aa540_algs_init.pl').
:-include('../Text-to-Breasonings/text_to_breasonings3.pl').
:-include('../t2ab/t2ab.pl').
:-include('../listprologinterpreter/la_files.pl').
:- dynamic count2/1.
:-include('la_vps.pl').
%:-include('../Lucian-Academy/word_count.pl').
%bag_algs(96000).
get_r(X2) :-
random(X),X1 is ceiling(X*1000000),foldr(string_concat,["Books/algs-",X1,"/"],X3),
(exists_directory(X3)->get_r(X2);X3=X2).

bag_algs(Limit1,C2) :-
((
(exists_directory('Books/algs')->(get_r(X2),mv("Books/algs/",X2));true),
time((
Split_into_n=4,
%Limit is ceiling((Limit1*2.5*Split_into_n)),%/(*5)),
Limit is Limit1,
 retractall(count2(_)),
 assertz(count2(0)), 
 retractall(br_bal(_)),
 assertz(br_bal([])), 
 %length(L,10),
 %L=[1,2,3,4,5,6,7,8,9,10],
 open_string_file_s("../Lucian-Academy/Books1/algs/lgalgs_a.txt",File_string),
 term_to_atom(File_string2,File_string),
 File_string2=["","","",File_string1],
 not(File_string1=""),
 split1(Split_into_n%17
 ,File_string1,File_strings),
 length(File_strings,L),
 numbers(L,1,[],Ls),

 concurrent_maplist(a1([File_strings,Limit]),Ls,_N2)))
 )->
 (
 true	);true%bag_algs(Limit1)
	),
	
	 count21(C2),writeln([count,C2,/,Limit1]),

	
get_time(A),stamp_date_time(A,date(_Year,_Month,_Day,Hour1,Minute1,_Seconda,_A,_TZ,_False),local),

open_string_file_s("aa_log.txt",File_string_b),
 term_to_atom(File_string2_b,File_string_b),
 append(File_string2_b,[[alg,Hour1,Minute1,C2]],File_string2_b1),


 open_s("aa_log.txt",write,Stream1a),
	write(Stream1a,File_string2_b1),
	close(Stream1a),
	
 
  br_bal(Br),
  

open_string_file_s("alg_cache.txt",File_string_b_cache),
 term_to_atom([Cache_N,File_string2_b_cache],File_string_b_cache),

 term_to_atom(Br,N5),atom_string(N5,N6),
 
 string_concat(File_string2_b_cache,N6,N7),
 
 %word_count(["string",N7],WC),
 WC is C2+Cache_N,
 
 (WC>6000->
 ( %delete(N2,0,N3),append(_,[N4],N3),writeln1(N4),
 
 texttobr2(u,u,N7,u,[auto,on]),
 t2ab(u,u,N7,u,on),
 
 term_to_atom([0,""],Cache_atom),
  open_s("alg_cache.txt",write,Stream1a_cache),
	write(Stream1a_cache,Cache_atom),
	close(Stream1a_cache)
	);
 (%WC1 is Cache_N+WC,
  term_to_atom([WC,N7],N8),
  open_s("alg_cache.txt",write,Stream1a_cache),
	write(Stream1a_cache,N8),
	close(Stream1a_cache)
	)),

 
 !.

count21(C) :- count2(C).

a1([File_strings,Limit],L1,File_string_a) :-
 %findall(Sent_br2,(member(L1,Ls),
 count21(C2),(C2>=Limit->
 (File_string_a="");
 (
 %open_s("../Lucian-Academy/Books1/algs/lgalgs_a.txt",write,Stream1),
	%write(Stream1,File_string),
	%close(Stream1),abort);true),
	writeln([count,C2,/,Limit]),get_item_n(File_strings,L1,N),
 

(((

(catch(call_with_time_limit(0.84,
                          time( big_connections_with_bag3_and_mr2(N,File_string_a))),
      time_limit_exceeded,
      false))
      
      ,%->
      
      
  findall(_,sub_string(File_string_a,_,_,_,". "),A),length(A,L2),
split_string(File_string_a,"\n\r","\n\r",NL),length(NL,NLN),Sent_br2 is L2-NLN,

 count21(C),
 C1 is C+Sent_br2,
 retractall(count2(_)),
 assertz(count2(C1)),
 
 br_bal(Br),
 append(Br,[File_string_a],Br1),
  retractall(br_bal(_)),
 assertz(br_bal(Br1))

 
 
 )->true;(File_string_a=""))))),!.
 

sum(A,B,C) :- C is A+B.
split1(N,A,B) :-
 split_string(A,"\n\r","\n\r",C),
 split2(N,C,[],D),
 findall(H,(member(D1,D),
 findall([E,"\n"],member(E,D1),F),
 flatten(F,G),
 foldr(string_concat,G,H)),B),!.
split2(N,A,B,C) :-
 length(D,N),
 (append(D,E,A)->
 (append(B,[D],F),
 split2(N,E,F,C));
 append(B,[A],C)),!.


  t2b :-
N1=1,texttobr2(N1,"Books/algs/lgalgs_a.txt",u,u,false,false,false,false,false,false,[auto,on]),!.

t2ab:-t2ab(u,"Books/algs/lgalgs_a.txt",u,u,on),!.

print_report :-
 open_string_file_s("aa_log.txt",File_string),
 term_to_atom(File_string2,File_string),
 sort(File_string2,File_string22),
 reverse(File_string22,File_string21),
 length(File_string21,L),
 numbers(L,1,[],Ls),
 findall(_,(member(L1,Ls),get_item_n(File_string21,L1,A),writeln([L1|A])),_),!.