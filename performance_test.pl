% Simple performance benchmark
:- dynamic random_cache/2.

% Optimized version
random_fast(N) :-
    random(R),
    N is floor(R * 10).

generate_batch(Batch) :-
    findall(R, (between(1, 100, _), random_fast(R)), Batch).

random_cached(N1) :-
    (random_cache(cached_random, CachedList) ->
        (CachedList = [H|T] ->
            (N1 = H, retract(random_cache(cached_random, _)), assertz(random_cache(cached_random, T)))
        ;
            generate_batch(NewBatch),
            NewBatch = [N1|Rest],
            assertz(random_cache(cached_random, Rest))
        )
    ;
        generate_batch(NewBatch),
        NewBatch = [N1|Rest],
        assertz(random_cache(cached_random, Rest))
    ).

% Original version (simulation)
random_original(N) :-
    random(R1), random(R2),
    N1 is floor(R1 * 10), N2 is floor(R2 * 10),
    atom_concat(N1, N2, Atom),
    atom_number(Atom, N).

% Timing utility  
time_goal(Goal, Time) :-
    statistics(cputime, Start),
    call(Goal),
    statistics(cputime, End),
    Time is End - Start.

% Benchmark tests
benchmark_cached_random(N, Time) :-
    retractall(random_cache(_,_)),  % Clear cache
    time_goal((
        forall(between(1, N, _), random_cached(_))
    ), Time).

benchmark_original_random(N, Time) :-
    time_goal((
        forall(between(1, N, _), random_original(_))
    ), Time).

run_benchmark :-
    writeln('=== Performance Comparison ==='),
    N = 1000,
    
    write('Original random (1000 calls): '),
    benchmark_original_random(N, OriginalTime),
    format('~6f seconds~n', [OriginalTime]),
    
    write('Cached random (1000 calls): '),  
    benchmark_cached_random(N, CachedTime),
    format('~6f seconds~n', [CachedTime]),
    
    (OriginalTime > 0 ->
        Speedup is OriginalTime / CachedTime,
        format('Speedup: ~2fx faster~n', [Speedup])
    ;
        writeln('Speedup: Too fast to measure accurately')
    ),
    
    writeln('=== Benchmark Complete ===').

:- initialization(run_benchmark).