:-include('meditatorsanddoctors.pl').
:-include('text_to_breasonings.pl').
main:-catch((meditators(A),meditators2(B),length(A,AL),length(B,BL),CL is AL+BL,
texttobr2(u,"16k_args.txt",u,u,[auto,on]),
texttobr2(u,"16k_algs.txt",u,u,[auto,on]),
texttobr2_1(CL)),Err,handle_error(Err)),halt.

handle_error(_Err):-
  halt(1).
main :- halt(1).