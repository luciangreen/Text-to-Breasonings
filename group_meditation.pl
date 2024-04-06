:-include('text_to_breasonings.pl').
:-include('meditatorsanddoctors.pl').
:-include('meditationnoreplace2.pl').
main:-meditators(A),meditators2(B),length(A,AL),length(B,BL),CL is AL+BL,N is 108*2*CL,texttobr2_1(N).
