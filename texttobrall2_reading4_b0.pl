:-include('../listprologinterpreter/la_files.pl').
:-include('../listprologinterpreter/la_strings.pl').

:-include('meditatorsanddoctors.pl').
:-include('meditatorsanddoctors_children.pl').

main:-
 meditators(MM11),meditators_children(MM12),
 meditators2(MM21),meditators2_children(MM22),
 length(MM11,MM11L),length(MM12,MM12L),
 length(MM21,MM21L),length(MM22,MM22L),
 LL is MM11L-MM12L+MM21L-MM22L,
 length(LL0,LL),
 % ./b01 and ./b02 after being renamed in Time_Machine/Instructions to freeze age - T2B4 (Faster).txt
 % b0.sh calls ./b01 and ./b02
 % b00.sh with permissions for age freezees attached to a simulant
 findall("./b0.sh\n",member(_,LL0),LL1),
 
  flatten(["#L=",LL,"\n",LL1],Words921),
foldr(string_concat,Words921,RWords81),

 %foldr(string_concat,Words91,RWords8),
 save_file_s("b00.sh",RWords81), 

 shell1_s("chmod +x b00.sh"),
 !.
 