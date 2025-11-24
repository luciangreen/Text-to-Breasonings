:-include('../listprologinterpreter/la_strings.pl').

cp(From,To) :-
	Rsync="rsync -avz ",
	concat_list([Rsync,From," ",To],Command),
	shell1_s(Command).
	
mv(From,To) :-
	Mv="rsync -avz --remove-source-files ",
	concat_list([Mv,From," ",To],Command),
	shell1_s(Command).

rm(Path) :-
	Rm="rm -rf ",
	concat_list([Rm," ",Path],Command),
	shell1_s(Command).
	