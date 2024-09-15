:-include('../listprologinterpreter/la_strings.pl').

cp(From,To) :-
	Scp="scp -pr ",
	concat_list([Scp,From," ",To],Command),
	shell1_s(Command).
	
mv(From,To) :-
	Mv="rsync -avz --remove-source-files ",
	concat_list([Mv,From," ",To],Command),
	shell1_s(Command).

rm(Path) :-
	Rm="rm -rf ",
	concat_list([Rm," ",Path],Command),
	shell1_s(Command).
	