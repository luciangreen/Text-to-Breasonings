% Test script to verify optimizations work
:- consult('mindreadingcaw.pl').

% Simple test of the optimization functions
test_optimize_basic :-
    write('Testing basic optimization... '),
    Program = [[append,[a,b,c]],[append,[a,b,c]]],
    InputVars1 = [a,b],
    InputVars2 = [a,b,c],
    PenultimateVars = [c],
    optimise(Program, InputVars1, InputVars2, PenultimateVars, Result),
    write('Result: '), writeln(Result),
    writeln('Basic optimization test passed!').

% Test random number caching
test_random_cache :-
    write('Testing random number caching... '),
    random1(N1),
    random1(N2),
    random1(N3),
    write('Generated numbers: '),
    write(N1), write(', '), write(N2), write(', '), writeln(N3),
    writeln('Random cache test passed!').

% Test list optimizations
test_list_ops :-
    write('Testing optimized list operations... '),
    append_single([a,b], c, Result1),
    append_elements([a,b], [c,d], Result2),
    write('append_single result: '), write(Result1),
    write(', append_elements result: '), writeln(Result2),
    writeln('List operations test passed!').

% Run all tests
run_tests :-
    writeln('=== Running Optimization Tests ==='),
    catch(test_random_cache, Error1, (write('Random test failed: '), writeln(Error1))),
    catch(test_list_ops, Error2, (write('List ops test failed: '), writeln(Error2))),
    catch(test_optimize_basic, Error3, (write('Optimization test failed: '), writeln(Error3))),
    writeln('=== Tests Complete ===').

% Entry point
:- initialization(run_tests).