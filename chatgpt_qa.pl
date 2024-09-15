:- use_module(library(http/json)).
:- include('../Text-to-Breasonings/text_to_breasonings.pl').
%:-include('../listprologinterpreter/la_strings.pl').
%:-include('../listprologinterpreter/la_maths.pl').
%:-include('../listprologinterpreter/la_files.pl').
:-include('chatgpt_qa_key.pl').

%secret_key("").

q(Q0,A) :-

SepandPad2="&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\t\\\"!'0123456789", % no space
split_string(Q0,SepandPad2,Q01),
findall([X," "],member(X,Q01),Q02),
flatten(Q02,Q03),
foldr(string_concat,Q03,Q),

%secret_key(Secret_key),
%working_directory1(WD,WD),
%working_directory1(_,"../../Daily-Regimen/"),
%open_string_file_s("chatgpt_qa_key.txt",Secret_key),
chatgpt_key(Secret_key),

(Secret_key=""->
fail;true),

%working_directory1(_,WD),
%split_string(Q," "," ",Q1),
%length(Q1,L),
%MT is 4096-L-100,
Command1=["curl https://api.openai.com/v1/chat/completions \c
  -H \"Content-Type: application/json\" \c
  -H \"Authorization: Bearer ",Secret_key,"\" \c
  -d '{
    \"model\": \"gpt-4o-mini\",
    \"messages\": [
      {
        \"role\": \"system\",
        \"content\": \"You are a helpful assistant.\"
      },
      {
        \"role\": \"user\",
        \"content\": \"",Q,"\"
      }
    ]
  }'
"
],
  foldr(string_concat,Command1,Command),
  
  find_first((repeat,
catch((bash_command(Command,Output),%->
					%true;
					%(writeln(["Failed shell1 command: ",Command]),fail)
				%),_,fail),!,
				

%?- % to enable json_read_dict/2
%?- FPath = '/home/xxx/dnns/test/params.json', open(FPath, read, Stream), 
atom_string(Output1,Output),
%(catch((
atom_json_term(Output1, A1, []),
%A1=json([_,_,_,_,choices=[json([text=A2|_])]|_]),
%trace,
%A1=json([_, _, _, _, choices=[json([_, message=json([_, content=A2])|_])]|_]),
A1=json([_, _, _, _, choices=[json([_, message=json([_, content=A2|_])| _])]|_]),
atom_string(A2,A)
,writeln(A)),_,fail)->true;
(N is 60*5,sleep(N),fail))).
%atom_json_term(?Atom, ?JSONTerm, +Options)

