:-include('meditatorsanddoctors.pl').
:-include('text_to_breasonings.pl').
main:-catch((meditators(A),meditators2(B),length(A,AL),length(B,BL),CL is AL+BL,N1 is 15*4*(16000/250),time(texttobr2_1(N1)),time(texttobr2_1(CL))),Err,handle_error(Err)),halt.

handle_error(_Err):-
  halt(1).
main :- halt(1).