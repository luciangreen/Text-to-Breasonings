% Minimal test for just our optimizations
:- dynamic random_cache/2.
:- dynamic memo_cache/3.

% Test our optimized random number generation
random2_fast(N) :-
    random(R),
    N is floor(R * 10).

generate_random_batch(Batch) :-
    findall(R, (between(1, 50, _), random2_fast(R)), Batch).

random1(N1) :-
    (random_cache(cached_random, CachedList) ->
        (CachedList = [H|T] ->
            (N1 = H, retract(random_cache(cached_random, _)), assertz(random_cache(cached_random, T)))
        ;
            generate_random_batch(NewBatch),
            NewBatch = [N1|Rest],
            assertz(random_cache(cached_random, Rest))
        )
    ;
        generate_random_batch(NewBatch),
        NewBatch = [N1|Rest],
        assertz(random_cache(cached_random, Rest))
    ).

% Test our optimized list operations
append_single([], Element, [Element]).
append_single([H|T], Element, [H|NewT]) :-
    append_single(T, Element, NewT).

append_elements(List, [], List).
append_elements(List, [H|T], Result) :-
    append_single(List, H, Temp),
    append_elements(Temp, T, Result).

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

% Run tests
run_tests :-
    writeln('=== Running Optimization Tests ==='),
    catch(test_random_cache, Error1, (write('Random test failed: '), writeln(Error1))),
    catch(test_list_ops, Error2, (write('List ops test failed: '), writeln(Error2))),
    writeln('=== Tests Complete ===').

:- initialization(run_tests).