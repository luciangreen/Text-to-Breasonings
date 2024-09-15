% big_connections_with_bag3_and_mr.pl

% This will conclude the philosophy project,
% writing 16*n joined details.

:-include('../Text-to-Breasonings/bag2philn-rel.pl').

/*
big_connections_with_bag3_and_mr2(Keywords) :-
%trace,
 retractall(spec(_)),
 assertz(spec(on)),
 findall(Keyword1,(member(Keyword,Keywords),downcase_atom(Keyword,Keyword1)),Keywords2),
 retractall(keywords(_)),
 assertz(keywords(Keywords2)),
 big_connections_with_bag3_and_mr.

choose_texts(K1,H,J1):-
%member(H,G),
not(string_concat("dot",_,H)),
string_concat(K1,H,H1),open_file_s(H1,[A,B,_,File_term]),
flatten([A,"\n",B,"\n",File_term,"\n"],J1).
*/
big_connections_with_bag3_and_mr(KW) :-

 findall(Keyword1,(member(Keyword,KW),downcase_atom(Keyword,Keyword1)),Keywords2),

/*
 (not(spec(_))->
 (retractall(spec(_)),
 assertz(spec(off)));
 true),
*/
(exists_directory('Books')->true;make_directory('Books')),


K=[
%"../Lucian-Academy/Books/BOTS/"
/*
"../Lucian-Academy/Books/COMPUTER SCIENCE/",
*/
%"../Lucian-Academy/Books/Computational English/"
%"../Lucian-Academy/Books/Computational English Copy/"
%/*,
%"../Lucian-Academy/Books/Creating and Helping Pedagogues/",
%"../Lucian-Academy/Books/Delegate workloads, Lecturer, Recordings/",
%*/
%"../Lucian-Academy/Books/ECONOMICS/",
%/*
%"../Lucian-Academy/Books/Fundamentals of Meditation and Meditation Indicators/",
"../Lucian-Academy/Books/Fundamentals of Pedagogy and Pedagogy Indicators1/"
%"../Lucian-Academy/Books/Fundamentals of Pedagogy and Pedagogy Indicators/"

/*
"../Lucian-Academy/Books/IMMORTALITY/",

"../Lucian-Academy/Books/Lecturer/",
"../Lucian-Academy/Books/MEDICINE/",
"../Lucian-Academy/Books/MEDITATION/",
"../Lucian-Academy/Books/Mind Reading/",
"../Lucian-Academy/Books/PEDAGOGY/",
"../Lucian-Academy/Books/POLITICS/",
"../Lucian-Academy/Books/POPOLOGY/"
*/
%"../Lucian-Academy/Books/REPLICATION/",
%"../Lucian-Academy/Books/SALES/"
/*,
"../Lucian-Academy/Books/Short Arguments/",
"../Lucian-Academy/Books/SIMULATION/",
"../Lucian-Academy/Books/Time Travel/"
*/
%"../Lucian-Academy/Books/books2/"
],


findall(_J,(member(K1,K),	directory_files(K1,F),
	delete_invisibles_etc(F,G),

%/*
findall(_,(member(H,G),not(string_concat("dot",_,H)),
string_concat(K1,H,H1),open_file_s(H1,[A,B,_,File_term]),


flatten([A,"\n",B,"\n",File_term,"\n"],J1),
foldr(string_concat,J1,"",J2),

split_string(J2,"\n\r.","\n\r.",J3),
delete(J3,"",J4),
length(J4,Length),
Length2 is Length*16,
%trace,
 bag2phil2(Length2,J2,2,Br32,Keywords2),
 
 string_concat("../Lucian-Academy/Books/",K2,K1),
 string_concat("Books/",K2,K3),
(exists_directory(K3)->true;make_directory(K3)),

%string_concat(K4,"/",K3),
%string_concat(K4,".txt",K5),
foldr(string_concat,[K3,H],K5),

open_s(K5,write,S),
write(S,Br32),close(S),

writeln([K5,written])


),_J10)
%*/
%J10=["Hello, I am Lucian Green.  I enjoy programming, writing Philosophy and going for walks.  I also compose songs and do acting.  Programming is on the topic compilers, inductive algorithm finders and philosophy.  I love animals, and secretly wrote songs with about my (human-like) pets.  I also enjoy programming about each of my books, on topics such as meditation.
%"],



),_),!.