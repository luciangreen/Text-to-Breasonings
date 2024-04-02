:-include('meditatorsanddoctors.pl').
:-include('text_to_breasonings.pl').
main:-meditators(A),meditators2(B),length(A,AL),length(B,BL),CL is AL+BL,N is 11520*CL,time(texttobr2_1(N)).
