% big_connections_with_bag3_and_mr.pl

% This will conclude the philosophy project,
% writing 16*n joined details.

:-include('../Text-to-Breasonings/bag2philn.pl').

big_connections_with_bag3_and_mr(File_term,Br32) :-

flatten([File_term],J1),
foldr(string_concat,J1,"",J2),

split_string(J2,"\n\r.","\n\r.",J3),
delete(J3,"",J4),
length(J4,Length),
Length2 is Length*16,
%trace,
 bag2phil2(Length2,J2,2,Br32),!. 
