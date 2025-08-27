% Benchmark script to measure performance improvements
:- use_module(library(statistics)).

% Timing utility
time_goal(Goal, Time) :-
    get_time(Start),
    call(Goal),
    get_time(End),
    Time is End - Start.

% Benchmark random number generation
benchmark_random(N, Time) :-
    time_goal((
        forall(between(1, N, _),
               random1(_))
    ), Time).

% Benchmark list operations
benchmark_list_ops(N, Time) :-
    time_goal((
        forall(between(1, N, I),
               (append_single([a,b,c], I, _),
                append_elements([a,b], [c,d,I], _)))
    ), Time).

% Run benchmarks
run_benchmarks :-
    writeln('=== Performance Benchmarks ==='),
    
    % Random number generation
    write('Random number generation (1000 calls): '),
    benchmark_random(1000, RandTime),
    format('~3f seconds~n', [RandTime]),
    
    % List operations
    write('List operations (1000 calls): '),
    benchmark_list_ops(1000, ListTime),
    format('~3f seconds~n', [ListTime]),
    
    writeln('=== Benchmarks Complete ===').

:- initialization(run_benchmarks).