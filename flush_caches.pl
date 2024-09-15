:-include('../Text-to-Breasonings/text_to_breasonings.pl').
:-include('../t2ab/t2ab.pl').
:-include('../listprologinterpreter/la_files.pl').
%:-include('../Lucian-Academy/word_count.pl').

%bag_args(96000).

flush_caches :-

open_string_file_s("arg_cache.txt",File_string_b_cache),
 term_to_atom([_Cache_N,File_string2_b_cache],File_string_b_cache),


open_string_file_s("alg_cache.txt",File_string_b_cache2),
 term_to_atom([_Cache_N2,File_string2_b_cache2],File_string_b_cache2),


 
 string_concat(File_string2_b_cache,File_string2_b_cache2,N7),
 
 
 %word_count(["string",N7],WC),
 
 texttobr2(u,u,N7,u,[auto,on]),
 t2ab(u,u,N7,u,on),
 term_to_atom([0,""],Cache_atom),
  open_s("arg_cache.txt",write,Stream1a_cache),
	write(Stream1a_cache,Cache_atom),
	close(Stream1a_cache),

  open_s("alg_cache.txt",write,Stream1a_cache1),
	write(Stream1a_cache1,Cache_atom),
	close(Stream1a_cache1),
	!.