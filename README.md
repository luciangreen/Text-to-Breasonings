# TextToBreasoning Documentation

* TextToBreasoning (T2B) is a set of algorithms that allow breasoning out (in this case, the computer thinks of the x, y and z dimensions of) objects to help earn high distinctions, have healthy children, earn jobs, sell products, produce quantum energy, <a href="https://github.com/luciangreen/mindreader">read minds, display spiritual screens</a> or time travel.  T2B automates breasoning, where breasoning prevents possible health problems of other methods (see Disclaimer).

* TextToBreasonings can (1) breason out words over a local machine and a Virtual Private Server (a server that you can use as central which has environmental advantages) (VPS) host, (2) breason out characters over a local machine or (3) breason out words, breathsonings (judgement adjectives and adverbs), rooms, parts of rooms, directions in rooms, objects to prepare for an action and objects to finish an action over a local machine.

* Generally, 80 word breasonings are needed to earn a high distinction at undergraduate level and below, have healthy children or sell products.  This increases to 2 * 15 * 80=2400 breasonings per Honours level chapter, approximately 2 * 50 * 80=8000 breasonings per Masters level assignment and approximately 2 * 4 * 50 * 80=32,000 breasonings per PhD level assignment.

* 50 As (50 * 80=4000 breasonings) are required to earn a job.

* A time machine is being developed.

# Getting Started

Please read the following instructions on how to install the project on your computer for breasoning.

# Prerequisites

