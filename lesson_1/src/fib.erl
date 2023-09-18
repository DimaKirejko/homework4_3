-module(fib).
-export([fib/1]).

fib(0) ->%%% обробка нульового значення N
    1;

fib(N) when N >= 1 ->
    fib(N, {1, 1}).



fib(0, {A, _B}) ->
    A;

fib(N, {A, B}) when N > 0 ->
    fib(N - 1, {B, A + B}).



-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
fib_test_() -> [
?_assert(fib(0) =:= 1),
?_assert(fib(1) =:= 1),
?_assert(fib(2) =:= 2),
?_assert(fib(3) =:= 3),
?_assert(fib(4) =:= 5),
?_assert(fib(5) =:= 8),
?_assertException(error, function_clause, fib(-1)),
?_assert(fib(31) =:= 2178309)].
-endif.