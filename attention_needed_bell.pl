:-include('bell.pl').
main:-catch(attention_needed_bell,Err,handle_error(Err)),halt.
main :- halt(1).
handle_error(_Err):-
  halt(1).
attention_needed_bell :-
catch((bell("Attention needed")->true;true),_,true),!.