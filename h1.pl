:-include('cgpt_combophil10.pl').
main :- open_string_file_s("../Text-to-Breasonings/file.txt",A),split_string(A,".\n\r",".\n\r",B),delete(B,"",A1),findall(C,(member(C,A1),string_chars(C,D),not(forall(member(E,D),char_type(E,white)))),F),

findall(_,(member(G,F),
cgpt_combophil(["SALES","FINANCE","ECONOMICS","BOTS"],30,G)),_),!.

% 10 ugrad
% 20 honours
% 30 master
% 40 research master
% 50 phd