Install List Prolog Interpreter Repository (https://github.com/luciangreen/listprologinterpreter).

Install Algorithm Writer with Lists Repository (https://github.com/luciangreen/Algorithm-Writer-with-Lists).

### Caution:

* Before running texttobr, think of two radio buttons put on recordings, put through with prayer, nut and bolt, quantum box prayer 1, 1, 0.5 cm and 1, 1, 0.5 cm.

follow instructions in <a href="https://github.com/luciangreen/Text-to-Breasonings/blob/master/Instructions_for_Using_texttobr(2).pl.txt">Instructions for Using texttobr(2)</a> when using texttobr, texttobr2 or mind reader to avoid medical problems.


# Installation from List Prolog Package Manager (LPPM)

* Optionally, you can install from LPPM by installing <a href="https://www.swi-prolog.org/build/">SWI-Prolog</a> for your machine, downloading the <a href="https://github.com/luciangreen/List-Prolog-Package-Manager">LPPM Repository</a>,
```
git clone https://github.com/luciangreen/List-Prolog-Package-Manager.git
```
loading LPPM with `['lppm'].` then installing the package by running `lppm_install("luciangreen","Text-to-Breasonings").`.

# Installing and Running

* Please download and install SWI-Prolog for your machine at https://www.swi-prolog.org/build/.

* Download the repository to your machine.

* (1) To breason out words over a local machine and a VPS host, in the SWI-Prolog environment, enter:
`['../listprologinterpreter/listprolog'].`
`[texttobr2].`

* Please follow the instructions in <a href="https://github.com/luciangreen/Text-to-Breasonings/blob/master/Setting_up_a_VPS_with_TextToBr.txt">"Setting up a VPS with TextToBr.txt"</a> to set up a VPS with TextToBr up to and including "Upload them to the VPS's...".

* In the SWI-Prolog environment, enter:
`texttobr2(N,File,String,M).`
* where N is the number of times to breason out the file, File is the file name, String is the string to breason out and M is the number of words in the file to breason out, e.g.:
`texttobr2(u,"file.txt",u,u).`
* Breasons out file.txt.
`texttobr2(2,"file.txt",u,u).`
* Breasons out file.txt twice.
`texttobr2(u,u,"Hello world.",u).`
* Breason out "Hello world.".
`texttobr2(3,u,"a b c",2).`
* Breasons out the first two words in "a b c" ("a" and "b") 3 times.

* (2) To breason out characters over a local machine, in the SWI-Prolog environment, enter:
`[texttobr].`

* In the SWI-Prolog environment, enter:
`texttobr(N,File,String,M).`
* where N is the number of times to breason out the file, File is the file name, String is the string to breason out and M is the number of words in the file to breason out, e.g.:
`texttobr(u,"file.txt",u,u).`
* Breasons out file.txt.
`texttobr(2,"file.txt",u,u).`
* Breasons out file.txt twice.
`texttobr(u,u,"Hello world.",u).`
* Breason out "Hello world.".
`texttobr(3,u,"abc",2).`
* Breasons out the first two characters in "abc" ("a" and "b") 3 times.

* (3) To breason out words, breathsonings (judgement adjectives and judgement adverbs), rooms, parts of rooms, directions in rooms, objects to prepare for an action and objects to finish an action over a local machine, in the SWI-Prolog environment, enter:
`['text_to_breasonings.pl'].`

* In the SWI-Prolog environment, enter:
`texttobr2(u,u,u,u,false,false,false,false,false,false).`
* where the first four arguments may be changed as in (1) above, and only words are breasoned out.
`texttobr2(u,u,u,u,true,false,false,false,false,false).`
* where the first four arguments may be changed as in (1) above, and only words and breathsonings are breasoned out.
`texttobr2(u,u,u,u,true,true,true,true,true,true).`
* where the first four arguments may be changed as in (1) above, and words, breathsonings (judgement adjectives and judgement adverbs), rooms, parts of rooms, directions in rooms, objects to prepare for an action and objects to finish an action are breasoned out.

# Installing and Running T2B with VPS Synchronisation

* Use a Virtual Private Server (VPS) Sync to breason out new meditators' names on your machine, sync with the VPS, and run meditation and text to breasonings on the VPS (by pasting <a href="https://github.com/luciangreen/Text-to-Breasonings/blob/master/rcaw.paste">rcaw.paste</a> into the terminal.  
* Install this repository using the instructions above.

* To install, in <a href="in username folder/texttobr2.sh">in username folder/texttobr2.sh</a> replace the the path `/username/codefolder/` with the location of the installation of this repository and move the file to i.e. your `/username/` folder.

* To run, type `./texttobr2.sh` in the `/username/` folder and T2B wil run (breasoning out only breasonings, not breathsonings, etc.), syncing with the VPS.

# Repairing Corrupt Dictionary Files

* If you accidentally enter a mistake in Text to Breasonings, you can repair the dictionary files using the following method.

* Find texttobrall2.pl or your Text to Breasonings algorithm file.
<img width="276" alt="Screen Shot 2019-12-13 at 10 46 18 pm" src="https://user-images.githubusercontent.com/15845542/70798770-f3a69980-1dfb-11ea-963e-5ac741275c98.png">
* Open with BBEdit.
<img width="29" alt="Screen Shot 2019-12-13 at 10 46 32 pm" src="https://user-images.githubusercontent.com/15845542/70798772-f3a69980-1dfb-11ea-9667-f8d39ac8ab67.png">
* Find the line containing "%%{writeln(L)}".  For brdict2.txt find the line ""%%{writeln(L)}" following "filet([L|Ls]) --> entryt(L),",",".
<img width="434" alt="Screen Shot 2019-12-13 at 10 46 48 pm" src="https://user-images.githubusercontent.com/15845542/70798773-f3a69980-1dfb-11ea-8613-70fbc3a3715f.png">
* Uncomment (delete "%%") the lines "%%{writeln(L)}" and (another below it) "%%{writeln(L)}" and save the file.
<img width="435" alt="Screen Shot 2019-12-13 at 10 47 02 pm" src="https://user-images.githubusercontent.com/15845542/70798775-f43f3000-1dfb-11ea-8eca-b96d68292e98.png">
* Load Text to Breasonings with: ['text_to_breasonings.pl'].
* Run Text to Breasonings with i.e. "N=u,M=u,texttobr2(N,"file.txt",u,M,false,false,false,false,false,false).".
<img width="1076" alt="Screen Shot 2019-12-13 at 10 47 52 pm" src="https://user-images.githubusercontent.com/15845542/70798776-f4d7c680-1dfb-11ea-9753-3159cd704d54.png">
* Read the final dictionary entry before the error.
<img width="426" alt="Screen Shot 2019-12-13 at 10 51 00 pm" src="https://user-images.githubusercontent.com/15845542/70798779-f4d7c680-1dfb-11ea-9b4d-646ed063c32f.png">
* Open the dictionary file with BBEdit.
<img width="350" alt="Screen Shot 2019-12-13 at 10 51 21 pm" src="https://user-images.githubusercontent.com/15845542/70798783-f608f380-1dfb-11ea-9e7e-39d484611c98.png">
* Locate the final entry "[tz,dash]," before the error "[⁃,dash],".
<img width="726" alt="Screen Shot 2019-12-13 at 10 51 50 pm" src="https://user-images.githubusercontent.com/15845542/70798785-f6a18a00-1dfb-11ea-9c61-119537a80260.png">
* Delete or modify "[⁃,dash]," so that it doesn't contain the illegal character "⁃".
<img width="770" alt="Screen Shot 2019-12-13 at 10 52 12 pm" src="https://user-images.githubusercontent.com/15845542/70798786-f6a18a00-1dfb-11ea-9c89-9b8104d7e87f.png">
* Reenter the comments ("%%") that were removed before.
<img width="442" alt="Screen Shot 2019-12-13 at 10 52 32 pm" src="https://user-images.githubusercontent.com/15845542/70798787-f73a2080-1dfb-11ea-8fd5-711f492f3306.png">
* Load Text to Breasonings with: ['text_to_breasonings.pl']. ['texttobrall2'].
* Run Text to Breasonings with i.e. "N=u,M=u,texttobr2(N,"file.txt",u,M,false,false,false,false,false,false)." to check the dictionary file is not corrupt.
<img width="1052" alt="Screen Shot 2019-12-13 at 10 53 25 pm" src="https://user-images.githubusercontent.com/15845542/70798790-f7d2b700-1dfb-11ea-9c37-8d4ab5976a9b.png">


# Versioning

We will use SemVer for versioning.

# Authors

Lucian Green - Initial programmer - <a href="https://www.lucianacademy.com/">Lucian Academy</a>

# License

I licensed this project under the BSD3 License - see the LICENSE.md file for details


# Addendum

<a href="https://github.com/luciangreen/Text-to-Breasonings/blob/master/rcaw.paste">rcaw.paste</a> added - this can be run each day to meet daily regimen requirements, such as preventing unwanted thoughts (<a href="https://github.com/luciangreen/Text-to-Breasonings/blob/master/mindreadtestsec.pl">mindreadtestsec.pl</a>), giving meditators thoughts (<a href="https://github.com/luciangreen/Text-to-Breasonings/blob/master/mindreadingcaw.pl">mindreadingcaw.pl</a>), giving thoughts about psychoanalysis (<a href="https://github.com/luciangreen/Text-to-Breasonings/blob/master/mindreadtestpsychiatrist.pl">mindreadtestpsychiatrist.pl</a>) and giving philosophical details(<a href="https://github.com/luciangreen/Text-to-Breasonings/blob/master/mindreadtestsecthoughts.pl">mindreadtestsecthoughts.pl</a>).
