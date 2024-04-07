%SN=1
main:-catch(a,Err,handle_error(Err)),halt.
handle_error(_Err):-
  halt(1).
main :- halt(1).
a:-a1([box,1,1,1]).
a1([box,1,1,1]).
