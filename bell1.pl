bell(Spoken_notification) :-
 catch((bell1(Spoken_notification)->true;true),_,true),!.
 
bell1(Spoken_notification) :-
 %alarm_clock(H,M),
 /*
 string_codes(S,[101, 99, 104, 111, 32, %022, %86,
  007%, 71
  ]),*/
  
  os_running(OS),

  (OS=macos->
  foldr(string_concat,["afplay /System/Library/Sounds/Funk.aiff\n","say \""%done"%"echo "
 ,%""%
 Spoken_notification,
 "\""],S1);

 (OS=linux->
 foldr(string_concat,["echo -e '\a'\n","spd-say \""%done"%"echo "
 ,%""%
 Spoken_notification,
 "\""],S1);

 (OS=windows->
 foldr(string_concat,["ECHO \"^G\"\n","PowerShell -Command \"Add-Type –AssemblyName System.Speech; (New-Object System.Speech.Synthesis.SpeechSynthesizer).Speak('",Spoken_notification,"');\""],S1);
 fail))),
 
 shell1_s(S1).

os_running(OS) :-
 (current_prolog_flag(arch, _Arch)->OS=macos;
 (current_prolog_flag(unix, U)->US=linux;
 (current_prolog_flag(windows, W)->OS=windows;
 OS=other))),!.
