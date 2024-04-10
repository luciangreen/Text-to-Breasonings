:-include('text_to_breasonings.pl').
:-include('meditatorsanddoctors.pl').
:-include('meditationnoreplace2.pl').
main:-catch((meditators(A),meditators2(B),length(A,AL),length(B,BL),CL is AL+BL,N1 is 108*2,texttobr2_1(N1),texttobr2_1(CL)),Err,handle_error(Err)),halt.

handle_error(_Err):-
  halt(1).
main :- halt(1).